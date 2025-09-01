import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/controllers_mixin.dart';
import '../extensions/extensions.dart';
import '../main.dart';
import '../models/work_anken_model.dart';
import '../models/work_contract_model.dart';
import '../models/work_truth_model.dart';
import '../utility/utility.dart';
import 'components/anken_data_display_alert.dart';
import 'components/truth_data_display_alert.dart';
import 'parts/shokumukeirekisho_dialog.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key, required this.workAnkenMap, required this.workContractMap, required this.workTruthMap});

  final Map<String, WorkAnkenModel> workAnkenMap;
  final Map<String, WorkContractModel> workContractMap;
  final Map<String, WorkTruthModel> workTruthMap;

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with ControllersMixin<HomeScreen> {
  List<String> yearList = <String>[];

  List<GlobalKey> globalKeyList = <GlobalKey<State<StatefulWidget>>>[];
  List<GlobalKey> globalKeyList2 = <GlobalKey<State<StatefulWidget>>>[];

  Utility utility = Utility();

  List<String> itemsIndexYearMonthList = <String>[];

  ///
  @override
  void initState() {
    super.initState();

    // ignore: always_specify_types
    globalKeyList = List.generate(300, (int index) => GlobalKey());

    // ignore: always_specify_types
    globalKeyList2 = List.generate(300, (int index) => GlobalKey());
  }

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
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            utility.getBackGround(),

            DefaultTextStyle(
              style: const TextStyle(color: Colors.white),

              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text('work history'),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                appParamNotifier.setSelectedListYear(year: '');

                                context.findAncestorStateOfType<AppRootState>()?.restartApp();
                              },

                              child: Icon(Icons.refresh, color: Colors.white.withValues(alpha: 0.6)),
                            ),
                          ],
                        ),

                        Row(
                          children: <Widget>[
                            const Text('false / true'),
                            Column(
                              children: <Widget>[
                                Switch(
                                  value: appParamState.isDisplayTruth,
                                  onChanged: (bool value) {
                                    appParamNotifier.setIsDisplayTruth(flag: value);

                                    appParamNotifier.setListItemIndex(index: 0);
                                  },
                                ),

                                const Row(children: <Widget>[Text('f'), SizedBox(width: 20), Text('t')]),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    Divider(color: Colors.white.withOpacity(0.4), thickness: 5),

                    displaySelectYearParts(),

                    Expanded(child: displayWorkHistoryList()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  Widget displaySelectYearParts() {
    return SizedBox(
      height: 60,
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: () {
              int num = appParamState.listItemIndex - 1;
              if (num < 0) {
                num = 0;
              }

              appParamNotifier.setListItemIndex(index: num);

              scrollToIndex2(num);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          IconButton(
            onPressed: () {
              int num = appParamState.listItemIndex + 1;

              final List<String> tempList = itemsIndexYearMonthList.toSet().toList();

              if (num >= tempList.length) {
                num = tempList.length - 2;
              }

              appParamNotifier.setListItemIndex(index: num);

              scrollToIndex2(num);
            },
            icon: const Icon(Icons.arrow_forward_ios),
          ),

          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: yearList.map((String e) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      onTap: () {
                        appParamNotifier.setSelectedListYear(year: e);

                        scrollToIndex(yearList.indexWhere((String element) => element == e));
                      },
                      child: CircleAvatar(
                        backgroundColor: (appParamState.selectedListYear == e)
                            ? Colors.yellowAccent.withValues(alpha: 0.4)
                            : Colors.blueGrey.withValues(alpha: 0.4),
                        child: Text(e, style: const TextStyle(fontSize: 12)),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///
  Future<void> scrollToIndex(int index) async {
    final BuildContext target = globalKeyList[index].currentContext!;

    await Scrollable.ensureVisible(target, duration: const Duration(milliseconds: 1000));
  }

  ///
  Future<void> scrollToIndex2(int index) async {
    final BuildContext target = globalKeyList2[index].currentContext!;

    await Scrollable.ensureVisible(target, duration: const Duration(milliseconds: 1000));
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

      int j = 0;
      int k = 0;
      for (int i = 0; i < diffDays; i++) {
        final String yearMonth = DateTime(
          first.value.year.toInt(),
          first.value.month.toInt(),
        ).add(Duration(days: i)).yyyymm;

        final WorkAnkenModel? anken = widget.workAnkenMap[yearMonth];

        final WorkContractModel? contract = widget.workContractMap[yearMonth];
        final WorkTruthModel? truth = widget.workTruthMap[yearMonth];

        if (!ymList.contains(yearMonth)) {
          if (!yearList.contains(yearMonth.split('-')[0])) {
            yearList.add(yearMonth.split('-')[0]);
          }

          if (keepYear != yearMonth.split('-')[0]) {
            list.add(
              Container(
                key: globalKeyList[j],
                decoration: BoxDecoration(color: Colors.yellowAccent.withValues(alpha: 0.2)),
                margin: const EdgeInsets.only(top: 5, bottom: 2),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Text(yearMonth.split('-')[0]), const SizedBox.shrink()],
                ),
              ),
            );

            j++;
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
                            width: context.screenSize.width * 0.5,

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
                            const Row(
                              children: <Widget>[
                                Icon(Icons.square_outlined, color: Colors.transparent),
                                SizedBox(width: 10),
                                Icon(Icons.square_outlined, color: Colors.transparent),
                              ],
                            )
                          else
                            Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    appParamNotifier.setListItemIndex(
                                      index: itemsIndexYearMonthList.indexWhere(
                                        (String element) => element == yearMonth,
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    Icons.star,
                                    color:
                                        (appParamState.listItemIndex ==
                                            itemsIndexYearMonthList.indexWhere(
                                              (String element) => element == yearMonth,
                                            ))
                                        ? Colors.redAccent.withValues(alpha: 0.6)
                                        : Colors.white.withValues(alpha: 0.6),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    appParamNotifier.setSelectedListYearMonth(yearmonth: yearMonth);

                                    ShokumukeirekishoDialog(
                                      context: context,
                                      widget: TruthDataDisplayAlert(yearmonth: yearMonth),
                                    );
                                  },

                                  child: Icon(
                                    key: globalKeyList2[k],
                                    Icons.info,
                                    color: (appParamState.selectedListYearMonth == yearMonth)
                                        ? Colors.yellowAccent.withValues(alpha: 0.6)
                                        : Colors.white.withValues(alpha: 0.6),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      )
                    : Row(
                        children: <Widget>[
                          Expanded(child: Text(yearMonth)),
                          SizedBox(
                            width: context.screenSize.width * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
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

                                const Text(''),
                              ],
                            ),
                          ),

                          const SizedBox(width: 20),

                          if (anken == null || anken.name == keepValue || anken.name == '-')
                            const Row(
                              children: <Widget>[
                                Icon(Icons.square_outlined, color: Colors.transparent),
                                SizedBox(width: 10),
                                Icon(Icons.square_outlined, color: Colors.transparent),
                              ],
                            )
                          else
                            Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    appParamNotifier.setListItemIndex(
                                      index: itemsIndexYearMonthList.indexWhere(
                                        (String element) => element == yearMonth,
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    Icons.star,
                                    color:
                                        (appParamState.listItemIndex ==
                                            itemsIndexYearMonthList.indexWhere(
                                              (String element) => element == yearMonth,
                                            ))
                                        ? Colors.redAccent.withValues(alpha: 0.6)
                                        : Colors.white.withValues(alpha: 0.6),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    appParamNotifier.setSelectedListYearMonth(yearmonth: yearMonth);

                                    ShokumukeirekishoDialog(
                                      context: context,
                                      widget: AnkenDataDisplayAlert(
                                        yearmonth: yearMonth,

                                        itemsIndexYearMonthList: itemsIndexYearMonthList,
                                        pos: itemsIndexYearMonthList.indexWhere(
                                          (String element) => element == yearMonth,
                                        ),
                                      ),
                                      executeFunctionWhenDialogClose: true,
                                      ref: ref,
                                      from: 'AnkenDataDisplayAlert',
                                    );
                                  },

                                  child: Icon(
                                    key: globalKeyList2[k],
                                    Icons.info,
                                    color: (appParamState.selectedListYearMonth == yearMonth)
                                        ? Colors.yellowAccent.withValues(alpha: 0.6)
                                        : Colors.white.withValues(alpha: 0.6),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
              ),
            ),
          );

          if (appParamState.isDisplayTruth) {
            if (truth != null && truth.name != keepValue && truth.name != '-') {
              itemsIndexYearMonthList.add(yearMonth);

              k++;
            }
          } else {
            if (anken != null && anken.name != keepValue && anken.name != '-') {
              itemsIndexYearMonthList.add(yearMonth);

              k++;
            }
          }

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

    return SingleChildScrollView(child: Column(children: list));
  }
}
