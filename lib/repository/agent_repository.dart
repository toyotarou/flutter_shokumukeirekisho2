import 'package:isar/isar.dart';

import '../collections/agent.dart';

class AgentRepository {
  ///
  Future<Agent?> getAgent({required Isar isar, required int id}) async => isar.agents.get(id);

  ///
  Future<List<Agent>?> getAgentList({required Isar isar}) async => isar.agents.where().findAll();

  ///
  Future<void> inputAgentList({required Isar isar, required List<Agent> agentList}) async {
    for (final Agent element in agentList) {
      inputAgent(isar: isar, agent: element);
    }
  }

  ///
  Future<void> inputAgent({required Isar isar, required Agent agent}) async =>
      isar.writeTxn(() async => isar.agents.put(agent));

  ///
  Future<void> updateAgent({required Isar isar, required Agent agent}) async => isar.agents.put(agent);
}
