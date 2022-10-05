import 'package:flutter/material.dart';
import 'package:flutter_singleton/conrollers/usuario_controller.dart';
import 'package:flutter_singleton/models/usuario_model.dart';
import 'package:get/get.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.find<UsuarioController>();
    final arguments = Get.arguments;
    print(arguments);
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
                final Usuario nuevoUsuario = Usuario(
                    nombre: arguments['nombre'], edad: arguments['edad']);
                usuarioCtrl.cargarUsuario(nuevoUsuario);
                showScaffoldMessenger(context, "Usuario Establecido");
              },
              child: const Text('Establecer Usuario',
                  style: TextStyle(color: Colors.white))),
          MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                usuarioCtrl.cambiarEdad(25);
                showScaffoldMessenger(context, "Edad Modificada");
              },
              child: const Text('Cambiar Edad',
                  style: TextStyle(color: Colors.white))),
          MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                usuarioCtrl.agregarProfesion(
                    "Desarrollador #${usuarioCtrl.usuario.value.profesiones!.length + 1}");
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
