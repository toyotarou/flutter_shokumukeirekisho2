import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../extensions/extensions.dart';

class AgentInputAlert extends ConsumerStatefulWidget {
  const AgentInputAlert({super.key});

  @override
  ConsumerState<AgentInputAlert> createState() => _AgentInputAlertState();
}

class _AgentInputAlertState extends ConsumerState<AgentInputAlert> {
  final TextEditingController _agentNameEditingController = TextEditingController();

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
                TextButton(
                  onPressed: _inputAgentName,
                  child: const Text('エージェント名を追加する', style: TextStyle(fontSize: 12)),
                ),
              ],
            ),
          ],
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
                  keyboardType: TextInputType.number,
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
  void _inputAgentName() {}
}
