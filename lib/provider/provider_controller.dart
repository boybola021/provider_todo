import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:provider_todo/todo_model.dart';

class TodoController with ChangeNotifier{
  List<Todo> todoList = [
    Todo(id: "id", title: "title", description: "description", isComplete: false),
  ];
  bool isLoading = true;
  void createTodo({
    required String title,
    required String description,
}){
    try{
      final todo = Todo(
        id: Random().nextInt(1000).toString(),
        title: title,
        description: description,
        isComplete: false,
      );
      todoList.add(todo);
      notifyListeners();
    }catch(e){
      debugPrint(e.toString());
    }
  }

   void updateTodo({required Todo todo}){
    todoList.removeWhere((data) => data.id == todo.id);
    todoList.add(todo);
    notifyListeners();
  }

  void deleteTodo({required Todo todo}){
    isLoading = true;
    todoList.remove(todo);
    isLoading = false;
    notifyListeners();
  }

  List<Todo> get allTodo => todoList;
}