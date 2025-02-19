import 'package:isar/isar.dart';

import '../collections/agent.dart';

class AgentRepository {
  ///
  IsarCollection<Agent> getCollection({required Isar isar}) => isar.agents;
}
