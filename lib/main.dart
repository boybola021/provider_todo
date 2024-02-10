import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo/provider/provider_controller.dart';
import 'app.dart';

TodoController todoController = TodoController();

void main() => runApp(
    ChangeNotifierProvider(
      create: (context) => TodoController(),
      child: const App(),
    ));
