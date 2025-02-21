import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../utility/function.dart';
import '../../utility/utility.dart';

part 'app_param.freezed.dart';

part 'app_param.g.dart';

@freezed
class AppParamState with _$AppParamState {
  const factory AppParamState({
    @Default(<String, bool>{}) Map<String, bool> factFakeMap,
  }) = _AppParamState;
}

@Riverpod(keepAlive: true)
class AppParam extends _$AppParam {
  final Utility utility = Utility();

  ///
  @override
  AppParamState build() {
    final List<String> ymList = getYearmonthList();

    final Map<String, bool> map = <String, bool>{};

    for (final String element in ymList) {
      map[element] = true;
    }

    return AppParamState(factFakeMap: map);
  }

  ///
  void setYearmonthFactFake({required String yearmonth, required bool flag}) {
    final Map<String, bool> map = <String, bool>{...state.factFakeMap};

    map[yearmonth] = flag;

    state = state.copyWith(factFakeMap: map);
  }
}
