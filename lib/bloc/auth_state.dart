import 'package:kanban/models/auth_result.dart';

abstract class AuthState {}

class AuthInitState extends AuthState {
  String? usernameError;
  String? passwordError;
  AuthInitState({required this.usernameError, required this.passwordError});
}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  AuthResult authResult;
  AuthSuccessState({required this.authResult});
}

class AuthErrorState extends AuthState {
  String error;
  AuthErrorState({required this.error});
}
