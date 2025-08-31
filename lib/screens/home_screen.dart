import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/controllers_mixin.dart';
import '../models/work_anken_model.dart';
import '../models/work_contract_model.dart';
import '../models/work_truth_model.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key, required this.workAnkenMap, required this.workContractMap, required this.workTruthMap});

  final Map<String, WorkAnkenModel> workAnkenMap;
  final Map<String, WorkContractModel> workContractMap;
  final Map<String, WorkTruthModel> workTruthMap;

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with ControllersMixin<HomeScreen> {
  ///
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      appParamNotifier.setKeepWorkAnkenMap(map: widget.workAnkenMap);
      appParamNotifier.setKeepWorkContractMap(map: widget.workContractMap);
      appParamNotifier.setKeepWorkTruthMap(map: widget.workTruthMap);
    });

    return const Scaffold(
      body: SafeArea(child: Column(children: <Widget>[Text('HomeScreen')])),
    );
  }
}
