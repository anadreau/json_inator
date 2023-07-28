import 'package:creator/creator.dart';
import 'package:json_inator/features/save_to_file/save_file.dart';

//TO-DO: #6 delete value or list. @anadreau
final deleteItem = Creator<void>((ref) {
  var tempData = ref.read(currentData);
  var chosenItem = ref.read(itemToDelete).keys;
  tempData.removeWhere((key, value) => key == chosenItem.first);
  ref.set(currentData, tempData);
  ref.set(currentDataIsLoading, true);
}, name: 'deleteItem');

final itemToDelete =
    Creator((ref) => <String, dynamic>{}, name: 'itemToDelete');
