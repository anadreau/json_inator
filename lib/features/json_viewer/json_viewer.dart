import 'package:creator/creator.dart';
import 'package:flutter/material.dart';
import 'package:json_inator/features/delete_item/delete_item.dart';
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
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ListTile(
                    title: Center(
                      child: Text(
                          '${entry.keys.elementAt(index)} : ${entry.values.elementAt(index)}'),
                    ),
                    trailing: Watcher((context, ref, child) => MaterialButton(
                          onPressed: () {
                            ref.set(itemToDelete, {
                              entry.keys.elementAt(index):
                                  entry.values.elementAt(index)
                            });
                            ref.read(deleteItem);
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
