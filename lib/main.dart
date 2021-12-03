import 'package:flutter/material.dart';
import 'package:todo_application/models/todo_model.dart';
import 'package:todo_application/models/todo.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(items: [Todo(id: 1,title: "Todo 1",description: "Une description"),
      Todo(id: 2,title: "Todo 2",description: "Une deuxième description"),
      Todo(id: 1,title: "Todo 3",description: "Une troisième description")]
      ,),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.items}) : super(key: key);
  final List<Todo> items;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("test"),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index].title),
              subtitle: Text(items[index].description),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Ajouter une tâche',
          onPressed: () {
            Navigator.push(
              context,
              // Il est possible d'ajouter des arguments qui seront passés au constructeur
              MaterialPageRoute(builder: (context) => AddPage()),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _AddTodo() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _AddTodo,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class AddPage extends StatelessWidget{
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulaire d'ajout"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
