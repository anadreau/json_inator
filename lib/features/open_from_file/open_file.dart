import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:creator/creator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:json_inator/features/save_to_file/save_file.dart';

final openData = Creator((ref) => <String, dynamic>{}, name: 'openData');

final openFileCreator = Creator<void>((ref) async {
  var filePath = await ref.read(selectOpenFileCreator);
  if (filePath != null) {
    var file = File(filePath);
    String fileData = file.readAsStringSync();
    log('fileData: $fileData');
    var fileJson = jsonDecode(fileData);
    ref.set(openData, fileJson);
    ref.set(saveData, fileJson);
    log('openData: ${ref.read(openData).toString()}');
    log('saveData: ${ref.read(saveData).toString()}');
  }
}, name: 'openFileCreator');

final selectOpenFileCreator = Creator((ref) async {
  final FilePickerResult? fileResult = await FilePicker.platform
      .pickFiles(allowedExtensions: ['json'], type: FileType.custom);
  final String? chosenFile = fileResult?.paths.first;
  log("chosenFile: $chosenFile");
  return chosenFile;
}, name: 'selectOpenFileCreator');
