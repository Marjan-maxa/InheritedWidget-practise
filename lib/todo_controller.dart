import 'package:flutter/cupertino.dart';
import 'package:state_manage/todo.dart';

 class TodoController extends ChangeNotifier{
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;


  void addTodo(Todo todo){
    _todos.add(todo);
    notifyListeners();
  }

  void changeStatus(int id){
    _todos.firstWhere((element) => element.id==id).changeStatus();
    notifyListeners();
  }


}