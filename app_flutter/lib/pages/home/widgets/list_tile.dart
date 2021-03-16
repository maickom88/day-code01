import 'package:app_flutter/pages/home/home_controller.dart';
import 'package:flutter/material.dart';

class CardTile extends StatefulWidget {
  final String title;
  final int id;
  final HomeController controller;
  final bool value;

  const CardTile({
    @required this.controller,
    @required this.title,
    @required this.id,
    @required this.value,
  });

  @override
  _CardTileState createState() => _CardTileState();
}

class _CardTileState extends State<CardTile> {
  bool value;
  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: () => widget.controller.deleteTask(widget.id),
        icon: Icon(Icons.delete),
      ),
      title: Text(widget.title),
      trailing: Checkbox(
        onChanged: (change) {
          widget.controller.updateTask(
            task: widget.title,
            id: widget.id,
            value: change,
          );
          setState(() {
            value = change;
          });
        },
        value: value ?? widget.value,
      ),
    );
  }
}
