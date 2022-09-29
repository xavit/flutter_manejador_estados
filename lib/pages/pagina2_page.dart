import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_singleton/bloc/usuario/usuario_cubit.dart';
import 'package:flutter_singleton/models/usuario_model.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();
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
                final nuevoUsuario = Usuario(
                    nombre: 'Juan',
                    edad: 30,
                    profesiones: ['Desarrollador', 'Ingeniero']);
                usuarioCubit.seleccionarUsuario(nuevoUsuario);

                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    elevation: 7,
                    backgroundColor: Colors.black,
                    content: Text(
                      'Usuario Establecido',
                      style: TextStyle(color: Colors.yellow),
                    )));
              },
              child: const Text('Establecer Usuario',
                  style: TextStyle(color: Colors.white))),
          MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                usuarioCubit.cambiarEdad(55);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    elevation: 7,
                    backgroundColor: Colors.black,
                    content: Text(
                      'Edad modificada',
                      style: TextStyle(color: Colors.yellow),
                    )));
              },
              child: const Text('Cambiar Edad',
                  style: TextStyle(color: Colors.white))),
          MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                usuarioCubit.agregarProfesion('Nueva Profesión ');
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    elevation: 7,
                    backgroundColor: Colors.black,
                    content: Text(
                      'Profesión agregada',
                      style: TextStyle(color: Colors.yellow),
                    )));
              },
              child: const Text('Añadir Profesión',
                  style: TextStyle(color: Colors.white))),
        ],
      )),
    );
  }
}
