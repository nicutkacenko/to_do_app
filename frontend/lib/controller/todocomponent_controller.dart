import 'dart:convert';

import 'package:http/http.dart';

import '../model/todocomponent.dart';

class ToDoComponentController {
  static Future<List<ToDoComponent>> getToDoComponents() async {
    var res = await get(Uri.parse('http://127.0.0.1:8000/todocomponents'));
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
        await get(Uri.parse('http://127.0.0.1:8000/todocomponents/$id'));
    if (res.statusCode == 200) {
      return ToDoComponent.fromSnap(jsonDecode(res.body));
    } else {
      throw "Unable to retrieve To Do Component.";
    }
  }

  Future<ToDoComponent> addToDoComponent(ToDoComponent todocomponent) async {
    final res = await post(
      Uri.parse('http://127.0.0.1:8000/todocomponents'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'accept': 'application/json',
      },
      body: jsonEncode(todocomponent.toJson()),
    );
    if ((res.statusCode == 200) || (res.statusCode == 405)) {
      return ToDoComponent.fromSnap(jsonDecode(res.body));
    } else {
      throw "Unable to add To Do Component.";
    }
  }

  Future<ToDoComponent> updateToDoComponent(
      String id, ToDoComponent todocomponent) async {
    final res = await put(
      Uri.parse('http://127.0.0.1:8000/todocomponents/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'accept': 'application/json',
      },
      body: jsonEncode(todocomponent.toJson()),
    );
    if ((res.statusCode == 200) || (res.statusCode == 405)) {
      return ToDoComponent.fromSnap(jsonDecode(res.body));
    } else {
      throw "Unable to update To Do Component.";
    }
  }

  Future<void> deleteToDoComponent(String id) async {
    final res = await delete(
      Uri.parse('http://127.0.0.1:8000/todocomponents/$id'),
    );
    if ((res.statusCode == 200) || (res.statusCode == 405)) {
      return;
    } else {
      throw "Unable to delete To Do Component.";
    }
  }
}
