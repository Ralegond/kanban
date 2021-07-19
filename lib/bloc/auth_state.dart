import 'package:kanban/models/account.dart';

abstract class AuthState {}

class AuthInitState extends AuthState {
  String? usernameError;
  String? passwordError;
  AuthInitState({required this.usernameError, required this.passwordError});
}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  Account account;
  AuthSuccessState({required this.account});
}

class AuthErrorState extends AuthState {}
