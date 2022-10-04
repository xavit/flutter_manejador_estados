import 'package:flutter/material.dart';
import 'package:flutter_singleton/pages/pagina2_page.dart';
import 'package:get/get.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 1'),
      ),
      body: const InformacionUsuario(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigate_next),
        onPressed: () => Get.to(Pagina2Page()),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  const InformacionUsuario({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(title: Text("Nombre: ")),
          ListTile(title: Text("Edad: ")),
          Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(title: Text("Profesión 1: ")),
          ListTile(title: Text("Profesión 1: ")),
          ListTile(title: Text("Profesión 1: ")),
        ],
      ),
    );
  }
}
