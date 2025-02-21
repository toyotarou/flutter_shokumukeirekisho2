import '../collections/work_history.dart';
import '../extensions/extensions.dart';

List<String> getYearmonthList() {
  final DateTime listStartDate = DateTime(1999, 10);

  final int diff = DateTime.now().difference(listStartDate).inDays;

  final List<String> ymList = <String>[];

  for (int i = 0; i < diff; i++) {
    final DateTime date = listStartDate.add(Duration(days: i));

    final String yearmonth = date.yyyymm;

    if (!ymList.contains(yearmonth)) {
      ymList.add(yearmonth);
    }
  }

  return ymList;
}

///
Map<String, WorkHistory> makeTotalWorkHistoryMap({required Map<String, WorkHistory> data}) {
  final Map<String, WorkHistory> map = <String, WorkHistory>{};

  WorkHistory workHistory = WorkHistory()
    ..site = ''
    ..agentId = 0;

  data.forEach((String key, WorkHistory value) {
    if (value.site != '') {
      workHistory = value;
    }

    map[key] = workHistory;
  });

  return map;
}
