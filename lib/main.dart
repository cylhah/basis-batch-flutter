import 'dart:developer';
import 'package:basis_batch/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'pages/app.dart';

void main() async {
  // var nowTime = DateTime.now();
  // var RunEnv = String.fromEnvironment('RunEnv', defaultValue: 'local');
  // logToTest('alsmdkaw $nowTime $RunEnv ');

  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions =
      WindowOptions(size: Size(600, 200), title: 'basis批量处理工具');
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  runApp(const MyApp());
}
