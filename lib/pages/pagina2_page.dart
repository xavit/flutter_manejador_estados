import 'package:flutter/material.dart';

import '../models/usuario.dart';
import '../services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return snapshot.hasData
                ? Text("Usuario: ${snapshot.data.nombre}")
                : const Text("Página 2");
          },
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                final nuevoUsuario = Usuario(
                  nombre: "Juan Perez",
                  edad: 30,
                  profesiones: [
                    "Músico",
                  ],
                );
                usuarioService.cargarUsuario(nuevoUsuario);
              },
              child: const Text('Establecer Usuario',
                  style: TextStyle(color: Colors.white))),
          MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                usuarioService.cambiarEdad(20);
              },
              child: const Text('Cambiar Edad',
                  style: TextStyle(color: Colors.white))),
          MaterialButton(
              color: Colors.blueAccent,
              onPressed: () => print("click"),
              child: const Text('Añadir Profesión',
                  style: TextStyle(color: Colors.white))),
        ],
      )),
    );
  }
}
