import 'dart:developer';
import 'package:basis_batch/cmd-handler/cmd-handler.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String inputDirPath = '';
  String outputDirPath = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Container(
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 10),
                    width: 120,
                    child: Text('输入文件路径：')),
                Expanded(
                  child: Text(
                    '$inputDirPath',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: onInputFilePickBtnTap,
                  child: Container(
                    width: 40,
                    child: Text('···'),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 10),
                    width: 120,
                    child: Text('输出文件路径：')),
                Expanded(
                  child: Text(
                    '$outputDirPath',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: onOutputFilePickBtnTap,
                  child: Container(
                    width: 40,
                    child: Text('···'),
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 60,
            child: GestureDetector(
                onTap: onStartBtnTap,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 64, 158, 255),
                    ),
                    padding:
                        EdgeInsets.only(left: 15, top: 5, right: 15, bottom: 5),
                    child: Text(
                      '开始转换',
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ))),
          ),
        ],
      )),
    );
  }

  Future<void> onOutputFilePickBtnTap() async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

    if (selectedDirectory != null) {
      setState(() {
        outputDirPath = selectedDirectory;
      });
    }
  }

  Future<void> onInputFilePickBtnTap() async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

    if (selectedDirectory != null) {
      setState(() {
        inputDirPath = selectedDirectory;
      });
    }
  }

  void onStartBtnTap() {
    CmdHandler.runBasisCmd(inputDirPath, outputDirPath);
  }
}
