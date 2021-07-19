import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/bloc/auth_state.dart';
import 'package:kanban/models/auth_result.dart';
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
          final AuthResult _authResult =
              await authProvider.logIn(username, password);

          if (_authResult.error == null) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('token', _authResult.token);

            yield AuthSuccessState(authResult: _authResult);
          } else {
            yield AuthErrorState(error: _authResult.error!);
          }
        } catch (_) {
          print("error");
          yield AuthErrorState(error: "try catch error");
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
