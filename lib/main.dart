import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_base/src/common/di/injection.dart';

import 'src/presentation/app.dart';

void main() async {
  runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();

    //* Injection
    await Injection.inject();

    runApp(const Application());
  });
}
