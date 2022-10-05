import 'package:flutter/material.dart';
import 'package:flutter_singleton/conrollers/usuario_controller.dart';
import 'package:flutter_singleton/models/usuario_model.dart';
import 'package:flutter_singleton/pages/pagina2_page.dart';
import 'package:get/get.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.put(UsuarioController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 1'),
      ),
      body: Obx(() => usuarioCtrl.existeUsuario.value
          ? InformacionUsuario(
              usuario: usuarioCtrl.usuario.value,
            )
          : const NoInfo()),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.navigate_next,
          size: 50,
        ),
        onPressed: () => Get.to(() => Pagina2Page(), arguments: {
          'nombre': "Javier Claros",
          'edad': 30,
        }),
      ),
    );
  }
}

class NoInfo extends StatelessWidget {
  const NoInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(child: Text("No hay un usuario Seleccionado")),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ListTile(title: Text("Nombre: ${usuario.nombre}")),
          ListTile(title: Text("Edad: ${usuario.edad}")),
          const Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ...usuario.profesiones!.map((e) => ListTile(title: Text(e))).toList(),
          // const ListTile(title: Text("Profesión 1: ")),
          // const ListTile(title: Text("Profesión 1: ")),
          // const ListTile(title: Text("Profesión 1: ")),
        ],
      ),
    );
  }
}
