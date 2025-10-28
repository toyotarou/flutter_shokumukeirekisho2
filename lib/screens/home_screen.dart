import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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
  final List<String> yearList = <String>[];
  final List<String> itemsIndexYearMonthList = <String>[];

  List<_Row> _rows = <_Row>[];
  final Map<String, int> _yearIndexMap = <String, int>{};
  final Map<String, int> _ymIndexMap = <String, int>{};

  final Utility utility = Utility();

  final ItemScrollController _itemScrollCtrl = ItemScrollController();
  final ItemPositionsListener _itemPosListener = ItemPositionsListener.create();

  bool _syncedOnce = false;
  bool _syncScheduled = false;

  @override
  void initState() {
    super.initState();
    _scheduleSyncIfNeeded();
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(widget.workAnkenMap, oldWidget.workAnkenMap) ||
        !identical(widget.workContractMap, oldWidget.workContractMap) ||
        !identical(widget.workTruthMap, oldWidget.workTruthMap)) {
      _scheduleSyncIfNeeded();
    }
  }

  void _scheduleSyncIfNeeded() {
    if (_syncScheduled) {
      return;
    }
    _syncScheduled = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _syncScheduled = false;
      _syncMapsNow();
    });
  }

  void _syncMapsNow() {
    final bool sameRefs =
        identical(appParamState.keepWorkAnkenMap, widget.workAnkenMap) &&
        identical(appParamState.keepWorkContractMap, widget.workContractMap) &&
        identical(appParamState.keepWorkTruthMap, widget.workTruthMap);

    if (_syncedOnce && sameRefs) {
      return;
    }

    appParamNotifier.setKeepWorkAnkenMap(map: widget.workAnkenMap);
    appParamNotifier.setKeepWorkContractMap(map: widget.workContractMap);
    appParamNotifier.setKeepWorkTruthMap(map: widget.workTruthMap);

    _syncedOnce = true;
  }

  ///
  @override
  Widget build(BuildContext context) {
    _rebuildRows(isDisplayTruth: appParamState.isDisplayTruth);

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
                    _buildHeader(appParamState.isDisplayTruth),
                    Divider(color: Colors.white.withOpacity(0.4), thickness: 5),
                    _buildYearSelector(appParamState.selectedListYear),
                    Expanded(
                      child: ScrollablePositionedList.builder(
                        itemScrollController: _itemScrollCtrl,
                        itemPositionsListener: _itemPosListener,
                        itemCount: _rows.length,
                        itemBuilder: (BuildContext context, int i) {
                          final _Row row = _rows[i];
                          if (row.isHeader) {
                            return Container(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              decoration: BoxDecoration(color: Colors.yellowAccent.withOpacity(0.2)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[Text(row.year!), const SizedBox.shrink()],
                              ),
                            );
                          } else {
                            return _buildMonthRow(
                              isDisplayTruth: appParamState.isDisplayTruth,
                              listItemIndex: appParamState.listItemIndex,
                              selectedListYearMonth: appParamState.selectedListYearMonth,
                              ym: row.ym!,
                            );
                          }
                        },
                      ),
                    ),
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
  Widget _buildHeader(bool isDisplayTruth) {
    return Row(
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
                  value: isDisplayTruth,
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
    );
  }

  ///
  Widget _buildYearSelector(String selectedListYear) {
    return SizedBox(
      height: 60,
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: () {
              int idx = appParamState.listItemIndex - 1;
              if (idx < 0) {
                idx = 0;
              }
              appParamNotifier.setListItemIndex(index: idx);
              if (itemsIndexYearMonthList.isNotEmpty) {
                final String ym = itemsIndexYearMonthList[idx];
                _scrollToYm(ym);
              }
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          IconButton(
            onPressed: () {
              int idx = appParamState.listItemIndex + 1;
              final List<String> uniq = itemsIndexYearMonthList.toSet().toList();
              if (uniq.isEmpty) {
                return;
              }
              if (idx >= uniq.length) {
                idx = uniq.length - 1;
              }
              appParamNotifier.setListItemIndex(index: idx);
              _scrollToYm(uniq[idx]);
            },
            icon: const Icon(Icons.arrow_forward_ios),
          ),

          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: yearList.map((String y) {
                  final bool selected = (selectedListYear == y);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      onTap: () {
                        appParamNotifier.setSelectedListYear(year: y);
                        _scrollToYear(y);
                      },
                      child: CircleAvatar(
                        backgroundColor: selected
                            ? Colors.yellowAccent.withValues(alpha: 0.4)
                            : Colors.blueGrey.withValues(alpha: 0.4),
                        child: Text(y, style: const TextStyle(fontSize: 12)),
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
  Widget _buildMonthRow({
    required bool isDisplayTruth,
    required int listItemIndex,
    required String selectedListYearMonth,
    required String ym,
  }) {
    final WorkAnkenModel? anken = widget.workAnkenMap[ym];
    final WorkContractModel? contract = widget.workContractMap[ym];
    final WorkTruthModel? truth = widget.workTruthMap[ym];

    final String name = isDisplayTruth ? (truth?.name ?? '') : (anken?.name ?? '');
    final String prevName = _prevNameMap[ym] ?? '';
    final bool show = name.isNotEmpty && name != '-' && name != prevName;

    return DefaultTextStyle(
      style: const TextStyle(fontSize: 12),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3))),
        ),
        padding: const EdgeInsets.all(6),
        child: Row(
          children: <Widget>[
            Expanded(child: Text(ym)),
            SizedBox(
              width: context.screenSize.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: show ? Colors.white : Colors.white.withValues(alpha: 0.4)),
                  ),
                  if (isDisplayTruth)
                    Text(
                      contract?.name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: show ? Colors.white : Colors.white.withValues(alpha: 0.4)),
                    )
                  else
                    const SizedBox.shrink(),
                ],
              ),
            ),
            const SizedBox(width: 20),
            if (!show)
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
                    onTap: () => _scrollToYm(ym),
                    child: Icon(
                      Icons.star,
                      color: (listItemIndex == itemsIndexYearMonthList.indexOf(ym))
                          ? Colors.redAccent.withValues(alpha: 0.6)
                          : Colors.white.withValues(alpha: 0.6),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      appParamNotifier.setSelectedListYearMonth(yearmonth: ym);

                      if (isDisplayTruth) {
                        ShokumukeirekishoDialog(
                          context: context,
                          widget: TruthDataDisplayAlert(yearmonth: ym),
                        );
                      } else {
                        ShokumukeirekishoDialog(
                          context: context,
                          widget: AnkenDataDisplayAlert(
                            yearmonth: ym,
                            itemsIndexYearMonthList: itemsIndexYearMonthList,
                            pos: itemsIndexYearMonthList.indexOf(ym),
                          ),
                          executeFunctionWhenDialogClose: true,
                          ref: ref,
                          from: 'AnkenDataDisplayAlert',
                        );
                      }
                    },
                    child: Icon(
                      Icons.info,
                      color: (selectedListYearMonth == ym)
                          ? Colors.yellowAccent.withValues(alpha: 0.6)
                          : Colors.white.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  ///
  final Map<String, String> _prevNameMap = <String, String>{};

  void _rebuildRows({required bool isDisplayTruth}) {
    yearList.clear();
    itemsIndexYearMonthList.clear();
    _rows = <_Row>[];
    _yearIndexMap.clear();
    _ymIndexMap.clear();
    _prevNameMap.clear();

    final Iterable<MapEntry<String, WorkAnkenModel>> entries = appParamState.keepWorkAnkenMap.entries;
    if (entries.isEmpty) {
      return;
    }

    final MapEntry<String, WorkAnkenModel> first = entries.first;
    final DateTime from = DateTime(first.value.year.toInt(), first.value.month.toInt());
    final DateTime to = DateTime.now();

    String? prevYear;
    String keepValue = '';

    int index = 0;

    for (final String ym in _iterateYearMonths(from, to)) {
      final String y = ym.substring(0, 4);

      if (prevYear != y) {
        _rows.add(_Row.header(y));
        _yearIndexMap[y] = index;
        yearList.add(y);
        index++;
        prevYear = y;
      }

      final WorkAnkenModel? anken = widget.workAnkenMap[ym];
      final WorkTruthModel? truth = widget.workTruthMap[ym];

      final String currentName = isDisplayTruth ? (truth?.name ?? '') : (anken?.name ?? '');
      final bool showRow = currentName.isNotEmpty && currentName != '-' && currentName != keepValue;

      if (showRow) {
        itemsIndexYearMonthList.add(ym);
      }

      if (currentName.isNotEmpty) {
        _prevNameMap[ym] = keepValue;
        keepValue = currentName;
      } else {
        _prevNameMap[ym] = keepValue;
      }

      _rows.add(_Row.month(ym));
      _ymIndexMap[ym] = index;
      index++;
    }
  }

  ///
  Iterable<String> _iterateYearMonths(DateTime from, DateTime to) sync* {
    int y = from.year, m = from.month;
    while (DateTime(y, m).isBefore(DateTime(to.year, to.month + 1))) {
      yield '${y.toString().padLeft(4, '0')}-${m.toString().padLeft(2, '0')}';
      m++;
      if (m == 13) {
        m = 1;
        y++;
      }
    }
  }

  ///
  void _scrollToYear(String year) {
    final int? idx = _yearIndexMap[year];
    if (idx == null) {
      return;
    }
    if (!_itemScrollCtrl.isAttached) {
      return;
    }

    _itemScrollCtrl.scrollTo(index: idx, duration: const Duration(milliseconds: 500), curve: Curves.easeOutCubic);
  }

  ///
  void _scrollToYm(String ym) {
    final int? idx = _ymIndexMap[ym];
    if (idx == null) {
      return;
    }
    if (!_itemScrollCtrl.isAttached) {
      return;
    }

    _itemScrollCtrl.scrollTo(index: idx, duration: const Duration(milliseconds: 500), curve: Curves.easeOutCubic);
  }
}

class _Row {
  const _Row.header(this.year) : ym = null;

  const _Row.month(this.ym) : year = null;

  final String? year;
  final String? ym;

  bool get isHeader => year != null;
}
