import 'dart:async';

import 'package:flutter/material.dart';
import 'package:millearnia/src/core/app_initializer.dart';
import 'package:millearnia/src/core/application.dart';

void main() {
  final AppInitializer appInitializer = AppInitializer();

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await appInitializer.preAppRun();

      runApp(Application());

      appInitializer.postAppRun();
    },
    (error, stack) {},
  );
}
