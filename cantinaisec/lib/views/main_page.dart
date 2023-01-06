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
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          alignment: Alignment.center,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              MealCard(
                weekDay: "Segunda-Feira",
                imagePath: 'images/segunda.png',
                sopa: 'Sopa de Juliana',
                pratoDeCarne: 'Bitoque de Porco',
                pratoDePeixe: 'Bacalhau à Brás',
                pratoVegetariano: 'Bróculos à Brás',
                sobremesa: 'Pudim de Leite Cansado',
              ),
              MealCard(
                weekDay: "Terça-Feira",
                imagePath: 'images/terca.png',
                sopa: 'Sopa de Juliana',
                pratoDeCarne: 'Leitão',
                pratoDePeixe: 'Dourada',
                pratoVegetariano: 'Espinafres à Lagareiro',
                sobremesa: 'Pudim de Leite Condensado',
              ),
              MealCard(
                weekDay: "Quarta-Feira",
                imagePath: 'images/quarta.png',
                sopa: 'Sopa de Juliana',
                pratoDeCarne: 'Grelhada Mista',
                pratoDePeixe: 'Bacalhau à Brás',
                pratoVegetariano: 'Bróculos à Brás',
                sobremesa: 'Pudim de Leite Condensado',
              ),
              MealCard(
                weekDay: "Quinta-Feira",
                imagePath: 'images/quinta.png',
                sopa: 'Sopa de Juliana',
                pratoDeCarne: 'Massa à Bolonhesa',
                pratoDePeixe: 'Petingas à Algarvia',
                pratoVegetariano: 'Ervilhas à Portuguesa',
                sobremesa: 'Mouse de Chocolate',
              ),
              MealCard(
                weekDay: "Sexta-Feira",
                imagePath: 'images/sexta.png',
                sopa: 'Sopa de Juliana',
                pratoDeCarne: 'Rojões à Portuguesa',
                pratoDePeixe: 'Bacalhau à Brás',
                pratoVegetariano: 'Bróculos à Brás',
                sobremesa: 'Gelatina de Morango',
              ),
            ],
          )),
      backgroundColor: const Color.fromARGB(255, 17, 17, 17),
    );
  }
}

class MealCard extends StatelessWidget {
  // get following info from constructor
  const MealCard(
      {Key? key,
      required this.weekDay,
      required this.imagePath,
      required this.sopa,
      required this.pratoDeCarne,
      required this.pratoDePeixe,
      required this.pratoVegetariano,
      required this.sobremesa})
      : super(key: key);

  final String weekDay;
  final String imagePath;
  final String sopa;
  final String pratoDeCarne;
  final String pratoDePeixe;
  final String pratoVegetariano;
  final String sobremesa;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
            width: screenWidth * 0.955,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 43, 43, 43),
              borderRadius: BorderRadius.circular(20),
            ),
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 10),
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.contain,
                      height: screenHeight * 0.25,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 2),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.deepOrange,
                        width: 2,
                      ),
                    ),
                  ),
                  child: const Text(
                    'Sopa',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'AdiNeuePRO',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(sopa,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'AdiNeuePRO',
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 2),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.deepOrange,
                        width: 2,
                      ),
                    ),
                  ),
                  child: const Text(
                    'Prato de carne',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'AdiNeuePRO',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(pratoDeCarne,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'AdiNeuePRO',
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 2),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.deepOrange,
                        width: 2,
                      ),
                    ),
                  ),
                  child: const Text(
                    'Prato de peixe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'AdiNeuePRO',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(pratoDePeixe,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'AdiNeuePRO',
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 2),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.deepOrange,
                        width: 2,
                      ),
                    ),
                  ),
                  child: const Text(
                    'Prato vegetariano',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'AdiNeuePRO',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(pratoVegetariano,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'AdiNeuePRO',
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 2),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.deepOrange,
                        width: 2,
                      ),
                    ),
                  ),
                  child: const Text(
                    'Sobremesa',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'AdiNeuePRO',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(sopa,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'AdiNeuePRO',
                    )),
                const SizedBox(
                  height: 10,
                ),
              ],
            )),
      ),
    );
  }
}
