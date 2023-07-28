import 'package:creator/creator.dart';
import 'package:flutter/material.dart';
import 'package:json_inator/features/save_to_file/save_file.dart';

class JsonRaw extends StatelessWidget {
  const JsonRaw({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Watcher(
        (context, ref, child) => SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text(ref.watch(saveData).toString()),
            ),
          ),
        ),
      ),
    );
  }
}
