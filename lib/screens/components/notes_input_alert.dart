import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../collections/note.dart';
import '../../collections/work_history.dart';
import '../../extensions/extensions.dart';
import '../../repository/notes_repository.dart';

class NotesInputAlert extends ConsumerStatefulWidget {
  const NotesInputAlert({
    super.key,
    required this.isar,
    required this.yearmonth,
    this.totalWorkHistoryMap,
    required this.agentMap,
  });

  final Isar isar;

  final String yearmonth;

  final WorkHistory? totalWorkHistoryMap;

  final Map<int, String> agentMap;

  @override
  ConsumerState<NotesInputAlert> createState() => _NotesInputAlertState();
}

class _NotesInputAlertState extends ConsumerState<NotesInputAlert> {
  Note? note;

  final TextEditingController _noteEditingController = TextEditingController();

  ///
  @override
  void initState() {
    super.initState();

    getYearmonthNote();
  }

  ///
  @override
  Widget build(BuildContext context) {
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
          style: const TextStyle(fontSize: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                Container(width: context.screenSize.width),
                const Text('職歴ノート登録'),
                if (widget.totalWorkHistoryMap != null) ...<Widget>[
                  Text(widget.totalWorkHistoryMap!.site),
                  Text(widget.agentMap[widget.totalWorkHistoryMap!.agentId] ?? '-'),
                ],
                if (widget.totalWorkHistoryMap == null) ...<Widget>[const Text('-'), const Text('-')],
                Divider(color: Colors.white.withOpacity(0.4), thickness: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(),
                    if (note != null)
                      TextButton(
                        onPressed: _editNote,
                        child: const Text(
                          'ノートを更新する',
                          style: TextStyle(fontSize: 12),
                        ),
                      )
                    else
                      TextButton(
                        onPressed: _inputNote,
                        child: const Text(
                          'ノートを追加する',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                  ],
                ),
                _displayInputParts(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///
  Future<void> getYearmonthNote() async {
    await NotesRepository().getNoteByYearmonth(isar: widget.isar, yearmonth: widget.yearmonth).then((Note? value) {
      if (mounted) {
        setState(() {
          if (value != null && value.note != '') {
            note = value;

            _noteEditingController.text = value.note;
          }
        });
      }
    });
  }

  ///
  Widget _displayInputParts() {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(blurRadius: 24, spreadRadius: 16, color: Colors.black.withOpacity(0.2)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
          child: Container(
            width: context.screenSize.width,
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
            ),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _noteEditingController,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    hintText: 'ノート',
                    filled: true,
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white54)),
                  ),
                  style: const TextStyle(fontSize: 13, color: Colors.white),
                  onTapOutside: (PointerDownEvent event) => FocusManager.instance.primaryFocus?.unfocus(),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///
  Future<void> _inputNote() async {
    final Note note = Note()
      ..startDate = widget.yearmonth
      ..note = _noteEditingController.text.trim();

    await NotesRepository().inputNote(isar: widget.isar, note: note).then(
      // ignore: always_specify_types
      (value) {
        _noteEditingController.clear();

        if (mounted) {
          Navigator.pop(context);
        }
      },
    );
  }

  ///
  Future<void> _editNote() async {
    await widget.isar.writeTxn(() async {
      await NotesRepository()
          .getNoteByYearmonth(isar: widget.isar, yearmonth: widget.yearmonth)
          .then((Note? value) async {
        value!.note = _noteEditingController.text.trim();

        // ignore: always_specify_types
        await NotesRepository().updateNote(isar: widget.isar, note: value).then((value) {
          _noteEditingController.clear();

          if (mounted) {
            Navigator.pop(context);
          }
        });
      });
    });
  }
}
