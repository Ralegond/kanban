abstract class AuthEvents {}

class AuthLoginChangeEvent extends AuthEvents {
  String? data;
  AuthLoginChangeEvent({required this.data});
}

class AuthPasswordChangeEvent extends AuthEvents {
  String? data;
  AuthPasswordChangeEvent({required this.data});
}

class AuthLogInEvent extends AuthEvents {}

class AuthLogOutEvent extends AuthEvents {}
