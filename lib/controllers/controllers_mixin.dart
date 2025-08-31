import 'package:flutter_riverpod/flutter_riverpod.dart';

import '_get_data/work_anken/work_anken.dart';
import '_get_data/work_contract/work_contract.dart';
import '_get_data/work_truth/work_truth.dart';
import 'app_param/app_param.dart';

mixin ControllersMixin<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  //==========================================//

  AppParamState get appParamState => ref.watch(appParamProvider);

  AppParam get appParamNotifier => ref.read(appParamProvider.notifier);

  //==========================================//

  WorkAnkenState get workAnkenState => ref.watch(workAnkenProvider);

  WorkAnken get workAnkenNotifier => ref.read(workAnkenProvider.notifier);

  //==========================================//

  WorkContractState get workContractState => ref.watch(workContractProvider);

  WorkContract get workContractNotifier => ref.read(workContractProvider.notifier);

  //==========================================//

  WorkTruthState get workTruthState => ref.watch(workTruthProvider);

  WorkTruth get workTruthNotifier => ref.read(workTruthProvider.notifier);

  //==========================================//
}
