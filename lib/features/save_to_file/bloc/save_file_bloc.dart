import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';

part 'save_file_event.dart';
part 'save_file_state.dart';

class SaveFileBloc extends Bloc<SaveFileEvent, SaveFileState> {
  SaveFileBloc() : super(SaveFileInitialState()) {
    on<SaveFile>((event, emit) {});

    on<SelectFile>(_selectFile);
  }
}

FutureOr<void> _selectFile(
    SelectFile event, Emitter<SaveFileState> emit) async {
  final String? chosenDir = await FilePicker.platform
      .saveFile(allowedExtensions: ['json'], type: FileType.custom);
  //final String directoryWithfilename = '$chosenDir' r'\testSave.json';
  if (chosenDir != null) {
    log(chosenDir);
  }
}

/// Takes a [currentData] object and writes it to a file at [filename]
final saveFileCreator = Creator<void>((ref) async {
  var fileName = await ref.read(selectSaveFileCreator) ?? 'No Path Selected';
  var raw = ref.read(currentData);
  File file = File('$fileName.json');
  file.writeAsStringSync(jsonEncode(raw));
}, name: 'saveFileCreator');

final currentData = Creator((ref) => <String, dynamic>{}, name: 'currentData');

final viewData = Emitter<Map<String, dynamic>>((ref, emit) {
  ref.watch(currentDataIsLoading);
  final data = ref.watch(currentData);
  emit(data);
  ref.set(currentDataIsLoading, false);
}, name: 'viewData', keepAlive: true);

final selectSaveFileCreator = Creator((ref) async {
  //log(directoryWithfilename);
  //return directoryWithfilename;
  return chosenDir;
}, name: 'selectSaveFileCreator');

final currentDataIsLoading = Creator.value(false, name: 'currentDataIsLoading');
