//TO-DO: #1 save file to .json. @anadreau

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:creator/creator.dart';
import 'package:file_picker/file_picker.dart';

/// Takes a [data] object and writes it to a file at [filename]
final saveFile = Creator<void>((ref) async {
  var fileName = await ref.read(getDirectoryCreator) ?? 'No Path Selected';
  var raw = ref.read(data);
  File file = File(fileName);
  file.writeAsStringSync(jsonEncode(raw));
}, name: 'saveFile');

final data = Creator((ref) => {'title': 'Save test', 'subject': 'testing'},
    name: 'Data');

final getDirectoryCreator = Creator((ref) async {
  final String? chosenDir = await FilePicker.platform.saveFile();
  //final String directoryWithfilename = '$chosenDir' r'\testSave.json';
  if (chosenDir != null) {
    log(chosenDir);
  }

  //log(directoryWithfilename);
  //return directoryWithfilename;
  return chosenDir;
}, name: 'getDirectoryCreator');
