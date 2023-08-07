import 'dart:developer';

import 'package:creator/creator.dart';
import 'package:json_inator/features/save_to_file/save_file.dart';

final newListItem = Creator(
    (ref) => <String, dynamic>{
          'Add Item': ['new Data']
        },
    name: 'newListItem');

final addListItem = Creator<void>((ref) {
  //Data in the saveData Creator
  var oldData = ref.read(currentData);
  log('oldData: $oldData');
  //Data in newItem
  var tempData = ref.read(newListItem);
  log('tempData: $tempData');
  //Add newItem to saveData
  oldData.addAll(tempData);
  var newData = oldData;
  log('newData: $newData');
  //update saveData
  ref.set(currentData, newData);
}, name: 'addListItem');
