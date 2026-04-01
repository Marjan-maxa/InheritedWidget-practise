import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manage/todo.dart';
import 'package:state_manage/todo_controller.dart';
class NewTodoAddScreen extends StatefulWidget {
  const NewTodoAddScreen({super.key});

  @override
  State<NewTodoAddScreen> createState() => _NewTodoAddScreenState();
}

class _NewTodoAddScreenState extends State<NewTodoAddScreen> {
  final  TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final todoController = context.read<TodoController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text('Add Feild',style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
            TextField(
              autofocus: true,
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),

                hintText: 'Enter todo title',
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white
              ),
                onPressed: (){
                todoController.addTodo(Todo(title: titleController.text));
                titleController.clear();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Todo added successfully')));
                Navigator.pop(context);
                }, child: Text('Add Todo')),
          ],
        ),
      ),

    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
  }
}


