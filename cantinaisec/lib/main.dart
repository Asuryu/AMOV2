import 'package:cantinaisec/views/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cantina ISEC',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        backgroundColor: Colors.black,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
