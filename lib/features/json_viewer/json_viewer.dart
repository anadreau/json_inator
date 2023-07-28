import 'package:creator/creator.dart';
import 'package:flutter/material.dart';
import 'package:json_inator/features/delete_item/delete_item.dart';
import 'package:json_inator/features/edit_item/edit_item.dart';
import 'package:json_inator/features/edit_item/edit_item_dialog.dart';
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
                      tileColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      leading: Watcher(
                        (context, ref, child) => MaterialButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const EditItemDialog();
                                });
                            setState(() {
                              var key = entry.keys.elementAt(index);
                              var value = entry.values.elementAt(index);
                              ref.set(itemToEdit, {key: value});
                              ref.read(editItem);
                            });
                          },
                          child: const Icon(Icons.edit),
                        ),
                      ),
                      title: Text(
                        entry.keys.elementAt(index),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(entry.values.elementAt(index).toString()),
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
                          ))),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
