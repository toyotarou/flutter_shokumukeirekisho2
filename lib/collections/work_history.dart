import 'package:isar/isar.dart';

part 'work_history.g.dart';

@collection
class WorkHistory {
  Id id = Isar.autoIncrement;

  late String year;
  late String month;

  late String factSite;
  late String factAgentId;

  late String fakeSite;
}
