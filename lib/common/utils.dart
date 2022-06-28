import 'dart:io';

void logToTest(String content) {
  File testLog =
      File('C:\\MyData\\GithubProjects\\basis-batch-flutter\\test-log.txt');
  testLog.writeAsString(content);
}
