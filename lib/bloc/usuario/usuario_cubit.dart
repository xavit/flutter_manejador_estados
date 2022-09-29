import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_singleton/models/usuario_model.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioStatate> {
  UsuarioCubit() : super(UsuarioInitial());

  void seleccionarUsuario(Usuario usuario) {
    emit(UsuarioActivo(usuario));
  }

  void cambiarEdad(int edad) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final nuevoUsuario = currentState.usuario.copyWith(edad: edad);
      emit(UsuarioActivo(nuevoUsuario));
    }
  }

  void agregarProfesion(String profesion) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final nuevoUsuario = currentState.usuario.copyWith(
          profesiones: [...?currentState.usuario.profesiones, profesion]);
      emit(UsuarioActivo(nuevoUsuario));
    }
    // final usuarioActivo = (state as UsuarioActivo).usuario;
    // usuarioActivo.profesiones!.add(profesion);
    // emit(UsuarioActivo(usuarioActivo));
  }

  void borrarUsuario() {
    emit(UsuarioInitial());
  }
}
