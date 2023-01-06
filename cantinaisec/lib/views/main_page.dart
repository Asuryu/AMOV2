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

  Map<String, dynamic> menu = {};

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
        onPressed: () => {
          setState(() {
            // refresh the page
            // get the menu from the server
            // save the menu in shared preferences
            // CircularProgressIndicator
            Future<http.Response> response =
                http.get(Uri.parse('http://94.61.156.105:8080/menu'));
            response.then((value) {
              menu = jsonDecode(value.body);
              debugPrint(menu.toString());
              SharedPreferences.getInstance().then((prefs) {
                prefs.setString('menu', menu.toString());
              });
            });
          })
        },
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
      body: FutureBuilder<http.Response>(
        future: http
            .get(Uri.parse('http://94.61.156.105:8080/menu'))
            .timeout(const Duration(seconds: 5)),
        builder: (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
          if (snapshot.hasData) {
            menu = jsonDecode(snapshot.data!.body);
            return Container(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 0, right: 0),
                alignment: Alignment.center,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    MealCard(
                      weekDay: "Segunda-Feira",
                      menu: menu,
                      imagePath: "images/segunda.png",
                    ),
                    MealCard(
                      weekDay: "Terça-Feira",
                      menu: menu,
                      imagePath: "images/terca*.png",
                    ),
                    MealCard(
                      weekDay: "Quarta-Feira",
                      menu: menu,
                      imagePath: "images/quarta.png",
                    ),
                    MealCard(
                      weekDay: "Quinta-Feira",
                      menu: menu,
                      imagePath: "images/quinta.png",
                    ),
                    MealCard(
                      weekDay: "Sexta-Feira",
                      menu: menu,
                      imagePath: "images/sexta.png",
                    ),
                  ],
                ));
          } else if (snapshot.hasError) {
            return const Center(
                child: Text(
              'Erro ao obter o menu',
              style: TextStyle(color: Colors.white),
            ));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      backgroundColor: const Color.fromARGB(255, 17, 17, 17),
    );
  }
}

class MealCard extends StatelessWidget {
  const MealCard(
      {Key? key,
      required this.weekDay,
      required this.imagePath,
      required this.menu})
      : super(key: key);

  final String weekDay;
  final String imagePath;
  final Map<String, dynamic> menu;

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
                const EdgeInsets.only(top: 20, bottom: 20, left: 0, right: 0),
            alignment: Alignment.topCenter,
            child: ListView(
              shrinkWrap: true,
              children: [
                Column(
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
                        "Sopa",
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
                    Text(menu["MONDAY"]["update"]['soup'],
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
                    Text(menu["MONDAY"]["update"]['meat'],
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
                    Text(menu["MONDAY"]["update"]['fish'],
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
                    Text(menu["MONDAY"]["update"]['vegetarian'],
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
                    Text(menu["MONDAY"]["update"]['soup'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'AdiNeuePRO',
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
