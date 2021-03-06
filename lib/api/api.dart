import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/todo.dart';
import 'package:http/http.dart' as http;
import 'package:app/models/todo.dart';

class TodoProvider with ChangeNotifier {
  TodoProvider() {
    this.fetchTasks();
  }

  List<Todo> _todos = [];

  List<Todo> get todos {
    return [..._todos];
  }

  void toggleTodo(Todo todo) async {
    final taskIndex = _todos.indexOf(todo);
    _todos[taskIndex].toggleCompleted();
    final response = await http.patch(
      'http://10.0.2.2:8000/apis/v1/${todo.id}/',
      headers: {"Content-Type": "application/json"},
      body: json.encode(todo),
    );
    if (response.statusCode == 200) {
      notifyListeners();
    } else {
      _todos[taskIndex].toggleCompleted(); //revert back
    }
  }

  void addTodo(Todo todo) async {
    final response = await http.post('http://10.0.2.2:8000/apis/v1/',
        headers: {"Content-Type": "application/json"}, body: json.encode(todo));
    if (response.statusCode == 201) {
      todo.id = json.decode(response.body)['id'];
      _todos.add(todo);
      notifyListeners();
    }
  }

  void deleteTodo(Todo todo) async {
    final response =
        await http.delete('http://10.0.2.2:8000/apis/v1/${todo.id}/');
    if (response.statusCode == 204) {
      _todos.remove(todo);
      notifyListeners();
    }
  }

  fetchTasks() async {
    final url = 'http://10.0.2.2:8000/apis/v1/?format=json';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _todos = data.map<Todo>((json) => Todo.fromJson(json)).toList();
      notifyListeners();
    }
  }
}
