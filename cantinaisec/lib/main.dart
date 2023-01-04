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
          padding: const EdgeInsets.only(top: 20, left: 15, right: 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const <Widget>[
                Text('Menu Semanal',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: "AdiNeuePRO",
                        fontWeight: FontWeight.bold)),
                Text("Clicar na carta da refeição permite editá-la",
                    style: TextStyle(
                        color: Color.fromARGB(255, 180, 180, 180),
                        fontSize: 15,
                        fontFamily: "AdiNeuePRO",
                        fontWeight: FontWeight.normal)),
              ]),
        ),
        backgroundColor: const Color.fromARGB(255, 17, 17, 17));
  }
}
