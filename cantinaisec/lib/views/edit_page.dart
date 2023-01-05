import 'package:flutter/material.dart';
import 'package:cantinaisec/models/menu.dart';

class EditPage extends StatelessWidget {
  //const EditPage({Key? key, required this.selectedMenu, required this.weekDay})
  const EditPage({Key? key, required this.weekDay})
      : super(key: key);

  //final Menu selectedMenu;
  final String? weekDay;

  @override
  Widget build(BuildContext context) {
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
                  child: const Text('Editar Refeição'))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 252, 158, 70),
          onPressed: () => {

          },
          tooltip: 'Refresh',
          child: const Icon(Icons.save),
        ),
        backgroundColor: const Color.fromARGB(255, 17, 17, 17));
  }
}