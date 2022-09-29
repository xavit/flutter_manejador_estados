import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_singleton/models/usuario_model.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    on<ActivateUser>((event, emit) {
      // emit(UserState(existUser: true, user: event.user));
    });
  }
}
