//Pop-up dialogue to add item
import 'package:flutter/material.dart';

class AddItemDialog extends StatelessWidget {
  const AddItemDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Item'),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              //key
              SizedBox(width: 150, child: TextField()),
              Text(' : '),
              //value
              SizedBox(width: 150, child: TextField()),
            ],
          ),
        ],
      ),
      actions: [
        //Cancel Dialog
        MaterialButton(
          onPressed: () {},
          child: const Text('Cancel'),
        ),
        //submit Dialog as new Item
        MaterialButton(
          onPressed: () {},
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
