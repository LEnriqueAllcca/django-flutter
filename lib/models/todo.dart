class Todo {
  int id;
  final String categoria;
  final String descripcion;
  bool completed;

  Todo({this.id, this.categoria, this.descripcion});

   void toggleCompleted() {
    completed = !completed;
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
        id: json['id'], categoria: json['categoria'], descripcion: json['descripcion']);
  }
  dynamic toJson() => {'id': id, 'categoria': categoria, 'descripcion': descripcion};
}
