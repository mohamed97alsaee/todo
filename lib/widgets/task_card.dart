import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/task_model.dart';
import '../screens/detailes_screen.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key, required this.taskModel, required this.onChanged});
  final TaskModel taskModel;
  final Function onChanged;
  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => DetailsScreen(
                      taskModel: widget.taskModel,
                    )));
      },
      child: ListTile(
        title: Text(widget.taskModel.title),
        subtitle: Text(widget.taskModel.createdAt
            .toString()
            .substring(0, 10)
            .replaceAll('-', '/')),
        trailing: Checkbox(
            value: widget.taskModel.isDone,
            onChanged: (value) {
              widget.onChanged();
            }),
      ),
    );
  }
}
