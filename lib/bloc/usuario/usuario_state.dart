part of 'usuario_cubit.dart';

@immutable
abstract class UsuarioStatate {}

class UsuarioInitial extends UsuarioStatate {
  final existeUsuario = false;
}

class UsuarioActivo extends UsuarioStatate {
  final existeUsuario = true;
  final Usuario usuario;

  UsuarioActivo(this.usuario);
}
