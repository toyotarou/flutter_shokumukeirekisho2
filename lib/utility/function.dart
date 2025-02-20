import '../collections/work_history.dart';
import '../extensions/extensions.dart';

Map<String, WorkHistory> makeTotalWorkHistoryMap({required Map<String, WorkHistory> workHistoryMap}) {
  final Map<String, WorkHistory> result = <String, WorkHistory>{};

  final DateTime listStartDate = DateTime(1999, 10);

  final int diff = DateTime.now().difference(listStartDate).inDays;

  final List<String> ymList = <String>[];

  WorkHistory workHistory = WorkHistory();

  for (int i = 0; i < diff; i++) {
    final DateTime date = listStartDate.add(Duration(days: i));

    final String month = date.yyyymm;

    if (workHistoryMap[month] != null) {
      workHistory = workHistoryMap[month]!;
    }

    if (!ymList.contains(month)) {
      ymList.add(month);

      result[month] = workHistory;
    }
  }

  return result;
}
