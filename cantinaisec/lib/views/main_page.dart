import 'package:http/http.dart' as http;
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
                child: const Text('Cantina ISEC'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
      body: Container(
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 10),
          alignment: Alignment.center,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              MealCard(
                weekDay: "Segunda-Feira",
              ),
              MealCard(
                weekDay: "Terça-Feira",
              ),
              MealCard(
                weekDay: "Quarta-Feira",
              ),
              MealCard(
                weekDay: "Quinta-Feira",
              ),
              MealCard(
                weekDay: "Sexta-Feira",
              ),
            ],
          )),
      backgroundColor: const Color.fromARGB(255, 17, 17, 17),
    );
  }
}

class MealCard extends StatelessWidget {
  // get following info from constructor
  const MealCard({Key? key, required this.weekDay}) : super(key: key);

  final String weekDay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditPage(weekDay: weekDay)),
          );
        },
        child: Container(
            width: 350,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 43, 43, 43),
              borderRadius: BorderRadius.circular(20),
            ),
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 10),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Hero(
                  tag: weekDay,
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      weekDay,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'AdiNeuePRO',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Sopa',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'AdiNeuePRO',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Prato de carne',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'AdiNeuePRO',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Prato de peixe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'AdiNeuePRO',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Prato vegetariano',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'AdiNeuePRO',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
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
    );
  }
}
