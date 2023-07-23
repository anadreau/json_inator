//Pop-up dialogue to add item
import 'package:flutter/material.dart';

class AddItemDialog extends StatelessWidget {
  const AddItemDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Column(
      children: [
        const Text('Add Item'),
        const Row(
          children: [
            //key
            TextField(),
            //value
            TextField(),
          ],
        ),
        Row(
          children: [
            //Cancel Dialog
            MaterialButton(onPressed: () {}),
            //submit Dialog as new Item
            MaterialButton(onPressed: () {}),
          ],
        ),
      ],
    ));
  }
}
