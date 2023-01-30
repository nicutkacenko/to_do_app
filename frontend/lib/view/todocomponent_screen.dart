import 'package:flutter/material.dart';
import 'package:frontend/controller/todocomponent_controller.dart';
import 'package:frontend/model/todocomponent.dart';
import 'package:frontend/view/todolist_screen.dart';

class ToDoComponentScreen extends StatefulWidget {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final String priority;
  const ToDoComponentScreen(
      {Key? key,
      required this.id,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.priority})
      : super(key: key);

  @override
  State<ToDoComponentScreen> createState() => _ToDoComponentScreenState();
}

class _ToDoComponentScreenState extends State<ToDoComponentScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _imageUrlController;
  late String _dropdownValue;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.title);
    _descriptionController = TextEditingController(text: widget.description);
    _imageUrlController = TextEditingController(text: widget.imageUrl);
    _dropdownValue = widget.priority;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.black,
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ToDoListScreen())),
                      child: Container(
                        width: 91,
                        height: 31,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.07999999821186066),
                                offset: Offset(0, 2),
                                blurRadius: 7)
                          ],
                          color: Color.fromRGBO(250, 250, 250, 1),
                        ),
                        child: const Center(
                          child: Text(
                            'Back',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Inter',
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        ToDoComponentController().updateToDoComponent(
                            widget.id.toString(),
                            ToDoComponent(
                                title: _titleController.text,
                                description: _descriptionController.text,
                                priority: _dropdownValue,
                                imageUrl: _imageUrlController.text));
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ToDoListScreen()));
                      },
                      child: Container(
                        width: 91,
                        height: 31,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.07999999821186066),
                                offset: Offset(0, 2),
                                blurRadius: 7)
                          ],
                          color: Color.fromRGBO(250, 250, 250, 1),
                        ),
                        child: const Center(
                          child: Text(
                            'Save',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Inter',
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ),
                      ),
                    ),
                  ])),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                  widget.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              TextFormField(
                controller: _imageUrlController,
                decoration: InputDecoration(
                    labelText: 'Image link',
                    labelStyle: const TextStyle(
                        color: Color.fromRGBO(129, 129, 141, 1),
                        fontFamily: 'Inter',
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        height: 1),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: Colors.black38),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(color: Colors.black38))),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: const TextStyle(
                        color: Color.fromRGBO(129, 129, 141, 1),
                        fontFamily: 'Inter',
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        height: 1),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: Colors.black38),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(color: Colors.black38))),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: const TextStyle(
                        color: Color.fromRGBO(129, 129, 141, 1),
                        fontFamily: 'Inter',
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        height: 1),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: Colors.black38),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(color: Colors.black38))),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Priority:',
                    style: TextStyle(
                        color: Color.fromRGBO(129, 129, 141, 1),
                        fontFamily: 'Inter',
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  DropdownButton<String>(
                    focusColor: const Color(0xffC4C4C4),
                    dropdownColor: const Color(0xffC4C4C4),
                    value: _dropdownValue,
                    icon: const Icon(Icons.check),
                    style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        height: 1),
                    items: <String>[
                      'Low priority',
                      'Medium priority',
                      'High priority',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        _dropdownValue = value!;
                      });
                    },
                  )
                ],
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  ToDoComponentController()
                      .deleteToDoComponent(widget.id.toString());
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ToDoListScreen()));
                },
                child: Container(
                  width: 297,
                  height: 49,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                          offset: Offset(0, 2),
                          blurRadius: 7)
                    ],
                    color: Colors.black,
                  ),
                  child: const Center(
                    child: Text(
                      'Delete To Do Component',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 19,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
