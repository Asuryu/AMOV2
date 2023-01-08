import 'package:cantinaisec/views/main_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show jsonEncode, utf8;

class EditPage extends StatefulWidget {
  const EditPage({Key? key, required this.weekDay, required this.filePath, required this.menu, required this.menuComplete}) : super(key: key);

  final String weekDay;
  final String filePath;
  final Map<String, dynamic> menu;
  final Map<String, dynamic> menuComplete;

  @override
  _EditPageState createState() => _EditPageState(weekDay, filePath, menu, menuComplete);
}

class _EditPageState extends State<EditPage> {
  _EditPageState(this.weekDay, this.filePath, this.menu, this.menuComplete);

  //final Menu selectedMenu;
  final String weekDay;
  final String filePath;
  final Map<String, dynamic> menu;
  final Map<String, dynamic> menuComplete;

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
                        child: Builder(
                          builder: (BuildContext context) {
                            if (filePath == 'images/emptyMenu.png') {
                              return Image.asset(
                                filePath,
                                fit: BoxFit.contain,
                                height: screenHeight * 0.25,
                              );
                            } else {
                              return Image.network(
                                filePath,
                                fit: BoxFit.contain,
                                height: screenHeight * 0.25,
                              );
                            }
                          },
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
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 37, 37, 37),
                    hintText: utf8.decode(menuComplete['original']['soup'].toString().codeUnits),
                    hintStyle: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'AdiNeuePRO',
                      fontWeight: FontWeight.normal,
                    ),
                    labelText: 'Sopa',
                    labelStyle: const TextStyle(
                      color: Colors.deepOrange,
                      fontFamily: 'AdiNeuePRO',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                if (menuComplete['update'] != null)
                  if (menuComplete['update']['soup'] != menuComplete['original']['soup']) const SizedBox(height: 10) else const SizedBox(height: 20)
                else
                  const SizedBox(height: 20),
                if (menuComplete['update'] != null)
                  if (menuComplete['update']['soup'] != menuComplete['original']['soup'])
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        'Sopa Original: ${utf8.decode(menuComplete['original']['soup'].toString().codeUnits)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'AdiNeuePRO',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                if (menuComplete['update'] != null)
                  if (menuComplete['update']['soup'] != menuComplete['original']['soup']) const SizedBox(height: 30),
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
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 37, 37, 37),
                    hintText: utf8.decode(menuComplete['original']['meat'].toString().codeUnits),
                    hintStyle: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'AdiNeuePRO',
                      fontWeight: FontWeight.normal,
                    ),
                    labelText: 'Carne',
                    labelStyle: const TextStyle(
                      color: Colors.deepOrange,
                      fontFamily: 'AdiNeuePRO',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                if (menuComplete['update'] != null)
                  if (menuComplete['update']['meat'] != menuComplete['original']['meat']) const SizedBox(height: 10) else const SizedBox(height: 20)
                else
                  const SizedBox(height: 20),
                if (menuComplete['update'] != null)
                  if (menuComplete['update']['meat'] != menuComplete['original']['meat'])
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        'Prato de Carne Original: ${utf8.decode(menuComplete['original']['meat'].toString().codeUnits)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'AdiNeuePRO',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                if (menuComplete['update'] != null)
                  if (menuComplete['update']['meat'] != menuComplete['original']['meat']) const SizedBox(height: 30),
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
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 37, 37, 37),
                    hintText: utf8.decode(menuComplete['original']['fish'].toString().codeUnits),
                    hintStyle: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'AdiNeuePRO',
                      fontWeight: FontWeight.normal,
                    ),
                    labelText: 'Peixe',
                    labelStyle: const TextStyle(
                      color: Colors.deepOrange,
                      fontFamily: 'AdiNeuePRO',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                if (menuComplete['update'] != null)
                  if (menuComplete['update']['fish'] != menuComplete['original']['fish']) const SizedBox(height: 10) else const SizedBox(height: 20)
                else
                  const SizedBox(height: 20),
                if (menuComplete['update'] != null)
                  if (menuComplete['update']['fish'] != menuComplete['original']['fish'])
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        'Prato de Peixe Original: ${utf8.decode(menuComplete['original']['fish'].toString().codeUnits)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'AdiNeuePRO',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                if (menuComplete['update'] != null)
                  if (menuComplete['update']['fish'] != menuComplete['original']['fish']) const SizedBox(height: 30),
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
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 37, 37, 37),
                    hintText: utf8.decode(menuComplete['original']['vegetarian'].toString().codeUnits),
                    hintStyle: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'AdiNeuePRO',
                      fontWeight: FontWeight.normal,
                    ),
                    labelText: 'Vegetariano',
                    labelStyle: const TextStyle(
                      color: Colors.deepOrange,
                      fontFamily: 'AdiNeuePRO',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                if (menuComplete['update'] != null)
                  if (menuComplete['update']['vegetarian'] != menuComplete['original']['vegetarian']) const SizedBox(height: 10) else const SizedBox(height: 20)
                else
                  const SizedBox(height: 20),
                if (menuComplete['update'] != null)
                  if (menuComplete['update']['vegetarian'] != menuComplete['original']['vegetarian'])
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        'Prato de Vegetariano Original: ${utf8.decode(menuComplete['original']['vegetarian'].toString().codeUnits)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'AdiNeuePRO',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                if (menuComplete['update'] != null)
                  if (menuComplete['update']['vegetarian'] != menuComplete['original']['vegetarian']) const SizedBox(height: 30),
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
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 37, 37, 37),
                    hintText: utf8.decode(menuComplete['original']['desert'].toString().codeUnits),
                    hintStyle: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'AdiNeuePRO',
                      fontWeight: FontWeight.normal,
                    ),
                    labelText: 'Sobremesa',
                    labelStyle: const TextStyle(
                      color: Colors.deepOrange,
                      fontFamily: 'AdiNeuePRO',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                if (menuComplete['update'] != null)
                  if (menuComplete['update']['desert'] != menuComplete['original']['desert']) const SizedBox(height: 10) else const SizedBox(height: 20)
                else
                  const SizedBox(height: 20),
                if (menuComplete['update'] != null)
                  if (menuComplete['update']['desert'] != menuComplete['original']['desert'])
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        'Sobremesa Original: ${utf8.decode(menuComplete['original']['desert'].toString().codeUnits)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'AdiNeuePRO',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
              ],
            )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 252, 158, 70),
          onPressed: () => {
            setState(() {
              // refresh the page
              // get the menu from the server
              // save the menu in shared preferences
              // CircularProgressIndicator
              String diaDaSemana;
              if (weekDay == "Segunda-Feira") {
                diaDaSemana = "MONDAY";
              } else if (weekDay == "Terça-Feira") {
                diaDaSemana = "TUESDAY";
              } else if (weekDay == "Quarta-Feira") {
                diaDaSemana = "WEDNESDAY";
              } else if (weekDay == "Quinta-Feira") {
                diaDaSemana = "THURSDAY";
              } else if (weekDay == "Sexta-Feira") {
                diaDaSemana = "FRIDAY";
              } else {
                diaDaSemana = "";
              }

              // set content-type to application/json; charset=UTF-8
              Future<http.Response> response = http.post(Uri.parse('http://94.61.156.105:8080/menu'),
                  body: jsonEncode({
                    'weekDay': diaDaSemana,
                    'soup': _soupController.text,
                    'fish': _fishController.text,
                    'meat': _meatController.text,
                    'vegetarian': _vegetarianController.text,
                    'desert': _dessertController.text,
                    'img': ""
                  }),
                  headers: {'Content-Type': 'application/json; charset=UTF-8'});
              // check if the menu was updated
              // if it was, show a snackbar
              // if it wasn't, show a snackbar
              response.then((value) => {
                    if (value.statusCode == 201)
                      {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Menu atualizado com sucesso!'),
                          backgroundColor: Color.fromARGB(255, 146, 243, 82),
                        )),
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        )
                      }
                    else if (value.statusCode == 403)
                      {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Headers do pedido inválidos'),
                          backgroundColor: Color.fromARGB(255, 252, 158, 70),
                        ))
                      }
                    else
                      {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Ocorreu um erro ao atualizar o menu!'),
                          backgroundColor: Color.fromARGB(255, 252, 158, 70),
                        ))
                      }
                  });
            })
          },
          tooltip: 'Update',
          child: const Icon(Icons.save),
        ),
        backgroundColor: const Color.fromARGB(255, 17, 17, 17));
  }
}
