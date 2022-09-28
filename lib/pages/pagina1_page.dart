import 'package:flutter/material.dart';
import 'package:flutter_singleton/services/usuario_service.dart';

import '../models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 1'),
      ),
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? InformacionUsuario(snapshot.data)
              : const Center(
                  child: Text("No hay información del usuario"),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.navigate_next),
          onPressed: () => Navigator.pushNamed(context, 'pagina2')),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  late Usuario usuario;

  InformacionUsuario(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          usuario.profesiones!.isNotEmpty
              ? ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                        title: Text(usuario.profesiones![index]),
                      ),
                  itemCount: usuario.profesiones!.length,
                  shrinkWrap: true)
              : Container(height: 0),
        ],
      ),
    );
  }
}
