import 'package:isar/isar.dart';

part 'agent.g.dart';

@collection
class Agent {
  Id id = Isar.autoIncrement;

  late String name;

  late bool listUseFlag;
}
