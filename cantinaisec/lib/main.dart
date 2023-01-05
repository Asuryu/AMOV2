import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:location/location.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        backgroundColor: Colors.black,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<String> days = [
    'Segunda-feira',
    'Terça-feira',
    'Quarta-feira',
    'Quinta-feira',
    'Sexta-feira'
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
                child: const Text('Cantina ISEC'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
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
                  onTap: () {},
                  child: Container(
                      // Set width of the container to the max width of the screen
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
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
                  onTap: () {},
                  child: Container(
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
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
                  onTap: () {},
                  child: Container(
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
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
                  onTap: () {},
                  child: Container(
                      width: 350,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 43, 43, 43),
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
                  onTap: () {},
                  child: Container(
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
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

class EditPage extends StatefulWidget {
  const EditPage({super.key, required this.title});

  final String title;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
                  child: const Text('Cantina ISEC'))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Refresh',
          child: const Icon(Icons.refresh),
        ),
        backgroundColor: const Color.fromARGB(255, 17, 17, 17));
  }
}
