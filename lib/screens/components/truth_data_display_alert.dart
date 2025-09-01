import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/controllers_mixin.dart';

class TruthDataDisplayAlert extends ConsumerStatefulWidget {
  const TruthDataDisplayAlert({super.key, required this.yearmonth});

  final String yearmonth;

  @override
  ConsumerState<TruthDataDisplayAlert> createState() => _TruthDataDisplayAlertState();
}

class _TruthDataDisplayAlertState extends ConsumerState<TruthDataDisplayAlert>
    with ControllersMixin<TruthDataDisplayAlert> {
  ///
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
