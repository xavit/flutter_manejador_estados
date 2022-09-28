import 'package:flutter/material.dart';
import 'package:flutter_singleton/models/usuario_model.dart';
import 'package:flutter_singleton/services/usuario_service.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario
            ? Text('${usuarioService.usuario.nombre}')
            : const Text('Página 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                final newUser =
                    Usuario(nombre: "Juan Perez", edad: 50, profesiones: [
                  "Developer",
                  "Gamer Pro",
                ]);
                usuarioService.usuario = newUser;
              },
              child: const Text('Establecer Usuario',
                  style: TextStyle(color: Colors.white))),
          MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                usuarioService.cambiarEdad(100);
              },
              child: const Text('Cambiar Edad',
                  style: TextStyle(color: Colors.white))),
          MaterialButton(
              color: Colors.blueAccent,
              onPressed: () => usuarioService.agregarProfesion(
                  "Nueva Profesión ${usuarioService.usuario.profesiones!.length + 1}"),
              child: const Text('Añadir Profesión',
                  style: TextStyle(color: Colors.white))),
        ],
      )),
    );
  }
}
