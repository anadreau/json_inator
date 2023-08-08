import 'dart:developer';

import 'package:creator/creator.dart';
import 'package:json_inator/features/save_to_file/save_file.dart';

//TO-DO: #7 edit value or list. @anadreau
//Currently adds new line instead of replacing.
final itemToEdit = Creator.value(<String, dynamic>{}, name: 'itemToEdit');

final itemEditted = Creator.value(<String, dynamic>{}, name: 'itemEditted');

final editItem = Creator<void>((ref) {
  //Data in the saveData Creator
  var oldData = ref.read(currentData);
  log('oldData: $oldData');
  //Data in newItem
  var editData = ref.read(itemToEdit);
  log('tempData: $editData');
  var edittedData = ref.read(itemEditted);
  log('edittedData: $edittedData');
  //Add newItem to saveData
  Map<String, dynamic> newData = {};
  log('newData before: $newData');
  log('editData.keys.first: ${editData.keys.first}');
  log('editData.values.first: ${editData.values.first}');
  oldData.forEach((key, value) {
    if (key == editData.keys.first) {
      newData[edittedData.keys.first] = edittedData.values.first;
    } else {
      newData.addAll({key: '$value'});
    }
  });

  log('newData after: $newData');
  //update saveData
  ref.set(currentData, newData);
  ref.set(currentDataIsLoading, true);
}, name: 'editItem');
