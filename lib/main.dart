import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'pages/app.dart';

void main(List<String> arguments) async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions =
      WindowOptions(size: Size(600, 400), title: 'basis批量处理工具');
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  runApp(const MyApp());
}
