import 'package:flutter/material.dart';
import 'package:project1/todo_model/todo.dart';

void main() {
  runApp(
      MaterialApp(
          home: MyApp(
            items: [
              Todo(id: 1, title: "Todo 1", description: "Une description"),
              Todo(id: 2, title: "Todo 2", description: "Une deuxième description"),
              Todo(id: 1, title: "Todo 3", description: "Une troisième description")
            ],
  ),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.items}) : super(key: key);
  final List<Todo> items;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mon app Todo",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Ma liste"),
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

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulaire d'ajout"),
      ),
      body: Center(
        child: Column(
          children: [
            //Form d'ajout
            const AddTaskForm(),
            // Back button
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Revenir en arrière'),
            ),
          ],
        ),
      ),
    );
  }
}

// Create a Form widget.
class AddTaskForm extends StatefulWidget {
  const AddTaskForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<AddTaskForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Merci d'entrer une valeur valide";
              }
              return null;
            },
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a confirmation page.
                  Navigator.push(
                    context,
                    // Il est possible d'ajouter des arguments qui seront passés au constructeur
                    MaterialPageRoute(builder: (context) => ConfirmPage()),
                  );
                }
              },
              child: const Text('Enregistrer'),
            ),
          ),
        ],
      ),
    );
  }
}


class ConfirmPage extends StatelessWidget {
  const ConfirmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Confirmation d'ajout de la tâche"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Bravo ! C'est ajouté ;)"),
            // Back button
            ElevatedButton(
              onPressed: () {
                //Retour home page
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text("Revenir à la page d'accueil"),
            ),
          ],
        ),
      ),
    );
  }
}