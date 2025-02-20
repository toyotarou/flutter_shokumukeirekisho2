import 'package:isar/isar.dart';

part 'work_history.g.dart';

@collection
class WorkHistory {
  Id id = Isar.autoIncrement;

  late String startDate;
  late String endDate;

  late String factSite;
  late int factAgentId;

  late String fakeSite;
  late int fakeAgentId;

  late int factFake;
}
