import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_plus/share_plus.dart';

import '../../../collections/agent.dart';
import '../../../collections/note.dart';
import '../../../collections/work_history.dart';
import '../../../extensions/extensions.dart';
import '../../../repository/agents_repository.dart';
import '../../../repository/notes_repository.dart';
import '../../../repository/work_histories_repository.dart';
import '../parts/error_dialog.dart';

part 'data_export_alert.freezed.dart';

part 'data_export_alert.g.dart';

class DataExportAlert extends ConsumerStatefulWidget {
  const DataExportAlert({super.key, required this.isar});

  final Isar isar;

  @override
  ConsumerState<DataExportAlert> createState() => _DataExportAlertState();
}

class _DataExportAlertState extends ConsumerState<DataExportAlert> {
  List<String> outputValuesList = <String>[];

  List<XFile> sendFileList = <XFile>[];
  List<String> sendFileNameList = <String>[];

  List<String> displayFileNameList = <String>[];

  ///
  @override
  void initState() {
    super.initState();

    outputValuesList.clear();

    sendFileNameList.clear();
    sendFileList.clear();

    displayFileNameList.clear();
  }

  ///
  @override
  Widget build(BuildContext context) {
    final String csvName = ref.watch(dataExportProvider.select((DataExportState value) => value.csvName));

    final List<String> colorChangeFileNameList = <String>[];
    for (final String element in displayFileNameList) {
      colorChangeFileNameList.add(element.split('_')[0]);
    }

    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: double.infinity,
        child: DefaultTextStyle(
          style: GoogleFonts.kiwiMaru(fontSize: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(width: context.screenSize.width),
              const SizedBox(height: 20),
              const Text('データエクスポート'),
              Divider(color: Colors.white.withOpacity(0.4), thickness: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <String>['agent', 'workHistory', 'note'].map(
                  (String e) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              ref.read(dataExportProvider.notifier).setCsvName(csvName: e);
                            },
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: (colorChangeFileNameList.contains(e))
                                  ? Colors.greenAccent.withOpacity(0.3)
                                  : (csvName == e)
                                      ? Colors.yellowAccent.withOpacity(0.3)
                                      : Colors.white.withOpacity(0.3),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(e),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => csvOutput(),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent.withOpacity(0.2)),
                      child: const Text('csv選択'),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => csvSend(),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent.withOpacity(0.2)),
                      child: const Text('送信'),
                    ),
                  ),
                ],
              ),
              Divider(color: Colors.white.withOpacity(0.4), thickness: 5),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: displayFileNameList.map((String e) {
                  return Text(e);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Future<void> csvOutput() async {
    outputValuesList.clear();

    final String csvName = ref.watch(dataExportProvider.select((DataExportState value) => value.csvName));

    if (csvName == '') {
      getErrorDialog(title: '出力できません。', content: '出力するデータを正しく選択してください。');

      return;
    }

    outputValuesList.add('export_csv_from_shokumukeirekisho');

    switch (csvName) {
      case 'agent':
        await AgentsRepository().getAgentList(isar: widget.isar).then((List<Agent>? value) {
          value?.forEach((Agent element) {
            final int luf = (element.listUseFlag) ? 0 : 1;

            outputValuesList.add(<String>[element.id.toString(), element.name, luf.toString()].join(','));
          });
        });

      case 'workHistory':
        await WorkHistoriesRepository().getWorkHistoryList(isar: widget.isar).then((List<WorkHistory>? value) {
          value?.forEach((WorkHistory element) {
            outputValuesList.add(<Object>[
              element.id.toString(),
              element.startDate,
              element.site,
              element.agentId.toString(),
              element.factFake,
            ].join(','));
          });
        });

      case 'note':
        await NotesRepository().getNoteList(isar: widget.isar).then((List<Note>? value) {
          value?.forEach((Note element) {
            outputValuesList.add(<String>[
              element.id.toString(),
              element.startDate,
              element.note,
            ].join(','));
          });
        });
    }

    final DateTime now = DateTime.now();
    final DateFormat timeFormat = DateFormat('HHmmss');
    final String currentTime = timeFormat.format(now);

    final String year = now.year.toString();
    final String month = now.month.toString().padLeft(2, '0');
    final String day = now.day.toString().padLeft(2, '0');

    final String dateStr = '${csvName}_$year$month$day$currentTime';
    final String sendFileName = '$dateStr.csv';

    final String contents = outputValuesList.join('\n');

    // final Uint8List encoded =
    //     await CharsetConverter.encode('Shift_JIS', contents);

    final List<int> byteList = utf8.encode(contents);

    final Uint8List encoded = Uint8List.fromList(byteList);

    sendFileNameList.add(sendFileName);
    sendFileList.add(XFile.fromData(encoded, mimeType: 'text/plain'));

    setState(() {
      displayFileNameList = sendFileNameList;
    });
  }

  ///
  void getErrorDialog({required String title, required String content}) {
    // ignore: always_specify_types
    Future.delayed(
      Duration.zero,
      () {
        if (mounted) {
          return error_dialog(context: context, title: title, content: content);
        }
      },
    );
  }

  ///
  Future<void> csvSend() async {
    if (sendFileList.isEmpty || sendFileNameList.isEmpty) {
      getErrorDialog(title: '送信できません。', content: '送信するデータを正しく選択してください。');

      return;
    }

    final RenderBox? box = context.findRenderObject() as RenderBox?;

    await Share.shareXFiles(
      sendFileList,
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      fileNameOverrides: sendFileNameList,
    );

    if (mounted) {
      outputValuesList.clear();

      sendFileNameList.clear();
      sendFileList.clear();

      Navigator.pop(context);
    }
  }
}

@freezed
class DataExportState with _$DataExportState {
  const factory DataExportState({
    @Default('') String csvName,
  }) = _DummyDownloadState;
}

@riverpod
class DataExport extends _$DataExport {
  ///
  @override
  DataExportState build() {
    return const DataExportState();
  }

  ///
  void setCsvName({required String csvName}) {
    state = state.copyWith(csvName: csvName);
  }
}
