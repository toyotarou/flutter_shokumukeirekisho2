import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../collections/agent.dart';
import '../collections/work_history.dart';
import '../controllers/controllers_mixin.dart';
import '../extensions/extensions.dart';
import '../repository/agents_repository.dart';
import '../repository/work_histories_repository.dart';
import '../utility/function.dart';
import 'components/agent_input_alert.dart';
import 'components/agent_select_setting_alert.dart';
import 'components/csv_data/data_export_alert.dart';
import 'components/csv_data/data_import_alert.dart';
import 'components/notes_input_alert.dart';
import 'components/parts/work_history_dialog.dart';
import 'components/work_history_input_alert.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key, required this.isar});

  final Isar isar;

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with ControllersMixin<HomeScreen> {
  int startYear = 1999;

  DateTime birthday = DateTime(1973, 8, 19);

  List<GlobalKey> globalKeyList = <GlobalKey<State<StatefulWidget>>>[];

  List<WorkHistory>? workHistoryList = <WorkHistory>[];

  Map<String, WorkHistory> workHistoryMapFact = <String, WorkHistory>{};

  Map<String, WorkHistory> workHistoryMapFake = <String, WorkHistory>{};

  Map<String, WorkHistory> totalWorkHistoryMapFact = <String, WorkHistory>{};

  Map<String, WorkHistory> totalWorkHistoryMapFake = <String, WorkHistory>{};

  Map<int, String> agentMap = <int, String>{};

  List<Agent>? agentList = <Agent>[];

  ///
  @override
  void initState() {
    super.initState();

    // ignore: always_specify_types
    globalKeyList = List.generate(100, (int index) => GlobalKey());

    final List<String> ymList = getYearmonthList();

    for (final String element in ymList) {
      workHistoryMapFact[element] = WorkHistory()..site = '';

      workHistoryMapFake[element] = WorkHistory()..site = '';
    }

    makeWorkHistoryList();

    makeAgentMap();
  }

  ///
  @override
  Widget build(BuildContext context) {
    // ignore: always_specify_types
    final List<int> years = List.generate(DateTime.now().year - startYear + 1, (int index) => index + startYear);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('職務経歴書', style: TextStyle(fontSize: 16)),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              appParamNotifier.setSelectDisplayReEntryAgent(index: 0);

              Navigator.pushReplacement(
                context,
                // ignore: inference_failure_on_instance_creation, always_specify_types
                MaterialPageRoute(builder: (BuildContext context) => HomeScreen(isar: widget.isar)),
              );
            },
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () => appParamNotifier.setDisplayFactData(flag: !appParamState.displayFactData),
            icon: Icon(
              Icons.compare_arrows_outlined,
              color: (appParamState.displayFactData) ? Colors.white : Colors.yellowAccent,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(width: context.screenSize.width),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(child: displayReEntryAgentSelect()),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: PageView.builder(
                            itemCount: years.length,
                            onPageChanged: (int index) => appParamNotifier.setJumpIndex(index: index),
                            itemBuilder: (BuildContext context, int index) {
                              return CircleAvatar(
                                backgroundColor: Colors.blueAccent.withOpacity(0.4),
                                child: Text(
                                  years[index].toString(),
                                  style: const TextStyle(fontSize: 12, color: Colors.white),
                                ),
                              );
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: () => scrollToIndex(appParamState.jumpIndex),
                          icon: const Icon(Icons.play_arrow),
                        ),
                      ],
                    ),
                  ],
                )),
              ],
            ),
            displayShokurekiList(),
          ],
        ),
      ),
      drawer: _dispDrawer(),
    );
  }

  ///
  Widget _dispDrawer() {
    return Drawer(
      backgroundColor: Colors.blueGrey.withOpacity(0.2),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 60),
              GestureDetector(
                onTap: () => WorkHistoryDialog(context: context, widget: AgentInputAlert(isar: widget.isar)),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                  margin: const EdgeInsets.all(5),
                  child: const Text('エージェント名登録'),
                ),
              ),
              GestureDetector(
                onTap: () => WorkHistoryDialog(context: context, widget: AgentSelectSettingAlert(isar: widget.isar)),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                  margin: const EdgeInsets.all(5),
                  child: const Text('エージェントセレクト設定'),
                ),
              ),
              Divider(color: Colors.white.withOpacity(0.4), thickness: 5),
              GestureDetector(
                onTap: () => WorkHistoryDialog(context: context, widget: DataExportAlert(isar: widget.isar)),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                  margin: const EdgeInsets.all(5),
                  child: const Text('データエクスポート'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  WorkHistoryDialog(
                    context: context,
                    widget: DataImportAlert(isar: widget.isar),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                  margin: const EdgeInsets.all(5),
                  child: const Text('データインポート'),
                ),
              ),
              Divider(color: Colors.white.withOpacity(0.4), thickness: 5),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget displayShokurekiList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            // ignore: always_specify_types
            List.generate(DateTime.now().year - startYear + 1, (int index) => index + startYear).map(
          (int element) {
            return Container(
              key: globalKeyList[element - startYear],
              width: context.screenSize.width * 0.7,
              margin: const EdgeInsets.all(2),
              padding: const EdgeInsets.all(2),
              child: DefaultTextStyle(
                style: const TextStyle(color: Colors.white),
                child: DefaultTextStyle(
                  style: const TextStyle(fontSize: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 20),
                      Text('$element'),
                      Container(
                        margin: const EdgeInsets.all(2),
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(border: Border.all(color: Colors.white.withOpacity(0.4))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: always_specify_types
                          children: List.generate(12, (int index2) => index2).map(
                            (int element2) {
                              final int age = calculateAge(birthday, DateTime(element, element2 + 1));

                              final String yearmonth = '$element-${(element2 + 1).toString().padLeft(2, '0')}';

                              String siteFact = '';
                              String agentFact = '';
                              if (totalWorkHistoryMapFact[yearmonth] != null) {
                                siteFact = totalWorkHistoryMapFact[yearmonth]!.site;
                                agentFact = agentMap[totalWorkHistoryMapFact[yearmonth]!.agentId] ?? '';
                              }

                              String siteFake = '';
                              const String agentFake = '';
                              if (totalWorkHistoryMapFake[yearmonth] != null) {
                                siteFake = totalWorkHistoryMapFake[yearmonth]!.site;
                              }

                              // ignore: use_if_null_to_convert_nulls_to_bools
                              final int factFake = (appParamState.factFakeMap[yearmonth] == true) ? 0 : 1;

                              final String dispSite = (factFake == 0) ? siteFact : siteFake;

                              final String dispAgent = (factFake == 0) ? agentFact : agentFake;

                              Color factFakeBgcolor = (siteFact != '' && siteFact == siteFake)
                                  ? Colors.greenAccent.withOpacity(0.15)
                                  : Colors.white.withOpacity(0.15);

                              if (appParamState.selectDisplayReEntryAgent != 0) {
                                if (totalWorkHistoryMapFact[yearmonth] != null) {
                                  if (totalWorkHistoryMapFact[yearmonth]!.agentId ==
                                      appParamState.selectDisplayReEntryAgent) {
                                    factFakeBgcolor = Colors.redAccent.withOpacity(0.15);
                                  }
                                }
                              }

                              int dataPos = -1;

                              if (workHistoryList != null) {
                                dataPos = workHistoryList!.indexWhere((WorkHistory element3) =>
                                    element3.startDate == yearmonth && element3.factFake == factFake);
                              }

                              return Stack(
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.all(2),
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(color: factFakeBgcolor),
                                    child: Stack(
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Text((element2 + 1).toString().padLeft(2, '0')),
                                                Row(
                                                  children: <Widget>[
                                                    if (dataPos > -1 && dispSite != '-' && factFake == 0) ...<Widget>[
                                                      GestureDetector(
                                                        onTap: () {
                                                          WorkHistoryDialog(
                                                            context: context,
                                                            widget: NotesInputAlert(
                                                              isar: widget.isar,
                                                              yearmonth: yearmonth,
                                                              totalWorkHistoryMap: totalWorkHistoryMapFact[yearmonth],
                                                              agentMap: agentMap,
                                                            ),
                                                          );
                                                        },
                                                        child: Icon(Icons.note, color: Colors.white.withOpacity(0.3)),
                                                      ),
                                                      const SizedBox(width: 20),
                                                    ],
                                                    GestureDetector(
                                                      onTap: () {
                                                        appParamNotifier.setYearmonthFactFake(
                                                          yearmonth: yearmonth,
                                                          flag: !appParamState.factFakeMap[yearmonth]!,
                                                        );
                                                      },
                                                      child: Icon(
                                                        Icons.compare_arrows_outlined,
                                                        color: (appParamState.factFakeMap[yearmonth] != null &&
                                                                appParamState.factFakeMap[yearmonth] == false)
                                                            ? Colors.yellowAccent.withOpacity(0.8)
                                                            : Colors.white.withOpacity(0.3),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    GestureDetector(
                                                      onTap: () {
                                                        WorkHistoryDialog(
                                                          context: context,
                                                          widget: WorkHistoryInputAlert(
                                                            isar: widget.isar,

                                                            workHistoryList: workHistoryList,

                                                            ymStart: yearmonth,
                                                            site: dispSite,

                                                            // ignore: use_if_null_to_convert_nulls_to_bools
                                                            agentId: (factFake == 0)
                                                                ? totalWorkHistoryMapFact[yearmonth]!.agentId
                                                                : 0,

                                                            factFake: factFake,
                                                          ),
                                                        );
                                                      },
                                                      child: Icon(Icons.input, color: Colors.white.withOpacity(0.3)),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            ConstrainedBox(
                                              constraints: BoxConstraints(minHeight: context.screenSize.height / 20),
                                              child: (appParamState.factFakeMap[yearmonth] != null)
                                                  ? Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Text(dispSite, maxLines: 1, overflow: TextOverflow.ellipsis),
                                                        Text(dispAgent, maxLines: 1, overflow: TextOverflow.ellipsis),
                                                      ],
                                                    )
                                                  : Container(),
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                          bottom: 20,
                                          right: 0,
                                          child: Text(
                                            age.toString(),
                                            style: TextStyle(color: Colors.white.withOpacity(0.3)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    right: 5,
                                    child: Text(
                                      element.toString(),
                                      style: TextStyle(fontSize: 20, color: Colors.grey.withOpacity(0.3)),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  ///
  Future<void> scrollToIndex(int index) async {
    final BuildContext target = globalKeyList[index].currentContext!;

    await Scrollable.ensureVisible(target, duration: const Duration(milliseconds: 1000));
  }

  ///
  int calculateAge(DateTime birthDate, DateTime referenceDate) {
    int age = referenceDate.year - birthDate.year;
    if (referenceDate.month < birthDate.month ||
        (referenceDate.month == birthDate.month && referenceDate.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  ///
  Future<void> makeWorkHistoryList() async {
    workHistoryList = <WorkHistory>[];

    await WorkHistoriesRepository().getWorkHistoryList(isar: widget.isar).then((List<WorkHistory>? value) {
      if (mounted) {
        setState(() {
          workHistoryList = value;

          if (value!.isNotEmpty) {
            for (final WorkHistory element in value) {
              if (element.factFake == 0) {
                workHistoryMapFact[element.startDate] = element;
              }

              if (element.factFake == 1) {
                workHistoryMapFake[element.startDate] = element;
              }
            }
          }

          totalWorkHistoryMapFact = makeTotalWorkHistoryMap(data: workHistoryMapFact);

          totalWorkHistoryMapFake = makeTotalWorkHistoryMap(data: workHistoryMapFake);
        });
      }
    });
  }

  ///
  Future<void> makeAgentMap() async {
    await AgentsRepository().getAgentList(isar: widget.isar).then((List<Agent>? value) {
      if (mounted) {
        setState(() {
          agentList = value;

          if (value!.isNotEmpty) {
            for (final Agent element in value) {
              agentMap[element.id] = element.name;
            }
          }
        });
      }
    });
  }

  ///
  Widget displayReEntryAgentSelect() {
    // ignore: strict_raw_type, always_specify_types
    final List<DropdownMenuItem> dropdownMenuItem = [
      // ignore: always_specify_types
      const DropdownMenuItem(value: 0, child: Text('', style: TextStyle(fontSize: 12))),
    ];

    agentList?.forEach((Agent element) {
      if (element.listUseFlag) {
        dropdownMenuItem.add(
          // ignore: always_specify_types
          DropdownMenuItem(value: element.id, child: Text(element.name, style: const TextStyle(fontSize: 12))),
        );
      }
    });

    return
        // ignore: always_specify_types
        DropdownButton(
      isExpanded: true,
      dropdownColor: Colors.pinkAccent.withOpacity(0.1),
      iconEnabledColor: Colors.white,
      // ignore: always_specify_types
      items: dropdownMenuItem.map((element) => element).toList(),
      value: appParamState.selectDisplayReEntryAgent,
      // ignore: always_specify_types
      onChanged: (value) => appParamNotifier.setSelectDisplayReEntryAgent(index: value.toString().toInt()),
    );
  }
}
