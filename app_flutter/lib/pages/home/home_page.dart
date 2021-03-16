import 'package:app_flutter/models/todo_model.dart';
import 'package:app_flutter/pages/home/home_controller.dart';
import 'package:app_flutter/pages/task/task_page.dart';
import 'package:flutter/material.dart';

import 'widgets/list_tile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController _controller;
  @override
  void initState() {
    _controller = HomeController();
    _controller.getTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ValueListenableBuilder(
        valueListenable: _controller.todos,
        builder: (context, todos, widget) {
          if (todos.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final task = todos[index];
              return CardTile(
                title: task.title,
                value: task.value,
                id: task.id,
                controller: _controller,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskPage(controller: _controller),
            ),
          );
          _controller.getTodos();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        "Todo List",
      ),
      centerTitle: true,
    );
  }
}
