//SINGLETON
import 'package:flutter_singleton/models/usuario.dart';

class _UsuarioService {
  Usuario _usuario = Usuario(
    nombre: "Javier Claros",
    edad: 43,
    profesiones: ["Desarrollador", "Ingeniero"],
  );

  Usuario get usuario => _usuario;
  bool get existeUsuario => (_usuario != null) ? true : false;

  void cargarUsuario(Usuario user) {
    _usuario = user;
  }

  void cambiarEdad(int edad) {
    _usuario.edad = edad;
  }
}

final usuarioService = _UsuarioService();
