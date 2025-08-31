import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/http/client.dart';
import '../../../data/http/path.dart';
import '../../../extensions/extensions.dart';
import '../../../models/work_anken_model.dart';
import '../../../utility/utility.dart';

part 'work_anken.freezed.dart';

part 'work_anken.g.dart';

@freezed
class WorkAnkenState with _$WorkAnkenState {
  const factory WorkAnkenState({
    @Default(<WorkAnkenModel>[]) List<WorkAnkenModel> workAnkenList,
    @Default(<String, WorkAnkenModel>{}) Map<String, WorkAnkenModel> workAnkenMap,
  }) = _WorkAnkenState;
}

@riverpod
class WorkAnken extends _$WorkAnken {
  final Utility utility = Utility();

  ///
  @override
  WorkAnkenState build() => const WorkAnkenState();

  //============================================== api

  ///
  Future<WorkAnkenState> fetchAllWorkAnkenData() async {
    final HttpClient client = ref.read(httpClientProvider);

    try {
      final List<WorkAnkenModel> list = <WorkAnkenModel>[];
      final Map<String, WorkAnkenModel> map = <String, WorkAnkenModel>{};

      final Map<String, WorkAnkenModel> map2 = <String, WorkAnkenModel>{};

      // ignore: always_specify_types
      await client.post(path: APIPath.getWorkAnken).then((value) {
        // ignore: avoid_dynamic_calls
        for (int i = 0; i < value['data'].length.toString().toInt(); i++) {
          // ignore: avoid_dynamic_calls
          final WorkAnkenModel val = WorkAnkenModel.fromJson(value['data'][i] as Map<String, dynamic>);

          list.add(val);

          map2['${val.year}-${val.month}'] = val;
        }
      });

      final WorkAnkenModel first = list.first;

      final int diffDays = DateTime.now().difference(DateTime(first.year.toInt(), first.month.toInt())).inDays;

      final List<String> yearMonthList = <String>[];

      WorkAnkenModel? lastRecord;
      for (int i = 0; i < diffDays; i++) {
        final String yearMonth = DateTime(first.year.toInt(), first.month.toInt()).add(Duration(days: i)).yyyymm;

        if (yearMonthList.contains(yearMonth)) {
          continue;
        }

        if (map2[yearMonth] != null) {
          lastRecord = map2[yearMonth];
        }

        if (lastRecord != null) {
          map[yearMonth] = lastRecord;
        }

        yearMonthList.add(yearMonth);
      }

      return state.copyWith(workAnkenList: list, workAnkenMap: map);
    } catch (e) {
      utility.showError('予期せぬエラーが発生しました');
      rethrow; // これにより呼び出し元でキャッチできる
    }
  }

  ///
  Future<void> getAllWorkAnkenData() async {
    try {
      final WorkAnkenState newState = await fetchAllWorkAnkenData();

      state = newState;
    } catch (_) {}
  }

  //============================================== api
}
