import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/http/client.dart';
import '../../../data/http/path.dart';
import '../../../extensions/extensions.dart';
import '../../../models/work_contract_model.dart';
import '../../../utility/utility.dart';

part 'work_contract.freezed.dart';

part 'work_contract.g.dart';

@freezed
class WorkContractState with _$WorkContractState {
  const factory WorkContractState({
    @Default(<WorkContractModel>[]) List<WorkContractModel> workContractList,
    @Default(<String, WorkContractModel>{}) Map<String, WorkContractModel> workContractMap,
  }) = _WorkContractState;
}

@riverpod
class WorkContract extends _$WorkContract {
  final Utility utility = Utility();

  ///
  @override
  WorkContractState build() => const WorkContractState();

  //============================================== api

  ///
  Future<WorkContractState> fetchAllWorkContractData() async {
    final HttpClient client = ref.read(httpClientProvider);

    try {
      final List<WorkContractModel> list = <WorkContractModel>[];
      final Map<String, WorkContractModel> map = <String, WorkContractModel>{};

      final Map<String, WorkContractModel> map2 = <String, WorkContractModel>{};

      // ignore: always_specify_types
      await client.post(path: APIPath.getWorkContract).then((value) {
        // ignore: avoid_dynamic_calls
        for (int i = 0; i < value['data'].length.toString().toInt(); i++) {
          // ignore: avoid_dynamic_calls
          final WorkContractModel val = WorkContractModel.fromJson(value['data'][i] as Map<String, dynamic>);

          list.add(val);

          map2['${val.year}-${val.month}'] = val;
        }
      });

      final WorkContractModel first = list.first;

      final int diffDays = DateTime.now().difference(DateTime(first.year.toInt(), first.month.toInt())).inDays;

      final List<String> yearMonthList = <String>[];

      WorkContractModel? lastRecord;
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

      return state.copyWith();
    } catch (e) {
      utility.showError('予期せぬエラーが発生しました');
      rethrow; // これにより呼び出し元でキャッチできる
    }
  }

  ///
  Future<void> getAllWorkContractData() async {
    try {
      final WorkContractState newState = await fetchAllWorkContractData();

      state = newState;
    } catch (_) {}
  }

  //============================================== api
}
