import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_singleton/bloc/usuario/usuario_cubit.dart';
import 'package:flutter_singleton/models/usuario_model.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 1'),
        actions: [
          IconButton(
              onPressed: () => usuarioCubit.borrarUsuario(),
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ))
        ],
      ),
      body: const BodyScaffold(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.navigate_next),
          onPressed: () => Navigator.pushNamed(context, 'pagina2')),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioStatate>(builder: (_, state) {
      switch (state.runtimeType) {
        case UsuarioInitial:
          return const Center(child: Text('No hay información del usuario'));

        case UsuarioActivo:
          return InformacionUsuario(
            usuario: (state as UsuarioActivo).usuario,
          );

        default:
          return const Center(child: Text('Estado no reconocido '));
      }
    });
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
        ],
      ),
    );
  }
}
