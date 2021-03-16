import 'dart:convert';

class TodoModel {
  final String title;
  final bool value;
  final int id;

  TodoModel({this.title, this.value, this.id});

  Map<String, dynamic> toMap() {
    return {
      'task': title,
      'done': value,
      'id': id,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      title: map['task'],
      value: map['done'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source));
}
