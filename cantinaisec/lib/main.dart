import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CantinaISEC',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Cantina ISEC'),
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
  Color? _backgroundColor;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    _updateBackgroundColor();
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
    _updateBackgroundColor();
  }

  void _updateBackgroundColor(){
    _backgroundColor = Color.fromRGBO(
      Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(
              size: _counter >= 10 ? 200 : 0,
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$_counter',
                  style: const TextStyle(fontSize: 50),
                ),
                const Text(
                  '€',
                  style: TextStyle(fontSize: 50),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => setState(() {
                _counter = 0;
              }), 
              child: const Text('Reset')
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Saldo:',
                ),
                Text(
                  '$_counter',
                  style: const TextStyle(fontSize: 50),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
      persistentFooterButtons: [
        Center(
          child: TextButton(
            onPressed: () {},
            child: const Text('Carregar'),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Transferir'),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Histórico'),
        ),],
    );
  }
}
