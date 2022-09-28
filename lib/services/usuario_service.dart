import 'package:flutter/material.dart';
import 'package:flutter_singleton/models/usuario_model.dart';

class UsuarioService with ChangeNotifier {
  late Usuario _usuario =
      Usuario(nombre: null, profesiones: ['some ', 'other']);

  Usuario get usuario => _usuario;

  bool get existeUsuario => (_usuario.nombre != null) ? true : false;

  set usuario(Usuario user) {
    _usuario = user;
    notifyListeners();
  }

  void cambiarEdad(int edad) {
    _usuario.edad = edad;
    notifyListeners();
  }

  void removerUsuario() {
    _usuario = Usuario();
    notifyListeners();
  }

  void agregarProfesion(String profesion) {
    _usuario.profesiones!.add(profesion);
    notifyListeners();
  }
}
