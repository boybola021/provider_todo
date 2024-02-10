import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo/create_todo.dart';
import 'package:provider_todo/provider/provider_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Todo",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) =>  const DetailPage()));
        },
        child: const Icon(
          Icons.add,
          size: 23,
        ),
      ),
      body: Consumer<TodoController>(
        builder: (BuildContext context, TodoController state, Widget? child) {

          debugPrint(state.allTodo.toString());
          if(state.todoList.isNotEmpty){
            return ListView.builder(
              itemCount: state.allTodo.length,
              itemBuilder: (context, i) {
                final data = state.allTodo[i];
                return Card(
                  child: ListTile(
                    onTap: (){
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) =>   DetailPage(todo: data,)));
                    },
                    leading: Text(
                      data.id,
                      style: const TextStyle(fontSize: 20),
                    ),
                    title: Text(
                      data.title,
                      style: const TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      data.description,
                      style: const TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<TodoController>().deleteTodo(todo: data);
                      },
                      icon: const Icon(
                        Icons.delete_outline_outlined,
                        size: 25,
                      ),
                    ),
                  ),
                );
              },
            );
          }
           if(state.isLoading){
             return const Center(child: CircularProgressIndicator.adaptive(),);
           }
          else {
            return const Center(
              child: Text(
                "No Data",
                style: TextStyle(fontSize: 30),
              ),
            );
          }
        },
      ),
    );
  }
}
