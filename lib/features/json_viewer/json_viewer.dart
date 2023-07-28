//TO-DO: #4 display editable list that will be formatted as json. @anadreau

import 'package:creator/creator.dart';
import 'package:flutter/material.dart';
import 'package:json_inator/features/save_to_file/save_file.dart';

class JsonViewer extends StatelessWidget {
  const JsonViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Watcher(
        (context, ref, child) {
          var entry = ref.watch(saveData);
          return Padding(
            padding: const EdgeInsets.all(50.0),
            child: ListView.builder(
              itemCount: entry.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                        '${entry.keys.elementAt(index)} : ${entry.values.elementAt(index)}'),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
