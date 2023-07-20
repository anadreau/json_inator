//TO-DO: #5 add value or list. @anadreau

import 'dart:developer';

import 'package:creator/creator.dart';
import 'package:json_inator/features/save_to_file/save_file.dart';

final addItem = Creator<void>((ref) {
  var oldData = ref.read(saveData);
  log('oldData: $oldData');
  var tempData = ref.read(newItem);
  log('tempData: $tempData');
  oldData.addAll(tempData);
  var newData = oldData;
  log('newData: $newData');
  ref.set(saveData, newData);
}, name: 'addItem');

final newItem = Creator((ref) => <String, dynamic>{'Add Item': 'new Data'},
    name: 'newItem');
