import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/work_contract_model.dart';
import '../../../utility/utility.dart';
import '../../models/work_anken_model.dart';
import '../../models/work_truth_model.dart';

part 'app_param.freezed.dart';

part 'app_param.g.dart';

@freezed
class AppParamState with _$AppParamState {
  const factory AppParamState({
    @Default(<String, WorkAnkenModel>{}) Map<String, WorkAnkenModel> keepWorkAnkenMap,
    @Default(<String, WorkContractModel>{}) Map<String, WorkContractModel> keepWorkContractMap,
    @Default(<String, WorkTruthModel>{}) Map<String, WorkTruthModel> keepWorkTruthMap,

    //
    @Default(false) bool isDisplayTruth,
  }) = _AppParamState;
}

@riverpod
class AppParam extends _$AppParam {
  final Utility utility = Utility();

  ///
  @override
  AppParamState build() => const AppParamState();

  ///
  void setKeepWorkAnkenMap({required Map<String, WorkAnkenModel> map}) => state = state.copyWith(keepWorkAnkenMap: map);

  ///
  void setKeepWorkContractMap({required Map<String, WorkContractModel> map}) =>
      state = state.copyWith(keepWorkContractMap: map);

  ///
  void setKeepWorkTruthMap({required Map<String, WorkTruthModel> map}) => state = state.copyWith(keepWorkTruthMap: map);

  ///////////////////////////////////////////////

  ///
  void setIsDisplayTruth({required bool flag}) => state = state.copyWith(isDisplayTruth: flag);
}
