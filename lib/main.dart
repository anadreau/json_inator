import 'package:creator/creator.dart';
import 'package:flutter/material.dart';
import 'package:json_inator/features/add_item/add_item.dart';
import 'package:json_inator/features/open_from_file/open_file.dart';
import 'package:json_inator/features/save_to_file/save_file.dart';

//TO-DO: #2 save as file to .json. @anadreau
//TO-DO: #4 display editable list that will be formatted as json. @anadreau
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
                    Watcher(
                      (context, ref, child) => MenuItemButton(
                        child: const Text('add'),
                        onPressed: () => ref.read(addItem),
                      ),
                    ),
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
            Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Placeholder(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
