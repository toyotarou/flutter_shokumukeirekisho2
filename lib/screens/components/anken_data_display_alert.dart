import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/controllers_mixin.dart';
import '../../extensions/extensions.dart';
import '../../models/work_anken_model.dart';

class AnkenDataDisplayAlert extends ConsumerStatefulWidget {
  const AnkenDataDisplayAlert({
    super.key,
    required this.yearmonth,
    required this.itemsIndexYearMonthList,
    required this.pos,
  });

  final String yearmonth;
  final List<String> itemsIndexYearMonthList;
  final int pos;

  @override
  ConsumerState<AnkenDataDisplayAlert> createState() => _AnkenDataDisplayAlertState();
}

class _AnkenDataDisplayAlertState extends ConsumerState<AnkenDataDisplayAlert>
    with ControllersMixin<AnkenDataDisplayAlert> {
  ///
  @override
  Widget build(BuildContext context) {
    final String endYm = DateTime(
      widget.itemsIndexYearMonthList[widget.pos + 1].split('-')[0].toInt(),
      widget.itemsIndexYearMonthList[widget.pos + 1].split('-')[1].toInt(),
      0,
    ).yyyymm;

    return Scaffold(
      backgroundColor: Colors.transparent,

      body: SafeArea(
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),

          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Text('${widget.yearmonth} -> $endYm'), const SizedBox.shrink()],
                ),

                Divider(color: Colors.white.withOpacity(0.4), thickness: 5),

                Expanded(child: displayAnkenDetail()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///
  Widget displayAnkenDetail() {
    final WorkAnkenModel? anken = appParamState.keepWorkAnkenMap[widget.yearmonth];

    if (anken == null) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(width: double.infinity),

        Text(anken.name),

        const SizedBox(height: 30),

        Row(
          children: <Widget>[
            const Expanded(child: Text('kibo')),
            Expanded(flex: 3, child: Text(anken.kibo ?? '-')),
          ],
        ),

        Row(
          children: <Widget>[
            const Expanded(child: Text('koutei')),
            Expanded(flex: 3, child: Text(anken.koutei ?? '-')),
          ],
        ),

        Row(
          children: <Widget>[
            const Expanded(child: Text('os')),
            Expanded(flex: 3, child: Text(anken.os ?? '-')),
          ],
        ),

        Row(
          children: <Widget>[
            const Expanded(child: Text('gengo')),
            Expanded(flex: 3, child: Text(anken.gengo ?? '-')),
          ],
        ),

        Row(
          children: <Widget>[
            const Expanded(child: Text('db')),
            Expanded(flex: 3, child: Text(anken.db ?? '-')),
          ],
        ),

        Row(
          children: <Widget>[
            const Expanded(child: Text('tool')),
            Expanded(flex: 3, child: Text(anken.tool ?? '-')),
          ],
        ),
      ],
    );
  }
}
