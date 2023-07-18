//TO-DO: #1 save file to .json. @anadreau

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:creator/creator.dart';
import 'package:file_picker/file_picker.dart';

/// Takes a [data] object and writes it to a file at [filename]
final saveFile = Creator((ref) async {
  var fileName = await ref.watch(getDirectoryCreator);
  var raw = ref.watch(data);
  File file = File(fileName);
  file.writeAsStringSync(jsonEncode(raw));
}, name: 'saveFile');

final data = Creator((ref) => {'title': 'Save test', 'subject': 'testing'},
    name: 'Data');

final getDirectoryCreator = Creator((ref) async {
  final String? chosenDir = await FilePicker.platform.getDirectoryPath();
  final String directoryWithfilename = '$chosenDir' r'\testSave.json';
  log(directoryWithfilename);
  return directoryWithfilename;
}, name: 'getDirectoryCreator');
