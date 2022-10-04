import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_singleton/bloc/user/user_bloc.dart';
import 'package:flutter_singleton/models/usuario_model.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);

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
                final newUser = Usuario(
                    nombre: 'Javier Claros',
                    edad: 43,
                    profesiones: ['Full Stack', 'Mobile Dev', 'Driver']);

                userBloc.add(ActivateUser(newUser));
                showScaffoldMessenger(context, "Usuario Establecido");
              },
              child: const Text('Establecer Usuario',
                  style: TextStyle(color: Colors.white))),
          MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                userBloc.add(ChangeUserAge(25));
                showScaffoldMessenger(context, "Edad Modificada");
              },
              child: const Text('Cambiar Edad',
                  style: TextStyle(color: Colors.white))),
          MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                userBloc.add(AddUserProfession(
                    "New Profession ${userBloc.state.user!.profesiones!.length}"));
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
