import 'package:isar/isar.dart';

import '../collections/work_history.dart';

class WorkHistoriesRepository {
  ///
  Future<WorkHistory?> getWorkHistory({required Isar isar, required int id}) async => isar.workHistorys.get(id);

  ///
  Future<List<WorkHistory>?> getWorkHistoryList({required Isar isar}) async => isar.workHistorys.where().findAll();

  ///
  Future<void> inputWorkHistory({required Isar isar, required WorkHistory workHistory}) async =>
      isar.writeTxn(() async => isar.workHistorys.put(workHistory));

  ///
  Future<void> updateWorkHistory({required Isar isar, required WorkHistory workHistory}) async =>
      isar.workHistorys.put(workHistory);
}
