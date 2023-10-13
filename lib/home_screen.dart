import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moudel10/task.dart';
import 'package:moudel10/update_task_modal.dart';

import 'add_new_task_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Task> taskList=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo-App'),
        backgroundColor: Colors.deepPurple[300],
      ),
      body: ListView.separated(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return  AlertDialog(
                      title: Text('Actions'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(

                            title: const Text('Update'),
                            leading: const Icon(Icons.edit),
                            onTap: (){
                              Navigator.pop(context);

                              showModalBottomSheet(context: context, builder: (context){

                                return UpdateTaskModal();
                              });

                            },
                          ),
                          Divider(
                            height: 0,
                          ),
                          ListTile(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            title: Text('Delete'),
                            leading: Icon(Icons.delete),
                          )
                        ],
                      ),
                    );
                  });
            },
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            title: Text('I have to home work for my school and university '),
            subtitle: Text('8-10-24'),
            trailing: Text('pending'),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 4,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return const AddnewtaskModel();
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


