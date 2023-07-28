import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:creator/creator.dart';
import 'package:file_picker/file_picker.dart';

/// Takes a [currentData] object and writes it to a file at [filename]
final saveFileCreator = Creator<void>((ref) async {
  var fileName = await ref.read(selectSaveFileCreator) ?? 'No Path Selected';
  var raw = ref.read(currentData);
  File file = File(fileName);
  file.writeAsStringSync(jsonEncode(raw));
}, name: 'saveFileCreator');

final currentData = Creator((ref) => <String, dynamic>{}, name: 'currentData');

final viewData = Creator((ref) {
  ref.watch(currentDataIsLoading);
  var data = ref.read(currentData);
  log('here');
  if (data.isEmpty) {
    data = {'no data': 'Empty'};
  }
  ref.set(currentDataIsLoading, false);
  return data;
}, name: 'viewData');

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

final currentDataIsLoading =
    Creator((ref) => true, name: 'currentDataIsLoading');
