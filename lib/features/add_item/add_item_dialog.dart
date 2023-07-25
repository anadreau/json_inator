import 'dart:developer';

import 'package:creator/creator.dart';
import 'package:flutter/material.dart';
import 'package:json_inator/features/add_item/add_item.dart';

//Pop-up dialogue to add item
class AddItemDialog extends StatefulWidget {
  const AddItemDialog({super.key});

  @override
  State<AddItemDialog> createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  final _formkey = GlobalKey<FormState>();
  final keyController = TextEditingController();
  final valueController = TextEditingController();

  @override
  void dispose() {
    keyController.dispose();
    valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Add Item',
        textAlign: TextAlign.center,
      ),
      content: Form(
        key: _formkey,
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
                      controller: keyController,
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
                          return 'Please enter valid String';
                        }
                        return null;
                      },
                      controller: valueController,
                      decoration: const InputDecoration(hintText: 'Value'),
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
            keyController.clear();
            valueController.clear();
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        //submit Dialog as new Item
        Watcher(
          (context, ref, child) => MaterialButton(
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                ref.set(newItem, {keyController.text: valueController.text});
                log(ref.read(newItem).toString());
                ref.read(addItem);
                keyController.clear();
                valueController.clear();
                Navigator.of(context).pop();
              }
            },
            child: const Text('Submit'),
          ),
        ),
      ],
    );
  }
}
