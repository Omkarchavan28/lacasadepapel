import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  // For your reference print the AppDoc directory

  return directory.path;
}

Future<File> _localFile(String fileName) async {
  final path = await _localPath;
  return File('$path/$fileName.txt');
}

Future<String> readContent(String fileName) async {
  try {
    final file = await _localFile(fileName);
    // Read the file
    String contents = await file.readAsString();
    // Returning the contents of the file

    return contents;
  } catch (e) {
    // If encountering an error, return
    print(e);
    Future<String> contents;
    return contents;
  }
}

Future<File> writeContent(String fileName, String data) async {
  final file = await _localFile(fileName);
  // Write the file
  return file.writeAsString(data);
}
