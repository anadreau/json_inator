import 'package:creator/creator.dart';
import 'package:flutter/material.dart';
import 'package:json_inator/features/add_item/add_item_dialog.dart';
import 'package:json_inator/features/json_viewer/json_viewer.dart';
import 'package:json_inator/features/open_from_file/open_file.dart';
import 'package:json_inator/features/save_to_file/save_file.dart';

//TO-DO: #2 save as file to .json. @anadreau
//TO-DO: #6 delete value or list. @anadreau
//TO-DO: #7 edit value or list. @anadreau
//TO-DO: #8 preview final json. @anadreau

void main() {
  runApp(CreatorGraph(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          ],
        ),
      ),
      body: Center(
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Expanded(flex: 3, child: JsonViewer()),
            const Divider(),
            const Flexible(child: FractionallySizedBox(heightFactor: .1)),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Raw Json'),
                Watcher((context, ref, child) =>
                    Text(ref.watch(saveData).toString()))
              ],
            ),
            const Flexible(child: FractionallySizedBox(heightFactor: .1)),
          ],
        ),
      ),
    );
  }
}
