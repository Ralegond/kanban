import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/bloc/auth_state.dart';
import 'package:kanban/models/account.dart';
import 'package:kanban/services/auth_api_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_events.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  AuthBloc({required this.authProvider})
      : super(AuthInitState(usernameError: null, passwordError: null));

  final AuthProvider authProvider;
  String username = "";
  String password = "";

  String? getError(len, maxLen) {
    if (0 < len && len < maxLen) {
      return "minimum is $maxLen characters";
    } else {
      return null;
    }
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvents event) async* {
    if (event is AuthLogInEvent) {
      if (username.length >= 4 && password.length >= 8) {
        try {
          yield AuthLoadingState();
          final Account _account = await authProvider.logIn(username, password);

          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', _account.token);

          yield AuthSuccessState(account: _account);
        } catch (_) {
          print("error");
          yield AuthErrorState();
        }
      }
    }
    if (event is AuthLogOutEvent) {
      username = "";
      password = "";
      yield AuthInitState(usernameError: null, passwordError: null);
    }
    if (event is AuthLoginChangeEvent) {
      try {
        username = event.data.toString();
        yield AuthInitState(
          usernameError: getError(username.length, 4),
          passwordError: getError(password.length, 8),
        );
      } catch (_) {
        addError("username error");
      }
    }
    if (event is AuthPasswordChangeEvent) {
      try {
        password = event.data.toString();
        yield AuthInitState(
          usernameError: getError(username.length, 4),
          passwordError: getError(password.length, 8),
        );
      } catch (_) {
        addError("username error");
      }
    }
  }
}
