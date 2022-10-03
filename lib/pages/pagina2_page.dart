import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                showScaffoldMessenger(context, "Usuario Establecido");
              },
              child: const Text('Establecer Usuario',
                  style: TextStyle(color: Colors.white))),
          MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                showScaffoldMessenger(context, "Edad Modificada");
              },
              child: const Text('Cambiar Edad',
                  style: TextStyle(color: Colors.white))),
          MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                showScaffoldMessenger(context, "Profesión añadida");
              },
              child: const Text('Añadir Profesión',
                  style: TextStyle(color: Colors.white))),
        ],
      )),
    );
  }

  showScaffoldMessenger(_, String message) {
    ScaffoldMessenger.of(_).showSnackBar(SnackBar(content: Text(message)));
  }
}
