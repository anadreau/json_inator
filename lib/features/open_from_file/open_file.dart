import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:creator/creator.dart';
import 'package:file_picker/file_picker.dart';

final openData = Creator((ref) => <String, dynamic>{}, name: 'openData');

final openFileCreator = Creator<void>((ref) async {
  var filePath = await ref.read(selectOpenFileCreator);
  var file = File(filePath!);
  String fileData = file.readAsStringSync();
  log('fileData: $fileData');
  var fileJson = jsonDecode(fileData);
  ref.set(openData, fileJson);
  log('openData: ${ref.read(openData).toString()}');
}, name: 'openFileCreator');

final selectOpenFileCreator = Creator((ref) async {
  final FilePickerResult? fileResult = await FilePicker.platform.pickFiles();
  final String? chosenFile = fileResult!.paths.first;
  log("chosenFile: $chosenFile");
  return chosenFile;
}, name: 'selectOpenFileCreator');
