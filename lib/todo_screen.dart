import 'package:flutter/material.dart';
import 'package:state_manage/todo.dart';
import 'package:state_manage/todo_controller.dart';
import 'package:provider/provider.dart';
class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    final todoController = context.read<TodoController>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: const Text('Todo Screen',style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold
        ),),
      ),
      body: Consumer<TodoController>(
        builder: (context,_,child) {
          return ListView.separated(
              itemCount: todoController.todos.length,
            itemBuilder: (context,index){
                final todo = todoController.todos[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                shape: ShapeBorder.lerp(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), todo.issuccess?1:0, ),
                tileColor: Colors.grey.shade400,

                onTap: (){
                  todoController.changeStatus(todo.id);
                },
                title: Text(todo.title,style: TextStyle(
                  decoration: todo.issuccess?TextDecoration.lineThrough:null,
                ),),
              ),
            );
          }, separatorBuilder: (context,index){
            return const SizedBox(height: 5,);
          },
          );
        }
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        todoController.addTodo(Todo(title: 'New Todo'));
      },child: Icon(Icons.add),),

    );
  }
}
