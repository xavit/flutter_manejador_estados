//Acciones que va a recibir el bloc y cambiar el state

part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivateUser extends UserEvent {
  final Usuario user;

  ActivateUser(this.user);
}

class ChangeUserAge extends UserEvent {
  final int newAge;

  ChangeUserAge(this.newAge);
}

class AddUserProfession extends UserEvent {
  final String newProfession;

  AddUserProfession(this.newProfession);
}
