//SINGLETON
import 'dart:async';

import 'package:flutter_singleton/models/usuario.dart';

class _UsuarioService {
  Usuario _usuario = Usuario(
    nombre: "Javier Claros",
    edad: 43,
    profesiones: ["Desarrollador", "Ingeniero"],
  );

  final StreamController<Usuario> _usuarioStreamController =
      StreamController<Usuario>.broadcast();

  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;

  Usuario get usuario => _usuario;
  bool get existeUsuario => (_usuario != null) ? true : false;

  void cargarUsuario(Usuario user) {
    _usuario = user;
    _usuarioStreamController.add(_usuario);
  }

  void cambiarEdad(int edad) {
    _usuario.edad = edad;
    _usuarioStreamController.add(_usuario);
  }

  dispose() {
    _usuarioStreamController.close();
  }
}

final usuarioService = _UsuarioService();
