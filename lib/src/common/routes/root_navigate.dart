import 'package:flutter/material.dart';
import 'package:flutter_base/src/presentation/app.dart';

class RootNavigate {
  static NavigatorState get _rootNavigator =>
      Navigator.of(Application.appNavigatorKey.currentContext!);

  static NavigatorState get navigation => _rootNavigator;

  static Future<dynamic> pushNamed({required String routeName, Object? args}) {
    return _rootNavigator.pushNamed(routeName, arguments: args);
  }

  static Future<dynamic> pushNamedReplacementNamed(
      {required String routeName, Object? args}) {
    return _rootNavigator.pushReplacementNamed(routeName, arguments: args);
  }
}
