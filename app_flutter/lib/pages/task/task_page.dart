import 'package:app_flutter/pages/home/home_controller.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  final HomeController controller;

  const TaskPage({Key key, this.controller}) : super(key: key);
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  bool value = false;
  TextEditingController taskController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: taskController,
              decoration: InputDecoration(
                labelText: "Task",
              ),
            ),
            Checkbox(
              value: value,
              onChanged: (change) {
                setState(() {
                  value = change;
                });
              },
            ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () async {
                  await widget.controller
                      .saveTask(task: taskController.text, value: value);
                  Navigator.pop(context);
                },
                child: Text("Save"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
