import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../extensions/extensions.dart';
import 'components/agent_input_alert.dart';
import 'components/parts/work_history_dialog.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key, required this.isar});

  final Isar isar;

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int startYear = 1999;

  DateTime birthday = DateTime(1973, 8, 19);

  List<GlobalKey> globalKeyList = <GlobalKey<State<StatefulWidget>>>[];

  ///
  @override
  void initState() {
    super.initState();

    // ignore: always_specify_types
    globalKeyList = List.generate(100, (int index) => GlobalKey());
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
                    widget: const AgentInputAlert(),
                  );
                },
                child: Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                    margin: const EdgeInsets.all(5),
                    child: const Text('エージェント名登録'),
                  ),
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
        children:
            // ignore: always_specify_types
            List.generate(DateTime.now().year - startYear + 1, (int index) => index + startYear).map(
          (int element) {
            return Container(
              key: globalKeyList[element - startYear],
              width: context.screenSize.width * 0.5,
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
                                                  onTap: () {},
                                                  child: Icon(Icons.compare_arrows_outlined,
                                                      color: Colors.white.withOpacity(0.3)),
                                                ),
                                                const SizedBox(width: 20),
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: Icon(Icons.input, color: Colors.white.withOpacity(0.3)),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            const Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text('a'),
                                                SizedBox(height: 5),
                                                Text('b'),
                                              ],
                                            ),
                                            Container(),
                                          ],
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
}
