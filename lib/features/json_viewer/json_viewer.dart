//TO-DO: #4 display editable list that will be formatted as json. @anadreau

import 'package:creator/creator.dart';
import 'package:flutter/material.dart';
import 'package:json_inator/features/save_to_file/save_file.dart';

class JsonViewer extends StatelessWidget {
  const JsonViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Watcher(
        (context, ref, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var e in ref.watch(saveData).entries)
              Text('${e.key}: ${e.value}'),
          ],
        ),
      ),
    );
  }
}
