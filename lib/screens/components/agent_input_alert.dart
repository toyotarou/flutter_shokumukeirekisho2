import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../collections/agent.dart';
import '../../extensions/extensions.dart';
import '../../repository/agent_repository.dart';
import 'parts/error_dialog.dart';

class AgentInputAlert extends ConsumerStatefulWidget {
  const AgentInputAlert({super.key, required this.isar});

  final Isar isar;

  @override
  ConsumerState<AgentInputAlert> createState() => _AgentInputAlertState();
}

class _AgentInputAlertState extends ConsumerState<AgentInputAlert> {
  final TextEditingController _agentNameEditingController = TextEditingController();

  List<Agent>? agentList = <Agent>[];

  int _agentId = 0;

  ///
  @override
  void initState() {
    super.initState();

    _makeAgentList();
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
              const Text('エージェント名登録'),
              Divider(color: Colors.white.withOpacity(0.4), thickness: 5),
              _displayInputParts(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(),
                  if (_agentId != 0)
                    TextButton(
                      onPressed: _editAgentName,
                      child: const Text(
                        'エージェント名を更新する',
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  else
                    TextButton(
                      onPressed: _inputAgentName,
                      child: const Text(
                        'エージェント名を追加する',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                ],
              ),
              Expanded(child: displayAgentNameList()),
            ],
          ),
        ),
      ),
    );
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
                  controller: _agentNameEditingController,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    hintText: 'エージェント名',
                    filled: true,
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white54)),
                  ),
                  style: const TextStyle(fontSize: 13, color: Colors.white),
                  onTapOutside: (PointerDownEvent event) => FocusManager.instance.primaryFocus?.unfocus(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///
  Future<void> _inputAgentName() async {
    bool errFlg = false;

    if (_agentNameEditingController.text.trim() == '') {
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

    final Agent agent = Agent()..name = _agentNameEditingController.text.trim();

    await AgentRepository().inputAgent(isar: widget.isar, agent: agent).then(
      // ignore: always_specify_types
      (value) {
        _agentNameEditingController.clear();

        if (mounted) {
          Navigator.pop(context);
        }
      },
    );
  }

  ///
  Widget displayAgentNameList() {
    final List<Widget> list = <Widget>[];

    agentList?.forEach((Agent element) {
      list.add(Container(
        padding: const EdgeInsets.symmetric(vertical: 3),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3)))),
        child: Row(
          children: <Widget>[
            Expanded(child: Text(element.name, maxLines: 1, overflow: TextOverflow.ellipsis)),
            GestureDetector(
              onTap: () {
                _agentNameEditingController.text = element.name;

                setState(() => _agentId = element.id);
              },
              child: Icon(Icons.edit, color: Colors.white.withOpacity(0.5)),
            ),
          ],
        ),
      ));
    });

    return SingleChildScrollView(child: Column(children: list));
  }

  ///
  Future<void> _makeAgentList() async {
    agentList = [];

    await AgentRepository().getAgentList(isar: widget.isar).then((List<Agent>? value) {
      if (mounted) {
        setState(() => agentList = value);
      }
    });
  }

  ///
  Future<void> _editAgentName() async {
    bool errFlg = false;

    if (_agentNameEditingController.text.trim() == '') {
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

    await widget.isar.writeTxn(() async {
      await AgentRepository().getAgent(isar: widget.isar, id: _agentId).then((Agent? value) async {
        value!.name = _agentNameEditingController.text.trim();

        await AgentRepository()
            .updateAgent(isar: widget.isar, agent: value)
            // ignore: always_specify_types
            .then((value) {
          _agentNameEditingController.clear();

          if (mounted) {
            Navigator.pop(context);
          }
        });
      });
    });
  }
}
