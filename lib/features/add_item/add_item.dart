import 'dart:developer';

import 'package:creator/creator.dart';
import 'package:json_inator/features/save_to_file/save_file.dart';

/// Creator that takes the saveData and adds the tempData to it.
final addItem = Creator<void>((ref) {
  //Data in the saveData Creator
  var oldData = ref.read(currentData);
  log('oldData: $oldData');
  //Data in newItem
  var tempData = ref.read(newItem);
  log('tempData: $tempData');
  //Add newItem to saveData
  oldData.addAll(tempData);
  var newData = oldData;
  log('newData: $newData');
  //update saveData
  ref.set(currentData, newData);
}, name: 'addItem');

final newItem = Creator((ref) => <String, dynamic>{'Add Item': 'new Data'},
    name: 'newItem');

newItemBuilder(String key, dynamic value) {
  var temp = <String, dynamic>{};
  temp.addAll({key: value});
}
