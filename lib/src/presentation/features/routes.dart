import 'package:flutter/material.dart';
import 'package:flutter_base/src/presentation/features/onboarding/onboarding_page.dart';

import '../../common/constants.dart';

class Routes {
  static Map<String, WidgetBuilder> _getAll(RouteSettings settings) => {
        RouteList.root: (context) {
          return Scaffold(
            body: Container(),
          );
        },
        RouteList.onboarding: (context) {
          return const OnBoarding();
        }
      };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final _builder = _getAll(settings)[settings.name]!;

    return MaterialPageRoute(
        builder: _builder, settings: settings, fullscreenDialog: false);
  }
}
