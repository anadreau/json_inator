import 'package:creator/creator.dart';
import 'package:flutter/material.dart';
import 'package:json_inator/features/delete_item/delete_item.dart';
import 'package:json_inator/features/save_to_file/save_file.dart';

class JsonViewer extends StatefulWidget {
  const JsonViewer({super.key});

  @override
  State<JsonViewer> createState() => _JsonViewerState();
}

class _JsonViewerState extends State<JsonViewer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Watcher(
        (context, ref, child) {
          final entry = ref.watch(viewData.asyncData).data ?? {};
          return Padding(
            padding: const EdgeInsets.all(50.0),
            child: ListView.builder(
              itemCount: entry.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ListTile(
                    title: Center(
                      child: Text(
                          '${entry.keys.elementAt(index)} : ${entry.values.elementAt(index)}'),
                    ),
                    trailing: Watcher((context, ref, child) => MaterialButton(
                          onPressed: () {
                            setState(() {
                              var key = entry.keys.elementAt(index);
                              var value = entry.values.elementAt(index);
                              ref.set(itemToDelete, {key: value});
                              ref.read(deleteItem);
                            });
                          },
                          child: const Icon(Icons.delete),
                        )),
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
