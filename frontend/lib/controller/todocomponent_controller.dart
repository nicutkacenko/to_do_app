import 'dart:convert';

import 'package:http/http.dart';

import '../model/todocomponent.dart';

class ToDoComponentController {
  Future<List<ToDoComponent>> getToDoComponents() async {
    final res = await get(Uri.parse('http://127.0.0.1:8000/todocomponents'));
    print(res.statusCode);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<ToDoComponent> todocomponents =
          body.map((dynamic item) => ToDoComponent.fromSnap(item)).toList();
      return todocomponents;
    } else {
      throw "Unable to retrieve To Do Components.";
    }
  }

  static Future<ToDoComponent> getToDoComponent(String id) async {
    final res =
        await get(Uri.parse('http://localhost:8000/todocomponents/$id'));
    if (res.statusCode == 200) {
      return ToDoComponent.fromSnap(jsonDecode(res.body));
    } else {
      throw "Unable to retrieve To Do Component.";
    }
  }

  Future<ToDoComponent> addToDoComponent(ToDoComponent todocomponent) async {
    final res = await post(
      Uri.parse('http://localhost:8000/todocomponents'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'accept': 'application/json',
      },
      body: jsonEncode(todocomponent.toJson()),
    );
    if (res.statusCode == 200) {
      return ToDoComponent.fromSnap(jsonDecode(res.body));
    } else {
      throw "Unable to add movie.";
    }
  }

  Future<ToDoComponent> updateToDoComponent(ToDoComponent todocomponent) async {
    final res = await put(
      Uri.parse('http://localhost:8000/todocomponents/${todocomponent.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'accept': 'application/json',
      },
      body: jsonEncode(todocomponent.toJson()),
    );
    if (res.statusCode == 200) {
      return ToDoComponent.fromSnap(jsonDecode(res.body));
    } else {
      throw "Unable to update To Do Component.";
    }
  }

  Future<void> deleteToDoComponent(String id) async {
    final res = await delete(
      Uri.parse('http://localhost:8000/todocomponents/$id'),
    );
    if (res.statusCode == 200) {
      return;
    } else {
      throw "Unable to delete To Do Component.";
    }
  }
}
