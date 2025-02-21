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
      workHistoryMapFact[element] = WorkHistory();

      workHistoryMapFake[element] = WorkHistory();
    }

    makeWorkHistoryList();

    makeAgentMap();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
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
                onTap: () {
                  WorkHistoryDialog(
                    context: context,
                    widget: AgentInputAlert(isar: widget.isar),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                  margin: const EdgeInsets.all(5),
                  child: const Text('エージェント名登録'),
                ),
              ),
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
                  onTap: () {
                    scrollToIndex(element - startYear);
                  },
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

                              return Container(
                                margin: const EdgeInsets.all(2),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
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
                                                  child: Icon(Icons.compare_arrows_outlined,
                                                      color: Colors.white.withOpacity(0.3)),
                                                ),
                                                const SizedBox(width: 20),
                                                GestureDetector(
                                                  onTap: () {
                                                    WorkHistoryDialog(
                                                      context: context,
                                                      widget: WorkHistoryInputAlert(
                                                        isar: widget.isar,
                                                        ymStart: yearmonth,
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
                                          constraints: BoxConstraints(minHeight: context.screenSize.height / 10),
                                          child: (appParamState.factFakeMap[yearmonth] != null)
                                              ? Column(
                                                  children: <Widget>[
                                                    Text(appParamState.factFakeMap[yearmonth].toString()),
                                                    const Text('-----'),
                                                    if (totalWorkHistoryMapFact[yearmonth] != null) ...<Widget>[
                                                      Text(totalWorkHistoryMapFact[yearmonth]!.site),
                                                      Text(totalWorkHistoryMapFact[yearmonth]!.agentId.toString()),
                                                    ],
                                                    const Text('-----'),
                                                    if (totalWorkHistoryMapFake[yearmonth] != null) ...<Widget>[
                                                      Text(totalWorkHistoryMapFake[yearmonth]!.site),
                                                      Text(totalWorkHistoryMapFake[yearmonth]!.agentId.toString()),
                                                    ],
                                                    const Text('-----'),
                                                  ],
                                                )
                                              : Container(),
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Text(
                                        age.toString(),
                                        style: TextStyle(color: Colors.white.withOpacity(0.3)),
                                      ),
                                    ),
                                  ],
                                ),
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
