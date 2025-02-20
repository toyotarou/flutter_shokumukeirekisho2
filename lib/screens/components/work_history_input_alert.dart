import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../collections/agent.dart';
import '../../extensions/extensions.dart';
import '../../repository/agent_repository.dart';

class WorkHistoryInputAlert extends ConsumerStatefulWidget {
  const WorkHistoryInputAlert({super.key, required this.ymStart, required this.isar});

  final Isar isar;

  final String ymStart;

  @override
  ConsumerState<WorkHistoryInputAlert> createState() => _WorkHistoryInputAlertState();
}

class _WorkHistoryInputAlertState extends ConsumerState<WorkHistoryInputAlert> {
  List<Agent>? agentList = <Agent>[];

  final TextEditingController _siteNameEditingController = TextEditingController();

  String ymEnd = '';

  int _agentId = 0;

  int factFake = 0;

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
                      TextButton(
                        onPressed: _inputWorkHistory,
                        child: const Text('職歴を追加する', style: TextStyle(fontSize: 12)),
                      ),
                      TextButton(
                        onPressed: _deleteWorkHistory,
                        child: const Text('職歴を削除する', style: TextStyle(fontSize: 12)),
                      ),
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
                Text(widget.ymStart),

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
                  children: <Widget>[
                    const SizedBox(width: 40, child: Text('end')),
                    GestureDetector(onTap: () => _showDP(), child: const Icon(Icons.calendar_month)),
                    const SizedBox(width: 10),
                    Expanded(child: Text(ymEnd)),
                    SizedBox(
                      width: 40,
                      child: GestureDetector(
                        onTap: () => setState(() => factFake = (factFake == 0) ? 1 : 0),
                        child: (factFake == 0)
                            ? const Text('fact', style: TextStyle(color: Colors.yellowAccent))
                            : const Text('fake', style: TextStyle(color: Colors.redAccent)),
                      ),
                    ),
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
    await AgentRepository().getAgentList(isar: widget.isar).then((List<Agent>? value) {
      if (mounted) {
        setState(() => agentList = value);
      }
    });
  }

  ///
  Future<void> _inputWorkHistory() async {}

  ///
  Future<void> _deleteWorkHistory() async{}

  ///
  Future<void> _showDP() async {
    final DateTime? selectedDate = await showDatePicker(
      barrierColor: Colors.transparent,
      locale: const Locale('ja'),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1999),
      lastDate: DateTime.now().add(const Duration(days: 360)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.black.withOpacity(0.1),
            canvasColor: Colors.black.withOpacity(0.1),
            cardColor: Colors.black.withOpacity(0.1),
            dividerColor: Colors.indigo,
            primaryColor: Colors.black.withOpacity(0.1),
            secondaryHeaderColor: Colors.black.withOpacity(0.1),
            dialogBackgroundColor: Colors.black.withOpacity(0.1),
            primaryColorDark: Colors.black.withOpacity(0.1),
            highlightColor: Colors.black.withOpacity(0.1),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      setState(() => ymEnd = selectedDate.yyyymm);
    }
  }
}
