import 'package:cantinaisec/api/menu_api.dart';
import 'package:http/http.dart' as http;
import 'package:cantinaisec/models/menu.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cantinaisec/views/edit_page.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  MenuAPI menuAPI = MenuAPI();
  String? weekDay = DateTime.now().weekday.toString();
  late Menu menu;

  @override
  void initState() {
    super.initState();
    // get the menu from the API
    FutureBuilder<http.Response>(
      future: http.get(Uri.parse('http://94.61.156.105:8080/menu')),
      builder: (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
        if (snapshot.hasData) {
          return Expanded(
                      child: SingleChildScrollView(
                                   child: Text(snapshot.data!.body)
) );
        } else if (snapshot.hasError) {
          return const Text('Oops, something happened');
        } else {
          return const CircularProgressIndicator();
} },
    );
  }

  List<String> days = [
    'Segunda-feira',
    'Terça-feira',
    'Quarta-feira',
    'Quinta-feira',
    'Sexta-feira'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/icon.png',
              fit: BoxFit.contain,
              height: 50,
            ),
            Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('Cantina ISEC')
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {

        },
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
      body: Container(
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 10),
          alignment: Alignment.center,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EditPage(weekDay: "Segunda-feira")),
                    );
                  },
                  child: Container(
                      // Set width of the container to the max width of the screen
                      width: 350,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 43, 43, 43),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 15, right: 10),
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: const [
                          Text(
                            'Segunda-feira',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Sopa',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Prato de carne',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Prato de peixe',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Prato vegetariano',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Sobremesa',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EditPage(weekDay: "Segunda-feira")),
                    );
                  },
                  child: Container(
                      width: 350,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 43, 43, 43),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 15, right: 10),
                      child: Column(
                        children: const [
                          Text(
                            'Terça-feira',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Sopa',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Prato de carne',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Prato de peixe',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Prato vegetariano',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Sobremesa',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EditPage(weekDay: "Segunda-feira")),
                    );
                  },
                  child: Container(
                      width: 350,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 43, 43, 43),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 15, right: 10),
                      child: Column(
                        children: const [
                          Text(
                            'Quarta-feira',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Sopa',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Prato de carne',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Prato de peixe',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Prato vegetariano',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Sobremesa',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EditPage(weekDay: "Segunda-feira")),
                    );
                  },
                  child: Container(
                      width: 350,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 43, 43, 43),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 15, right: 10),
                      child: Column(
                        children: const [
                          Text(
                            'Quinta-feira',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Sopa',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Prato de carne',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Prato de peixe',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Prato vegetariano',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Sobremesa',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EditPage(weekDay: "Segunda-feira")),
                    );
                  },
                  child: Container(
                      width: 350,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 43, 43, 43),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 15, right: 10),
                      child: Column(
                        children: const [
                          Text(
                            'Sexta-feira',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Sopa',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Prato de carne',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Prato de peixe',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Prato vegetariano',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Sobremesa',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ),
                          ),
                        ],
                      )),
                ),
              )
            ],
          )),
      backgroundColor: const Color.fromARGB(255, 17, 17, 17),
    );
  }
  }