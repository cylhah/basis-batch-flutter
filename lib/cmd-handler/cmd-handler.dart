import 'package:basis_batch/common/env-handler.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

class CmdHandler {
  static String getBasisPath() {
    if (EnvHandler.isLocal()) {
      return p.normalize(p.join(p.current, './assets/exe/basisu.exe'));
    } else {
      return p.normalize(
          p.join(p.current, './data/flutter_assets/assets/exe/basisu.exe'));
    }
  }

  static Future<void> runBasisCmd(
      String inputDirPath, String outputDirPath) async {
    String basisExePath = CmdHandler.getBasisPath();

    var dir = Directory(inputDirPath);
    var files = dir.listSync();
    for (var i = 0; i < files.length; i++) {
      var item = files[i];
      String filePath = item.path;
      Process.run(basisExePath,
          [filePath, '-no_ktx', '-etc1_only', '-output_path', outputDirPath]);
    }
  }
}
