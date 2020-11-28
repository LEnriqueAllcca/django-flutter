import 'package:app/api/api.dart';
import 'package:app/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTodoScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final todoTitleController = TextEditingController();
  final todoDesController = TextEditingController();

  void onAdd() {
    final String textVal = todoTitleController.text;
    final String desVal = todoDesController.text;

    if (textVal.isNotEmpty && desVal.isNotEmpty) {
      final Todo todo = Todo(categoria: textVal, descripcion: desVal);
      Provider.of<TodoProvider>(context, listen: false).addTodo(todo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agregar Categoria'),
      
      backgroundColor: Colors.brown,),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                      decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orange,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Ingrese el nombre de la categoria',
                  ),
                  controller: todoTitleController,
                  ),
                  SizedBox(height: 10),
              TextField(
                      decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orange,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Ingrese una descripción',
                  ),
                  controller: todoDesController,
                  ),
                  SizedBox(height: 10),
              RaisedButton(
                  child: Text('Agregar'),
                  textColor: Colors.white,
                  color: Colors.green,
                  padding: const EdgeInsets.all(8.0),
                  onPressed: () {
                    onAdd();
                    Navigator.of(context).pop();
                  })
            ],
          )
        
      ),
    );
  }
}
