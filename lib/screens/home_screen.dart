import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/widgets/task_card.dart';

import 'detailes_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();

  List<TaskModel> tasks = [];
  List<TaskModel> completedTasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: titleController,
                            decoration: InputDecoration(
                              hintText: 'Enter task Title',
                              hintStyle: TextStyle(
                                color: Colors.green.withOpacity(0.6),
                              ),
                            ),
                          ),
                          TextField(
                            controller: subTitleController,
                            decoration: InputDecoration(
                                hintText: 'Enter task sub title',
                                hintStyle: TextStyle(
                                    color: Colors.green.withOpacity(0.6))),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  if (titleController.text.isNotEmpty) {
                                    tasks.add(TaskModel(
                                        title: titleController.text,
                                        createdAt: DateTime.now(),
                                        subTitle:
                                            subTitleController.text.isEmpty
                                                ? null
                                                : subTitleController.text));
                                    titleController.clear();
                                    subTitleController.clear();
                                    Navigator.pop(context);

                                    setState(() {});
                                  }
                                },
                                color: Colors.green,
                                child: Row(
                                  children: const [
                                    Text(
                                      'ADD',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  titleController.clear();
                                  subTitleController.clear();
                                  Navigator.pop(context);

                                  setState(() {});
                                },
                                color: Colors.green,
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(tabs: [
              Tab(
                text: 'Waiting Tasks',
              ),
              Tab(
                text: 'Done Tasks',
              ),
            ]),
            Expanded(
              child: TabBarView(children: [
                Center(
                    child: ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          return TaskCard(
                            taskModel: tasks[index],
                            onChanged: () {
                              setState(() {
                                tasks[index].isDone = !tasks[index].isDone;
                                completedTasks.add(tasks[index]);
                                tasks.remove(tasks[index]);
                              });
                            },
                          );
                        })),
                Center(
                    child: ListView.builder(
                        itemCount: completedTasks.length,
                        itemBuilder: (context, index) {
                          return TaskCard(
                              taskModel: completedTasks[index],
                              onChanged: () {
                                setState(() {
                                  completedTasks[index].isDone =
                                      !completedTasks[index].isDone;
                                  tasks.add(completedTasks[index]);
                                  completedTasks.remove(completedTasks[index]);
                                });
                              });
                        })),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
