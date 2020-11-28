import 'package:app/api/api.dart';
import 'package:app/screens/search.dart';
/* import 'package:app/screens/editar.dart'; */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/addTodo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoP = Provider.of<TodoProvider>(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text('Categorias'),
          actions: <Widget>[
            IconButton(
              onPressed: (){
                Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => SearchPage()));
              },
              icon: Icon(Icons.search),
            ),
          ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: todoP.todos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              onTap: (){
                
              },
              trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    todoP.deleteTodo(todoP.todos[index]);
                  }),
              title: Text(
                todoP.todos[index].categoria,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                todoP.todos[index].descripcion,
                style: TextStyle(fontSize: 15, color: Colors.black),
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => AddTodoScreen()));
          }),
          
    );
  }
}
