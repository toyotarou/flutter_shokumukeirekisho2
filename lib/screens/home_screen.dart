import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../collections/agent.dart';
import '../collections/work_history.dart';
import '../controllers/controllers_mixin.dart';
import '../extensions/extensions.dart';
import '../repository/agent_repository.dart';
import '../repository/work_histories_repository.dart';
import '../utility/function.dart';
import 'components/agent_input_alert.dart';
import 'components/csv_data/data_export_alert.dart';
import 'components/csv_data/data_import_alert.dart';
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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                // ignore: inference_failure_on_instance_creation, always_specify_types
                MaterialPageRoute(builder: (BuildContext context) => HomeScreen(isar: widget.isar)),
              );
            },
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {
              appParamNotifier.setDisplayFactData(flag: !appParamState.displayFactData);
            },
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
            displayYearsWidget(),
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
  Widget displayYearsWidget() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            // ignore: always_specify_types
            List.generate(DateTime.now().year - startYear + 1, (int index) => index + startYear).map(
          (int element) {
            return Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () => scrollToIndex(element - startYear),
                  child: CircleAvatar(
                    backgroundColor: Colors.blueAccent.withOpacity(0.4),
                    child: Text(
                      '$element',
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
              ],
            );
          },
        ).toList(),
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

                              final String dispSite =
                                  // ignore: use_if_null_to_convert_nulls_to_bools
                                  (appParamState.factFakeMap[yearmonth] == true) ? siteFact : siteFake;

                              final String dispAgent =
                                  // ignore: use_if_null_to_convert_nulls_to_bools
                                  (appParamState.factFakeMap[yearmonth] == true) ? agentFact : agentFake;

                              final Color factFaceBgcolor = (siteFact != '' && siteFact == siteFake)
                                  ? Colors.greenAccent.withOpacity(0.1)
                                  : Colors.white.withOpacity(0.1);

                              return Stack(
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.all(2),
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(color: factFaceBgcolor),
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
                                                    GestureDetector(
                                                      onTap: () {
                                                        if (appParamState.factFakeMap[yearmonth] != null) {
                                                          appParamNotifier.setYearmonthFactFake(
                                                            yearmonth: yearmonth,
                                                            flag: !appParamState.factFakeMap[yearmonth]!,
                                                          );
                                                        }
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
                                                            agentId: (appParamState.factFakeMap[yearmonth] == true)
                                                                ? totalWorkHistoryMapFact[yearmonth]!.agentId
                                                                : 0,

                                                            factFake:
                                                                // ignore: use_if_null_to_convert_nulls_to_bools
                                                                (appParamState.factFakeMap[yearmonth] == true) ? 0 : 1,
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
    await AgentRepository().getAgentList(isar: widget.isar).then((List<Agent>? value) {
      if (mounted) {
        setState(() {
          if (value!.isNotEmpty) {
            for (final Agent element in value) {
              agentMap[element.id] = element.name;
            }
          }
        });
      }
    });
  }
}
