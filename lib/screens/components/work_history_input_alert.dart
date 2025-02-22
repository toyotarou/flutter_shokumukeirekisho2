import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../collections/agent.dart';
import '../../collections/work_history.dart';
import '../../controllers/controllers_mixin.dart';
import '../../extensions/extensions.dart';
import '../../repository/agent_repository.dart';
import '../../repository/work_histories_repository.dart';
import '../home_screen.dart';
import 'parts/error_dialog.dart';

class WorkHistoryInputAlert extends ConsumerStatefulWidget {
  const WorkHistoryInputAlert(
      {super.key,
      required this.ymStart,
      required this.isar,
      required this.site,
      required this.agentId,
      this.workHistoryList,
      required this.factFake});

  final Isar isar;

  final String ymStart;

  final String site;

  final int agentId;

  final List<WorkHistory>? workHistoryList;

  final int factFake;

  @override
  ConsumerState<WorkHistoryInputAlert> createState() => _WorkHistoryInputAlertState();
}

class _WorkHistoryInputAlertState extends ConsumerState<WorkHistoryInputAlert>
    with ControllersMixin<WorkHistoryInputAlert> {
  List<Agent>? agentList = <Agent>[];

  final TextEditingController _siteNameEditingController = TextEditingController();

  int _agentId = 0;

  int dataPos = 0;

  ///
  @override
  void initState() {
    super.initState();

    _makeAgentList();

    if (widget.workHistoryList != null) {
      dataPos = widget.workHistoryList!.indexWhere(
          (WorkHistory element) => element.startDate == widget.ymStart && element.factFake == widget.factFake);

      if (dataPos != -1) {
        _siteNameEditingController.text = widget.workHistoryList![0].site;
      }
    }
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              Container(width: context.screenSize.width),
              const Text('職歴登録'),
              Divider(color: Colors.white.withOpacity(0.4), thickness: 5),
              _displayInputParts(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      if (dataPos == -1) ...<Widget>[
                        TextButton(
                          onPressed: _inputWorkHistory,
                          child: const Text('職歴を追加する', style: TextStyle(fontSize: 12)),
                        ),
                      ],
                      if (dataPos != -1) ...<Widget>[
                        TextButton(
                          onPressed: _updateWorkHistory,
                          child: const Text('職歴を更新する', style: TextStyle(fontSize: 12)),
                        ),
                        TextButton(
                          onPressed: _showDeleteDialog,
                          child: const Text('職歴を削除する', style: TextStyle(fontSize: 12)),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget _displayInputParts() {
    // ignore: strict_raw_type, always_specify_types
    final List<DropdownMenuItem> dropdownMenuItem = [
      // ignore: always_specify_types
      const DropdownMenuItem(value: 0, child: Text('', style: TextStyle(fontSize: 12))),
    ];
    agentList?.forEach((Agent element) {
      dropdownMenuItem.add(
        // ignore: always_specify_types
        DropdownMenuItem(value: element.id, child: Text(element.name, style: const TextStyle(fontSize: 12))),
      );
    });

    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[BoxShadow(blurRadius: 24, spreadRadius: 16, color: Colors.black.withOpacity(0.2))],
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(widget.ymStart),
                    Text((dataPos == -1) ? 'insert' : 'update'),
                  ],
                ),

                // ignore: always_specify_types
                DropdownButton(
                  isExpanded: true,
                  dropdownColor: Colors.pinkAccent.withOpacity(0.1),
                  iconEnabledColor: Colors.white,
                  // ignore: always_specify_types
                  items: dropdownMenuItem.map((element) => element).toList(),
                  value: _agentId,
                  // ignore: always_specify_types
                  onChanged: (value) => setState(() => _agentId = value.toString().toInt()),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _siteNameEditingController,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    hintText: '現場名',
                    filled: true,
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white54)),
                  ),
                  style: const TextStyle(fontSize: 13, color: Colors.white),
                  onTapOutside: (PointerDownEvent event) => FocusManager.instance.primaryFocus?.unfocus(),
                ),
                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      // ignore: use_if_null_to_convert_nulls_to_bools
                      (appParamState.factFakeMap[widget.ymStart] == true) ? 'fact' : 'fake',
                      style: TextStyle(
                        // ignore: use_if_null_to_convert_nulls_to_bools
                        color: (appParamState.factFakeMap[widget.ymStart] == true) ? Colors.white : Colors.yellowAccent,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _agentId = 0;
                            _siteNameEditingController.clear();
                          });
                        },
                        icon: const Icon(Icons.close)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///
  Future<void> _makeAgentList() async {
    agentList = <Agent>[];

    await AgentRepository().getAgentList(isar: widget.isar).then((List<Agent>? value) {
      if (mounted) {
        setState(() => agentList = value);
      }
    });
  }

  ///
  Future<void> _inputWorkHistory() async {
    bool errFlg = false;

    if (_siteNameEditingController.text.trim() == '') {
      errFlg = true;
    }

    if (errFlg) {
      // ignore: always_specify_types
      Future.delayed(
        Duration.zero,
        () => error_dialog(
            // ignore: use_build_context_synchronously
            context: context,
            title: '登録できません。',
            content: '値を正しく入力してください。'),
      );

      return;
    }

    final WorkHistory workHistory = WorkHistory()
      ..startDate = widget.ymStart
      ..site = _siteNameEditingController.text.trim()
      ..agentId = _agentId
      ..factFake = widget.factFake;

    await WorkHistoriesRepository().inputWorkHistory(isar: widget.isar, workHistory: workHistory).then(
      // ignore: always_specify_types
      (value) {
        _siteNameEditingController.clear();

        if (mounted) {
          Navigator.pop(context);

          // ignore: inference_failure_on_instance_creation, always_specify_types
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(isar: widget.isar)));
        }
      },
    );
  }

  ///
  void _showDeleteDialog() {
    final Widget cancelButton = TextButton(onPressed: () => Navigator.pop(context), child: const Text('いいえ'));

    final Widget continueButton = TextButton(
        onPressed: () {
          _deleteWorkHistory();

          Navigator.pop(context);
        },
        child: const Text('はい'));

    final AlertDialog alert = AlertDialog(
      backgroundColor: Colors.blueGrey.withOpacity(0.3),
      content: const Text('このデータを消去しますか？'),
      actions: <Widget>[cancelButton, continueButton],
    );

    // ignore: inference_failure_on_function_invocation
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  ///
  Future<void> _deleteWorkHistory() async {
    WorkHistory? workHistory;

    widget.workHistoryList?.forEach((WorkHistory element) {
      if (element.startDate == widget.ymStart && element.factFake == widget.factFake) {
        workHistory = element;
      }
    });

    if (workHistory != null) {
      // ignore: always_specify_types
      WorkHistoriesRepository().deleteWorkHistory(isar: widget.isar, id: workHistory!.id).then((value) {
        if (mounted) {
          Navigator.pop(context);

          // ignore: inference_failure_on_instance_creation, always_specify_types
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(isar: widget.isar)));
        }
      });
    }
  }

  ///
  Future<void> _updateWorkHistory() async {
    bool errFlg = false;

    if (_siteNameEditingController.text.trim() == '') {
      errFlg = true;
    }

    if (errFlg) {
      // ignore: always_specify_types
      Future.delayed(
        Duration.zero,
        () => error_dialog(
            // ignore: use_build_context_synchronously
            context: context,
            title: '登録できません。',
            content: '値を正しく入力してください。'),
      );

      return;
    }

    final WorkHistory workHistory = widget.workHistoryList![dataPos]
      ..site = _siteNameEditingController.text.trim()
      ..agentId = _agentId;

    await widget.isar.writeTxn(() async {
      // ignore: always_specify_types
      await WorkHistoriesRepository().updateWorkHistory(isar: widget.isar, workHistory: workHistory).then((value) {
        _siteNameEditingController.clear();

        if (mounted) {
          Navigator.pop(context);

          // ignore: inference_failure_on_instance_creation, always_specify_types
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(isar: widget.isar)));
        }
      });
    });
  }
}
