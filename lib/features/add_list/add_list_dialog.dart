import 'package:creator/creator.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:json_inator/features/add_list/add_list.dart';

//Pop-up dialogue to add item
class AddItemListDialog extends StatefulWidget {
  const AddItemListDialog({super.key});

  @override
  State<AddItemListDialog> createState() => _AddItemListDialogState();
}

class _AddItemListDialogState extends State<AddItemListDialog> {
  final _addItemListformkey = GlobalKey<FormState>();
  final _addItemListKeyController = TextEditingController();
  final _addItemListValueController = TextEditingController();

  @override
  void dispose() {
    _addItemListKeyController.dispose();
    _addItemListValueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Add Item List',
        textAlign: TextAlign.center,
      ),
      content: Form(
        key: _addItemListformkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Text(
                  '{ ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
                //key
                SizedBox(
                    width: 150,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null ||
                            value.trimRight() == '' ||
                            value.isEmpty) {
                          return 'Please enter valid String';
                        }
                        return null;
                      },
                      controller: _addItemListKeyController,
                      decoration: const InputDecoration(hintText: 'Key'),
                    )),
                const SizedBox(width: 8),
                const Text(
                  ':',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
                const SizedBox(width: 8),
                //value
                SizedBox(
                    width: 150,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null ||
                            value.trimRight() == '' ||
                            value.isEmpty) {
                          return 'Please enter a valid String';
                        }
                        //TO-DO: create Validator for list by comma
                        return null;
                      },
                      controller: _addItemListValueController,
                      decoration: const InputDecoration(
                          hintText: '[ Item1, Item1, etc. ]'),
                    )),
                const Text(
                  ' }',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      actions: [
        //Cancel Dialog
        MaterialButton(
          onPressed: () {
            _addItemListKeyController.clear();
            _addItemListValueController.clear();
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        //submit Dialog as new Item
        Watcher(
          (context, ref, child) => MaterialButton(
            onPressed: () {
              if (_addItemListformkey.currentState!.validate()) {
                ref.set(newListItem, {
                  _addItemListKeyController.text:
                      _addItemListValueController.text
                });
                log(ref.read(newListItem).toString());

                _addItemListKeyController.clear();
                _addItemListValueController.clear();
                Navigator.of(context).pop();
              }
              setState(() {
                ref.read(addListItem);
              });
            },
            child: const Text('Submit'),
          ),
        ),
      ],
    );
  }
}
