import 'package:flutter/material.dart';

class Utility {
  /// 背景取得
  // ignore: type_annotate_public_apis
  Widget getBackGround({context}) {
    return Image.asset(
      'assets/images/shokumu_bg.png',
      fit: BoxFit.cover,
      color: Colors.black.withOpacity(0.8),
      colorBlendMode: BlendMode.darken,
    );
  }

  ///
  void showError(String msg) {
    ScaffoldMessenger.of(
      NavigationService.navigatorKey.currentContext!,
    ).showSnackBar(SnackBar(content: Text(msg), duration: const Duration(seconds: 5)));
  }
}

class NavigationService {
  const NavigationService._();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
