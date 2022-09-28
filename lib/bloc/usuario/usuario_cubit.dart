import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_singleton/models/usuario_model.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioStatate> {
  UsuarioCubit() : super(UsuarioInitial());
}
