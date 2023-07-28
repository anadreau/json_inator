import 'package:creator/creator.dart';
import 'package:flutter/material.dart';

final jsonToggleCreator = Creator((ref) => true, name: 'jsonToggleCreator');

class JsonToggleButton extends StatefulWidget {
  const JsonToggleButton({super.key});

  @override
  State<JsonToggleButton> createState() => _JsonToggleButtonState();
}

class _JsonToggleButtonState extends State<JsonToggleButton> {
  final List<bool> _jsonToggle = <bool>[true, false];

  @override
  Widget build(BuildContext context) {
    return Watcher((context, ref, child) => ToggleButtons(
          onPressed: (int index) {
            setState(() {
              for (int i = 0; i < _jsonToggle.length; i++) {
                _jsonToggle[i] = i == index;
              }
              if (index == 0) {
                ref.set(jsonToggleCreator, true);
              } else {
                (ref.set(jsonToggleCreator, false));
              }
            });
          },
          isSelected: _jsonToggle,
          children: const <Widget>[Icon(Icons.raw_on), Icon(Icons.raw_off)],
        ));
  }
}
