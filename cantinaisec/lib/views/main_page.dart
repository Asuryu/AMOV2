import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cantinaisec/views/edit_page.dart';
import 'dart:convert' show jsonDecode, jsonEncode, utf8;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> days = ['Segunda-Feira', 'Terça-Feira', 'Quarta-Feira', 'Quinta-Feira', 'Sexta-Feira'];
  List<String> daysKeys = ['MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY'];

  Map<String, dynamic> menu = {};

  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) {
      //  Olá Rafael e Tânia :)
      if (prefs.getString('weeklyMenu') != null) {
        setState(() {
          menu = jsonDecode(prefs.getString('weeklyMenu')!);
        });
      } else {
        setState(() {
          menu = {};
        });
      }
    });
    return super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
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
                child: const Text(
                  'Cantina ISEC',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'AdiNeuePRO',
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          setState(() {
            Future<http.Response> response = http.get(Uri.parse('http://94.61.156.105:8080/menu'));
            response.then((value) {
              SharedPreferences.getInstance().then((prefs) {
                prefs.setString('weeklyMenu', value.body);
              });
              menu = jsonDecode(value.body);
            });
          })
        },
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
      body: Builder(
        builder: (BuildContext context) {
          if (menu.isEmpty) {
            return const Center(
              child: Text(
                'Sem menu disponível',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'AdiNeuePRO',
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            return Builder(builder: (BuildContext context) {
              var menuMonday = menu["MONDAY"]["update"] ?? menu["MONDAY"]["original"];
              var menuTuesday = menu["TUESDAY"]["update"] ?? menu["TUESDAY"]["original"];
              var menuWednesday = menu["WEDNESDAY"]["update"] ?? menu["WEDNESDAY"]["original"];
              var menuThursday = menu["THURSDAY"]["update"] ?? menu["THURSDAY"]["original"];
              var menuFriday = menu["FRIDAY"]["update"] ?? menu["FRIDAY"]["original"];

              String imageMonday;
              String imageTuesday;
              String imageWednesday;
              String imageThursday;
              String imageFriday;

              imageMonday = menu["MONDAY"]["update"] != null
                  ? menu["MONDAY"]["update"]["img"] != ''
                      ? "http://94.61.156.105:8080/images/${menu["MONDAY"]["update"]["img"]}"
                      : "images/emptyMenu.png"
                  : "images/emptyMenu.png";

              imageTuesday = menu["TUESDAY"]["update"] != null
                  ? menu["TUESDAY"]["update"]["img"] != ''
                      ? "http://94.61.156.105:8080/images/${menu["TUESDAY"]["update"]["img"]}"
                      : "images/emptyMenu.png"
                  : "images/emptyMenu.png";

              imageWednesday = menu["WEDNESDAY"]["update"] != null
                  ? menu["WEDNESDAY"]["update"]["img"] != ''
                      ? "http://94.61.156.105:8080/images/${menu["WEDNESDAY"]["update"]["img"]}"
                      : "images/emptyMenu.png"
                  : "images/emptyMenu.png";

              imageThursday = menu["THURSDAY"]["update"] != null
                  ? menu["THURSDAY"]["update"]["img"] != ''
                      ? "http://94.61.156.105:8080/images/${menu["THURSDAY"]["update"]["img"]}"
                      : "images/emptyMenu.png"
                  : "images/emptyMenu.png";

              imageFriday = menu["FRIDAY"]["update"] != null
                  ? menu["FRIDAY"]["update"]["img"] != ''
                      ? "http://94.61.156.105:8080/images/${menu["FRIDAY"]["update"]["img"]}"
                      : "images/emptyMenu.png"
                  : "images/emptyMenu.png";

              return Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20, left: 0, right: 0),
                  alignment: Alignment.center,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    for (var i = getWeekDay(); i <= 4; i++)
                      MealCard(
                        tag: i.toString(),
                        weekDay: days[i],
                        imagePath: i == 0
                            ? imageMonday
                            : i == 1
                                ? imageTuesday
                                : i == 2
                                    ? imageWednesday
                                    : i == 3
                                        ? imageThursday
                                        : imageFriday,
                        menu: i == 0
                            ? menuMonday
                            : i == 1
                                ? menuTuesday
                                : i == 2
                                    ? menuWednesday
                                    : i == 3
                                        ? menuThursday
                                        : menuFriday,
                        menuComplete: i == 0
                            ? menu["MONDAY"]
                            : i == 1
                                ? menu["TUESDAY"]
                                : i == 2
                                    ? menu["WEDNESDAY"]
                                    : i == 3
                                        ? menu["THURSDAY"]
                                        : menu["FRIDAY"],
                      ),
                    for (int i = 0; i < getWeekDay(); i++)
                      MealCard(
                        tag: i.toString(),
                        weekDay: days[i],
                        imagePath: i == 0
                            ? imageMonday
                            : i == 1
                                ? imageTuesday
                                : i == 2
                                    ? imageWednesday
                                    : i == 3
                                        ? imageThursday
                                        : imageFriday,
                        menu: i == 0
                            ? menuMonday
                            : i == 1
                                ? menuTuesday
                                : i == 2
                                    ? menuWednesday
                                    : i == 3
                                        ? menuThursday
                                        : menuFriday,
                        menuComplete: i == 0
                            ? menu["MONDAY"]
                            : i == 1
                                ? menu["TUESDAY"]
                                : i == 2
                                    ? menu["WEDNESDAY"]
                                    : i == 3
                                        ? menu["THURSDAY"]
                                        : menu["FRIDAY"],
                      )
                  ]));
            });
          }
        },
      ),
      backgroundColor: const Color.fromARGB(255, 17, 17, 17),
    );
  }
}

