import 'package:creator/creator.dart';
import 'package:flutter/material.dart';
import 'package:json_inator/features/add_item/add_item_dialog.dart';
import 'package:json_inator/features/json_viewer/json_raw.dart';
import 'package:json_inator/features/json_viewer/json_toggle.dart';
import 'package:json_inator/features/json_viewer/json_viewer.dart';
import 'package:json_inator/features/open_from_file/open_file.dart';
import 'package:json_inator/features/save_to_file/save_file.dart';

//TO-DO: #2 save as file to .json. @anadreau
//TO-DO: #8 preview final json. @anadreau

void main() {
  runApp(CreatorGraph(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Json-inator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Json-inator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Dummy data for save file testing
  var dummyData = {'title': 'Save test', 'subject': 'testing'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      restorationId: 'Json-inator',
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 1,
              child: MenuBar(
                children: <Widget>[
                  SubmenuButton(menuChildren: <Widget>[
                    Watcher(
                      (context, ref, child) => MenuItemButton(
                        child: const Text('Save'),
                        onPressed: () => ref.read(saveFileCreator),
                      ),
                    ),
                    Watcher(
                      (context, ref, child) => MenuItemButton(
                        child: const Text('Open'),
                        onPressed: () => ref.read(openFileCreator),
                      ),
                    ),
                    MenuItemButton(
                      child: const Text('Add Item'),
                      onPressed: () => showDialog(
                          context: context,
                          builder: (context) {
                            return const AddItemDialog();
                          }),
                    ),
                    MenuItemButton(
                      child: const Text('Add List'),
                      //TO-DO: #11 Create method to validate and add lists. @anadreau
                      onPressed: () => showDialog(
                          context: context,
                          builder: (context) {
                            return const AddItemDialog();
                          }),
                    )
                  ], child: const Icon(Icons.menu)),
                ],
              ),
            ),
            const JsonToggleButton(),
          ],
        ),
      ),
      body: Watcher((context, ref, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              switch (ref.watch(jsonToggleCreator) == true) {
                true => const JsonViewer(),
                false => const JsonRaw(),
              }
            ],
          )),
    );
  }
}
