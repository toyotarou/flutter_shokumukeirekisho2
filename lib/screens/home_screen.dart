import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/controllers_mixin.dart';
import '../extensions/extensions.dart';
import '../models/work_anken_model.dart';
import '../models/work_contract_model.dart';
import '../models/work_truth_model.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key, required this.workAnkenMap, required this.workContractMap, required this.workTruthMap});

  final Map<String, WorkAnkenModel> workAnkenMap;
  final Map<String, WorkContractModel> workContractMap;
  final Map<String, WorkTruthModel> workTruthMap;

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with ControllersMixin<HomeScreen> {
  List<String> yearMonthList = <String>[];

  ///
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      appParamNotifier.setKeepWorkAnkenMap(map: widget.workAnkenMap);
      appParamNotifier.setKeepWorkContractMap(map: widget.workContractMap);
      appParamNotifier.setKeepWorkTruthMap(map: widget.workTruthMap);
    });

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
                  children: <Widget>[
                    const Text('work history'),

                    Switch(
                      value: appParamState.isDisplayTruth,
                      onChanged: (bool value) {
                        appParamNotifier.setIsDisplayTruth(flag: value);
                      },
                    ),
                  ],
                ),

                Divider(color: Colors.white.withOpacity(0.4), thickness: 5),

                Expanded(child: displayWorkHistoryList()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///
  Widget displayWorkHistoryList() {
    final List<Widget> list = <Widget>[];

    final Iterable<MapEntry<String, WorkAnkenModel>> ankenList = appParamState.keepWorkAnkenMap.entries;

    if (ankenList.isNotEmpty) {
      final MapEntry<String, WorkAnkenModel> first = ankenList.first;

      final int diffDays = DateTime.now()
          .difference(DateTime(first.value.year.toInt(), first.value.month.toInt()))
          .inDays;

      final List<String> ymList = <String>[];

      String keepValue = '';
      String keepYear = '';

      for (int i = 0; i < diffDays; i++) {
        final String yearMonth = DateTime(
          first.value.year.toInt(),
          first.value.month.toInt(),
        ).add(Duration(days: i)).yyyymm;

        final WorkAnkenModel? anken = widget.workAnkenMap[yearMonth];

        final WorkContractModel? contract = widget.workContractMap[yearMonth];
        final WorkTruthModel? truth = widget.workTruthMap[yearMonth];

        if (!ymList.contains(yearMonth)) {
          yearMonthList.add(yearMonth);

          if (keepYear != yearMonth.split('-')[0]) {
            list.add(
              Container(
                decoration: BoxDecoration(color: Colors.yellowAccent.withValues(alpha: 0.2)),
                margin: const EdgeInsets.only(top: 5, bottom: 2),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Text(yearMonth.split('-')[0]), const SizedBox.shrink()],
                ),
              ),
            );
          }

          list.add(
            DefaultTextStyle(
              style: const TextStyle(fontSize: 12),

              child: Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3))),
                ),
                padding: const EdgeInsets.all(5),

                child: (appParamState.isDisplayTruth)
                    ? Row(
                        children: <Widget>[
                          Expanded(child: Text(yearMonth)),
                          SizedBox(
                            width: context.screenSize.width * 0.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  (truth != null) ? truth.name : '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,

                                  style: TextStyle(
                                    color: (truth == null)
                                        ? Colors.transparent
                                        : (truth.name != keepValue && truth.name != '-')
                                        ? Colors.white
                                        : Colors.white.withValues(alpha: 0.4),
                                  ),
                                ),

                                Text(
                                  (contract != null) ? contract.name : '',

                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,

                                  style: TextStyle(
                                    color: (truth == null)
                                        ? Colors.transparent
                                        : (truth.name != keepValue && truth.name != '-')
                                        ? Colors.white
                                        : Colors.white.withValues(alpha: 0.4),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 20),

                          if (truth == null || truth.name == keepValue || truth.name == '-')
                            const Icon(Icons.square_outlined, color: Colors.transparent)
                          else
                            Icon(Icons.info, color: Colors.white.withValues(alpha: 0.6)),
                        ],
                      )
                    : Row(
                        children: <Widget>[
                          Expanded(child: Text(yearMonth)),
                          SizedBox(
                            width: context.screenSize.width * 0.6,
                            child: Text(
                              (anken != null) ? anken.name : '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,

                              style: TextStyle(
                                color: (anken == null)
                                    ? Colors.transparent
                                    : (anken.name != keepValue && anken.name != '-')
                                    ? Colors.white
                                    : Colors.white.withValues(alpha: 0.4),
                              ),
                            ),
                          ),

                          const SizedBox(width: 20),

                          if (anken == null || anken.name == keepValue || anken.name == '-')
                            const Icon(Icons.square_outlined, color: Colors.transparent)
                          else
                            Icon(Icons.info, color: Colors.white.withValues(alpha: 0.6)),
                        ],
                      ),
              ),
            ),
          );

          if (appParamState.isDisplayTruth) {
            if (truth != null) {
              keepValue = truth.name;
            }
          } else {
            if (anken != null) {
              keepValue = anken.name;
            }
          }
        }

        keepYear = yearMonth.split('-')[0];

        ymList.add(yearMonth);
      }
    }

    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) => list[index],
            childCount: list.length,
          ),
        ),
      ],
    );
  }
}
