import 'package:isar/isar.dart';

import '../collections/work_history.dart';

class WorkHistoriesRepository {
  ///
  IsarCollection<WorkHistory> getCollection({required Isar isar}) => isar.workHistorys;

  ///
  Future<WorkHistory?> getWorkHistory({required Isar isar, required int id}) async {
    final IsarCollection<WorkHistory> workHistoriesCollection = getCollection(isar: isar);
    return workHistoriesCollection.get(id);
  }

  ///
  Future<List<WorkHistory>?> getWorkHistoryList({required Isar isar}) async {
    final IsarCollection<WorkHistory> workHistoriesCollection = getCollection(isar: isar);
    return workHistoriesCollection.where().findAll();
  }
}
