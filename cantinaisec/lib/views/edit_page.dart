import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  //const EditPage({Key? key, required this.selectedMenu, required this.weekDay})
  const EditPage({Key? key, required this.weekDay}) : super(key: key);

  //final Menu selectedMenu;
  final String? weekDay;

  @override
  Widget build(BuildContext context) {
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
                  child: const Text('Editar Refeição'))
            ],
          ),
        ),
        // generate a list of input fields with labels (sopa, carne, peixe, vegetariano, sobremesa)
        // set input text color and border to white (background is black)
        // add padding to the text fields
        body: Container(
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 10),
            alignment: Alignment.center,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: const [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 37, 37, 37),
                    labelText: 'Sopa',
                    labelStyle: TextStyle(color: Colors.deepOrange),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color.fromARGB(255, 37, 37, 37),
                    labelText: 'Carne',
                    labelStyle: TextStyle(color: Colors.deepOrange),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color.fromARGB(255, 37, 37, 37),
                    labelText: 'Peixe',
                    labelStyle: TextStyle(color: Colors.deepOrange),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color.fromARGB(255, 37, 37, 37),
                    labelText: 'Vegetariano',
                    labelStyle: TextStyle(color: Colors.deepOrange),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color.fromARGB(255, 37, 37, 37),
                    labelText: 'Sobremesa',
                    labelStyle: TextStyle(color: Colors.deepOrange),
                  ),
                ),
              ],
            )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 252, 158, 70),
          onPressed: () => {},
          tooltip: 'Update',
          child: const Icon(Icons.save),
        ),
        backgroundColor: const Color.fromARGB(255, 17, 17, 17));
  }
}
