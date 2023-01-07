import 'package:flutter/material.dart';
import 'dart:convert' show jsonDecode, utf8;

class EditPage extends StatefulWidget {
  const EditPage({Key? key, required this.weekDay, required this.filePath, required this.menu}) : super(key: key);

  final String weekDay;
  final String filePath;
  final Map<String, dynamic> menu;

  @override
  _EditPageState createState() => _EditPageState(weekDay, filePath, menu);
}

class _EditPageState extends State<EditPage> {
  _EditPageState(this.weekDay, this.filePath, this.menu);

  //final Menu selectedMenu;
  final String weekDay;
  final String filePath;
  final Map<String, dynamic> menu;

  final _soupController = TextEditingController(text: '');
  final _meatController = TextEditingController(text: '');
  final _fishController = TextEditingController(text: '');
  final _vegetarianController = TextEditingController(text: '');
  final _dessertController = TextEditingController(text: '');

  @override
  void initState() {
    _soupController.text = utf8.decode(menu['soup'].toString().codeUnits);
    _meatController.text = utf8.decode(menu['meat'].toString().codeUnits);
    _fishController.text = utf8.decode(menu['fish'].toString().codeUnits);
    _vegetarianController.text = utf8.decode(menu['vegetarian'].toString().codeUnits);
    _dessertController.text = utf8.decode(menu['desert'].toString().codeUnits);
    return super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'images/icon.png',
                fit: BoxFit.contain,
                height: 50,
              ),
              Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('Editar Refeição',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'AdiNeuePRO',
                        fontWeight: FontWeight.bold,
                      )))
            ],
          ),
        ),
        // generate a list of input fields with labels (sopa, carne, peixe, vegetariano, sobremesa)
        // set input text color and border to white (background is black)
        // add padding to the text fields
        body: Container(
            padding: const EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 10),
            alignment: Alignment.center,
            child: ListView(
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.vertical,
              children: [
                Hero(
                  tag: weekDay,
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      weekDay,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'AdiNeuePRO',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Hero(
                  tag: filePath,
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          filePath,
                          fit: BoxFit.fitWidth,
                          height: screenHeight * 0.25,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: _soupController,
                  autocorrect: false,
                  onChanged: (String value) async {
                    var cursorPos = _soupController.selection;
                    _soupController.text = value;
                    if (cursorPos.start > _soupController.text.length) {
                      cursorPos = TextSelection.fromPosition(TextPosition(offset: _soupController.text.length));
                    }
                    _soupController.selection = cursorPos;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 37, 37, 37),
                    hintText: 'Sopa',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'AdiNeuePRO',
                      fontWeight: FontWeight.normal,
                    ),
                    labelText: 'Sopa',
                    labelStyle: TextStyle(
                      color: Colors.deepOrange,
                      fontFamily: 'AdiNeuePRO',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: _meatController,
                  onChanged: (value) async {
                    var cursorPos = _meatController.selection;
                    _meatController.text = value;
                    if (cursorPos.start > _meatController.text.length) {
                      cursorPos = TextSelection.fromPosition(TextPosition(offset: _meatController.text.length));
                    }
                    _meatController.selection = cursorPos;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 37, 37, 37),
                    hintText: 'Carne',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'AdiNeuePRO',
                      fontWeight: FontWeight.normal,
                    ),
                    labelText: 'Carne',
                    labelStyle: TextStyle(
                      color: Colors.deepOrange,
                      fontFamily: 'AdiNeuePRO',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: _fishController,
                  onChanged: (value) async {
                    var cursorPos = _fishController.selection;
                    _fishController.text = value;
                    if (cursorPos.start > _fishController.text.length) {
                      cursorPos = TextSelection.fromPosition(TextPosition(offset: _fishController.text.length));
                    }
                    _fishController.selection = cursorPos;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color.fromARGB(255, 37, 37, 37),
                    hintText: 'Peixe',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'AdiNeuePRO',
                      fontWeight: FontWeight.normal,
                    ),
                    labelText: 'Peixe',
                    labelStyle: TextStyle(
                      color: Colors.deepOrange,
                      fontFamily: 'AdiNeuePRO',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: _vegetarianController,
                  onChanged: (value) async {
                    var cursorPos = _vegetarianController.selection;
                    _vegetarianController.text = value;
                    if (cursorPos.start > _vegetarianController.text.length) {
                      cursorPos = TextSelection.fromPosition(TextPosition(offset: _vegetarianController.text.length));
                    }
                    _vegetarianController.selection = cursorPos;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color.fromARGB(255, 37, 37, 37),
                    hintText: 'Vegetariano',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'AdiNeuePRO',
                      fontWeight: FontWeight.normal,
                    ),
                    labelText: 'Vegetariano',
                    labelStyle: TextStyle(
                      color: Colors.deepOrange,
                      fontFamily: 'AdiNeuePRO',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: _dessertController,
                  onChanged: (value) async {
                    var cursorPos = _dessertController.selection;
                    _dessertController.text = value;
                    if (cursorPos.start > _dessertController.text.length) {
                      cursorPos = TextSelection.fromPosition(TextPosition(offset: _dessertController.text.length));
                    }
                    _dessertController.selection = cursorPos;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color.fromARGB(255, 37, 37, 37),
                    hintText: 'Sobremesa',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'AdiNeuePRO',
                      fontWeight: FontWeight.normal,
                    ),
                    labelText: 'Sobremesa',
                    labelStyle: TextStyle(
                      color: Colors.deepOrange,
                      fontFamily: 'AdiNeuePRO',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 252, 158, 70),
          onPressed: () => {Navigator.pop(context)},
          tooltip: 'Update',
          child: const Icon(Icons.save),
        ),
        backgroundColor: const Color.fromARGB(255, 17, 17, 17));
  }
}
