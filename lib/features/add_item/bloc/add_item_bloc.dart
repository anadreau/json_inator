import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_item_event.dart';
part 'add_item_state.dart';

class AddItemBloc extends Bloc<AddItemEvent, AddItemState> {
  AddItemBloc() : super(AddItemInitial()) {
    on<AddItem>((event, emit) {
      final newItem = <String, dynamic>{};
    });
  }
}

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
  ref.set(currentDataIsLoading, true);
}, name: 'addItem');

final newItem = Creator((ref) => <String, dynamic>{'Add Item': 'new Data'},
    name: 'newItem');

newItemBuilder(String key, dynamic value) {
  var temp = <String, dynamic>{};
  temp.addAll({key: value});
}
