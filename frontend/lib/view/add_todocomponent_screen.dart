import 'package:flutter/material.dart';
import 'package:frontend/controller/todocomponent_controller.dart';
import 'package:frontend/model/todocomponent.dart';
import 'package:frontend/view/todolist_screen.dart';

class AddToDoComponentScreen extends StatefulWidget {
  const AddToDoComponentScreen({Key? key}) : super(key: key);

  @override
  State<AddToDoComponentScreen> createState() => _AddToDoComponentScreenState();
}

class _AddToDoComponentScreenState extends State<AddToDoComponentScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  String _dropdownValue = 'Low priority';

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
                              color:
                                  Color.fromRGBO(0, 0, 0, 0.07999999821186066),
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
                      ToDoComponentController().addToDoComponent(ToDoComponent(
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
                              color:
                                  Color.fromRGBO(0, 0, 0, 0.07999999821186066),
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
              child: Center(
                child: Text(
                  'tralala',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Inter',
                      fontSize: 32,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
            ),
            SizedBox(
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
            SizedBox(
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
            SizedBox(
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
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Priority:',
                  style: TextStyle(
                      color: Color.fromRGBO(129, 129, 141, 1),
                      fontFamily: 'Inter',
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
                SizedBox(
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
            )
          ],
        ),
      ),
    );
  }
}
