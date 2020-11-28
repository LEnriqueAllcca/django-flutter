/* import 'package:app/api/api.dart';
import 'package:app/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class EditarProducto extends StatefulWidget{
   @override
  _EditarProductoState createState() => _EditarProductoState();
}

class _EditarProductoState extends State<EditarProducto>{
final todoTitleController = TextEditingController();
  final todoDesController = TextEditingController();

  void onAdd() {
    final String textVal = todoTitleController.text;
    final String desVal = todoDesController.text;

    if (textVal.isNotEmpty && desVal.isNotEmpty) {
      final Todo todo = Todo(categoria: textVal, descripcion: desVal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Actualizar Categoria')),
      body: ListView(
        children: [
          Container(
              child: Column(
            children: [
              TextField(
                controller: todoTitleController,
              ),
              TextField(
                controller: todoDesController,
              ),
              RaisedButton(
                  child: Text('Actualizar'),
                  onPressed: () {
                    onAdd();
                    Navigator.of(context).pop();
                  })
            ],
          ))
        ],),);}}
 */