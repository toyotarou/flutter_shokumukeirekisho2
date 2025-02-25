import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../../collections/agent.dart';
import '../../extensions/extensions.dart';
import '../../repository/agents_repository.dart';

class AgentSelectSettingAlert extends StatefulWidget {
  const AgentSelectSettingAlert({super.key, required this.isar});

  final Isar isar;

  @override
  State<AgentSelectSettingAlert> createState() => _AgentSelectSettingAlertState();
}

class _AgentSelectSettingAlertState extends State<AgentSelectSettingAlert> {
  List<Agent>? agentList = <Agent>[];

  ///
  @override
  Widget build(BuildContext context) {
    // ignore: always_specify_types
    Future(() => makeAgentList());

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
              const Text('エージェントセレクト設定'),
              Divider(color: Colors.white.withOpacity(0.4), thickness: 5),
              Expanded(child: displayAgentSelectSettingList()),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget displayAgentSelectSettingList() {
    final List<Widget> list = <Widget>[];

    agentList?.forEach(
      (Agent element) {
        list.add(
          Container(
            padding: const EdgeInsets.symmetric(vertical: 3),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3)))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: () => updateAgent(agent: element, value: !element.listUseFlag),
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: Colors.greenAccent,
                        value: element.listUseFlag,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: const VisualDensity(vertical: -2),
                        onChanged: (bool? value) {
                          if (value != null) {
                            updateAgent(agent: element, value: value);
                          }
                        },
                      ),
                      const SizedBox(width: 4),
                      Expanded(child: Text(element.name)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    return SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: list));
  }

  ///
  Future<void> makeAgentList() async {
    agentList = <Agent>[];

    await AgentsRepository().getAgentList(isar: widget.isar).then((List<Agent>? value) {
      if (mounted) {
        setState(() => agentList = value);
      }
    });
  }

  ///
  Future<void> updateAgent({required Agent agent, required bool value}) async {
    agent.listUseFlag = value;

    await widget.isar.writeTxn(() async => AgentsRepository().updateAgent(isar: widget.isar, agent: agent));
  }
}
