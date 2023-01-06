import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  //const EditPage({Key? key, required this.selectedMenu, required this.weekDay})
  const EditPage({Key? key, required this.weekDay, required this.filePath})
      : super(key: key);

  //final Menu selectedMenu;
  final String weekDay;
  final String filePath;

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
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 10),
            alignment: Alignment.center,
            child: ListView(
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.vertical,
              children: [
                Hero(
                  tag: weekDay,
                  child: const Material(
                    color: Colors.transparent,
                    child: Text(
                      'Segunda-Feira',
                      style: TextStyle(
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
                const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 37, 37, 37),
                    labelText: 'Sopa',
                    labelStyle: TextStyle(
                      color: Colors.deepOrange,
                      fontFamily: 'AdiNeuePRO',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 37, 37, 37),
                    labelText: 'Carne',
                    labelStyle: TextStyle(
                      color: Colors.deepOrange,
                      fontFamily: 'AdiNeuePRO',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color.fromARGB(255, 37, 37, 37),
                    labelText: 'Peixe',
                    labelStyle: TextStyle(
                      color: Colors.deepOrange,
                      fontFamily: 'AdiNeuePRO',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color.fromARGB(255, 37, 37, 37),
                    labelText: 'Vegetariano',
                    labelStyle: TextStyle(
                      color: Colors.deepOrange,
                      fontFamily: 'AdiNeuePRO',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color.fromARGB(255, 37, 37, 37),
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
          onPressed: () => {},
          tooltip: 'Update',
          child: const Icon(Icons.save),
        ),
        backgroundColor: const Color.fromARGB(255, 17, 17, 17));
  }
}
