import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo/provider/provider_controller.dart';
import 'package:provider_todo/todo_model.dart';

class DetailPage extends StatelessWidget {
   final Todo? todo;
   const DetailPage({super.key,this.todo});
 static TextEditingController controllerTitle = TextEditingController();
 static TextEditingController controllerDesc = TextEditingController();

  void saveTodo(BuildContext context) {
    String title = controllerTitle.text;
    String desc = controllerDesc.text;
    if (title.isEmpty || desc.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Title or description field empty"),
          backgroundColor: Colors.red,
        ),
      );
    }
    if(todo == null){
      context.read<TodoController>().createTodo(title: title, description: desc);
    }else{
      Todo newData = Todo(id: todo!.id, title: title, description: desc, isComplete: todo!.isComplete);
      context.read<TodoController>().updateTodo(todo: newData,);
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Successful create todo"),
        backgroundColor: Colors.green,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    controllerTitle.text = todo?.title ?? "";
    controllerDesc.text = todo?.description ?? "";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Create Todo",
          style: TextStyle(fontSize: 25),
        ),
        actions: [
          IconButton(
            onPressed: () => saveTodo(context),
            icon: const Icon(Icons.save),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controllerTitle,
              decoration: const InputDecoration(),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: controllerDesc,
              decoration: const InputDecoration(),
            ),
          ],
        ),
      ),
    );
  }
}
