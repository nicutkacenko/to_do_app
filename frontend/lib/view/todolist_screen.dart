import 'package:flutter/material.dart';
import 'package:frontend/controller/todocomponent_controller.dart';
import 'package:frontend/view/add_todocomponent_screen.dart';
import 'package:frontend/view/todocomponent_screen.dart';

import '../model/todocomponent.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({Key? key}) : super(key: key);

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  late Future<List<ToDoComponent>> futureToDoComponent;

  @override
  initState() {
    super.initState();
    getToDo();
  }

  getToDo() async {
    futureToDoComponent = ToDoComponentController.getToDoComponents();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xffC4C4C4)),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'To Do List App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AddToDoComponentScreen())),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    border: Border.all(
                      color: const Color.fromRGBO(196, 196, 196, 1),
                      width: 2,
                    ),
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(40, 40)),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: FutureBuilder<List<ToDoComponent>>(
            future: futureToDoComponent,
            builder: (context, snapshot) {
              List<ToDoComponent> todocomponents = snapshot.data ?? [];
              return ListView.builder(
                  itemCount: todocomponents.length,
                  itemBuilder: (context, index) {
                    ToDoComponent todocomponent = todocomponents[index];
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ToDoComponentScreen(
                                id: todocomponent.id!,
                                title: todocomponent.title,
                                priority: todocomponent.priority,
                                description: todocomponent.description,
                                imageUrl: todocomponent.imageUrl,
                              ))),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 500,
                            height: 100,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              color: Color.fromRGBO(240, 240, 240, 1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      width: 350,
                                      height: 30,
                                      child: Text(
                                        todocomponent.title,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            color: Color.fromRGBO(0, 0, 0, 1),
                                            fontFamily: 'Inter',
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            height: 1),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 350,
                                      height: 25,
                                      child: Text(
                                        todocomponent.description,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            color: Color.fromRGBO(0, 0, 0, 1),
                                            fontFamily: 'Inter',
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                            height: 1),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 140,
                                      height: 25,
                                      child: Text(
                                        todocomponent.priority,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            color: Color.fromRGBO(0, 0, 0, 1),
                                            fontFamily: 'Inter',
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            height: 1),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5),
                                    ),
                                    color: Color.fromRGBO(217, 217, 217, 1),
                                  ),
                                  child: Image.network(
                                    todocomponent.imageUrl,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
