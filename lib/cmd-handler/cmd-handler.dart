import 'dart:developer';
import 'package:path/path.dart' as p;
import 'dart:io';

class CmdHandler {
  static Future<void> runBasisCmd(
      String inputDirPath, String outputDirPath) async {
    log('start handlde dir $inputDirPath');
    String basisExePath = p.absolute('assets\\exe\\basisu.exe');

    var dir = Directory(inputDirPath);
    var files = dir.listSync();
    for (var i = 0; i < files.length; i++) {
      var item = files[i];
      log(item.path);
      String filePath = item.path;
      Process.run(basisExePath,
          [filePath, '-no_ktx', '-etc1_only', '-output_path', outputDirPath]);
    }
  }
}
