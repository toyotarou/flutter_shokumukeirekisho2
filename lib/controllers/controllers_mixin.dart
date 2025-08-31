import 'package:flutter_riverpod/flutter_riverpod.dart';

import '_get_data/work_anken/work_anken.dart';

mixin ControllersMixin<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  //==========================================//

  WorkAnkenState get workAnkenState => ref.watch(workAnkenProvider);

  WorkAnken get workAnkenNotifier => ref.read(workAnkenProvider.notifier);

  //==========================================//
  //==========================================//
  //==========================================//
}
