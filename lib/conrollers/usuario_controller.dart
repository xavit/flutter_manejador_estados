import 'package:flutter_singleton/models/usuario_model.dart';
import 'package:get/get.dart';

class UsuarioController extends GetxController {
  var existeUsuario = false.obs;
  var usuario = Usuario().obs;

  void cargarUsuario(Usuario usuario) {
    this.usuario.value = usuario;
    existeUsuario.value = true;
  }

  void cambiarEdad(int edad) {
    usuario.update((val) {
      val!.edad = edad;
    });
  }

  void agregarProfesion(String profesion) {
    usuario.update((val) {
      val!.profesiones = [...val.profesiones!, profesion];
    });
  }
}