class MealCard extends StatelessWidget {
  const MealCard({Key? key, required this.tag, required this.weekDay, required this.imagePath, required this.menu, required this.menuComplete})
      : super(key: key);

  final String tag;
  final String weekDay;
  final String imagePath;
  final Map<String, dynamic> menu;
  final Map<String, dynamic> menuComplete;

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
            MaterialPageRoute(builder: (context) => EditPage(tag: tag, weekDay: weekDay, filePath: imagePath, menu: menu, menuComplete: menuComplete)),
          );

        },
        child: Container(
            width: screenWidth * 0.955,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 43, 43, 43),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
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
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'AdiNeuePRO',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Hero(
                      tag: tag,
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
                                if (imagePath == 'images/emptyMenu.png') {
                                  return Image.asset(
                                    imagePath,
                                    fit: BoxFit.contain,
                                    height: screenHeight * 0.25,
                                  );
                                } else {
                                  return Image.network(
                                    imagePath,
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
                    const SizedBox(height: 30),
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
                          fontSize: 15,
                          fontFamily: 'AdiNeuePRO',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (menuComplete['update'] != null)
                      if (menuComplete['update']['soup'] != menuComplete['original']['soup'])
                        Text(utf8.decode(menuComplete['update']['soup'].toString().codeUnits),
                            style: const TextStyle(
                              color: Colors.orange,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ))
                      else
                        Text(utf8.decode(menuComplete['original']['soup'].toString().codeUnits),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            )),
                    if (menuComplete['update'] == null)
                      Text(utf8.decode(menuComplete['original']['soup'].toString().codeUnits),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'AdiNeuePRO',
                          )),
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
                        'Prato de carne',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'AdiNeuePRO',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (menuComplete['update'] != null)
                      if (menuComplete['update']['meat'] != menuComplete['original']['meat'])
                        Text(utf8.decode(menuComplete['update']['meat'].toString().codeUnits),
                            style: const TextStyle(
                              color: Colors.orange,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ))
                      else
                        Text(utf8.decode(menuComplete['original']['meat'].toString().codeUnits),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            )),
                    if (menuComplete['update'] == null)
                      Text(utf8.decode(menuComplete['original']['meat'].toString().codeUnits),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'AdiNeuePRO',
                          )),
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
                        'Prato de peixe',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'AdiNeuePRO',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (menuComplete['update'] != null)
                      if (menuComplete['update']['fish'] != menuComplete['original']['fish'])
                        Text(utf8.decode(menuComplete['update']['fish'].toString().codeUnits),
                            style: const TextStyle(
                              color: Colors.orange,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ))
                      else
                        Text(utf8.decode(menuComplete['original']['fish'].toString().codeUnits),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            )),
                    if (menuComplete['update'] == null)
                      Text(utf8.decode(menuComplete['original']['fish'].toString().codeUnits),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'AdiNeuePRO',
                          )),
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
                        'Prato vegetariano',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'AdiNeuePRO',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (menuComplete['update'] != null)
                      if (menuComplete['update']['vegetarian'] != menuComplete['original']['vegetarian'])
                        Text(utf8.decode(menuComplete['update']['vegetarian'].toString().codeUnits),
                            style: const TextStyle(
                              color: Colors.orange,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ))
                      else
                        Text(utf8.decode(menuComplete['original']['vegetarian'].toString().codeUnits),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            )),
                    if (menuComplete['update'] == null)
                      Text(utf8.decode(menuComplete['original']['vegetarian'].toString().codeUnits),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'AdiNeuePRO',
                          )),
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
                        'Sobremesa',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'AdiNeuePRO',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (menuComplete['update'] != null)
                      if (menuComplete['update']['desert'] != menuComplete['original']['desert'])
                        Text(utf8.decode(menuComplete['update']['desert'].toString().codeUnits),
                            style: const TextStyle(
                              color: Colors.orange,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            ))
                      else
                        Text(utf8.decode(menuComplete['original']['desert'].toString().codeUnits),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'AdiNeuePRO',
                            )),
                    if (menuComplete['update'] == null)
                      Text(utf8.decode(menuComplete['original']['desert'].toString().codeUnits),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'AdiNeuePRO',
                          )),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

int getWeekDay() {
  final today = DateTime.now();

  if (today.weekday > 4) {
    return 0;
  } else {
    return today.weekday - 1;
  }
}
