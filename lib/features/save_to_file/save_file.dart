import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:creator/creator.dart';
import 'package:file_picker/file_picker.dart';

/// Takes a [saveData] object and writes it to a file at [filename]
final saveFileCreator = Creator<void>((ref) async {
  var fileName = await ref.read(selectSaveFileCreator) ?? 'No Path Selected';
  var raw = ref.read(saveData);
  File file = File(fileName);
  file.writeAsStringSync(jsonEncode(raw));
}, name: 'saveFileCreator');

final saveData = Creator(
    (ref) => <String, dynamic>{'title': 'Save test', 'subject': 'testing'},
    name: 'saveData');

final selectSaveFileCreator = Creator((ref) async {
  final String? chosenDir = await FilePicker.platform
      .saveFile(allowedExtensions: ['json'], type: FileType.custom);
  //final String directoryWithfilename = '$chosenDir' r'\testSave.json';
  if (chosenDir != null) {
    log(chosenDir);
  }

  //log(directoryWithfilename);
  //return directoryWithfilename;
  return chosenDir;
}, name: 'selectSaveFileCreator');
