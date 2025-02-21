import 'package:isar/isar.dart';

import '../collections/work_history.dart';

class WorkHistoriesRepository {
  ///
  Future<WorkHistory?> getWorkHistory({required Isar isar, required int id}) async => isar.workHistorys.get(id);

  ///
  Future<List<WorkHistory>?> getWorkHistoryList({required Isar isar}) async => isar.workHistorys.where().findAll();

  ///
  Future<void> inputWorkHistoryList({required Isar isar, required List<WorkHistory> workHistoryList}) async {
    for (final WorkHistory element in workHistoryList) {
      inputWorkHistory(isar: isar, workHistory: element);
    }
  }

  ///
  Future<void> inputWorkHistory({required Isar isar, required WorkHistory workHistory}) async =>
      isar.writeTxn(() async => isar.workHistorys.put(workHistory));

  ///
  Future<void> updateWorkHistory({required Isar isar, required WorkHistory workHistory}) async =>
      isar.workHistorys.put(workHistory);

  ///
  Future<void> deleteWorkHistory({required Isar isar, required int id}) async =>
      isar.writeTxn(() async => isar.workHistorys.delete(id));
}
