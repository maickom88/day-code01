import 'dart:convert';

import 'package:app_flutter/models/todo_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HomeController {
  ValueNotifier<List<TodoModel>> todos = ValueNotifier([]);

  Future<void> getTodos() async {
    try {
      final response = await http.get("http://10.0.2.2:3001/tasks");
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;
        todos.value = body.map((task) => TodoModel.fromMap(task)).toList();
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateTask({
    String task,
    int id,
    bool value,
  }) async {
    try {
      final header = {"content-type": "application/json"};
      final todo = TodoModel(id: id, title: task, value: value);
      await http.put(
        "http://10.0.2.2:3001/tasks/$id",
        body: todo.toJson(),
        headers: header,
      );
      await getTodos();
    } catch (e) {
      throw e;
    }
  }

  Future<void> saveTask({
    String task,
    int id,
    bool value,
  }) async {
    try {
      final header = {"content-type": "application/json"};
      final todo = TodoModel(title: task, value: value);
      await http.post(
        "http://10.0.2.2:3001/tasks",
        body: todo.toJson(),
        headers: header,
      );
    } catch (e) {
      throw e;
    }
  }

  Future<void> deleteTask(int id) async {
    try {
      await http.delete("http://10.0.2.2:3001/tasks/$id");
      await getTodos();
    } catch (e) {
      throw e;
    }
  }
}
