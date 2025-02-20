import 'package:isar/isar.dart';

part 'work_history.g.dart';

@collection
class WorkHistory {
  Id id = Isar.autoIncrement;

  late String startDate;

  late String site;
  late int agentId;

  late int factFake;
}
