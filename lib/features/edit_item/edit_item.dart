import 'dart:developer';

import 'package:creator/creator.dart';
import 'package:json_inator/features/save_to_file/save_file.dart';

//TO-DO: #7 edit value or list. @anadreau
//Currently adds new line instead of replacing.
final itemToEdit = Creator.value({}, name: 'itemToEdit');

final itemEditted = Creator.value({}, name: 'itemEditted');

final editItem = Creator<void>((ref) {
  //Data in the saveData Creator
  var oldData = ref.read(currentData);
  log('oldData: $oldData');
  //Data in newItem
  var editData = ref.read(itemToEdit);
  log('tempData: $editData');
  var edittedData = ref.read(itemEditted);
  //Add newItem to saveData
  oldData.update(editData.keys.first, (value) => edittedData);
  var newData = oldData;
  log('newData: $newData');
  //update saveData
  ref.set(currentData, newData);
  ref.set(currentDataIsLoading, true);
}, name: 'editItem');
