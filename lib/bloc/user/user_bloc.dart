//Archivo que tiene la información del estado actual y procesa los eventos

import 'package:bloc/bloc.dart';
import 'package:flutter_singleton/models/usuario_model.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>((event, emit) => emit(UserSetState(event.user)));
    on<DeleteUser>((event, emit) => emit(const UserInitialState()));

    on<ChangeUserAge>((event, emit) {
      if (!state.existUser) {
        return;
      }

      emit(UserSetState(state.user!.copyWith(edad: event.newAge)));
    });

    on<AddUserProfession>((event, emit) {
      if (!state.existUser) {
        return;
      }

      final newUser = state.user!.copyWith(
        profesiones: [...state.user!.profesiones!, event.newProfession],
      );

      emit(UserSetState(newUser));
    });
  }
}
