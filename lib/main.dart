import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/bloc/auth_state.dart';
import 'package:kanban/services/auth_api_provider.dart';
import 'bloc/auth_bloc.dart';
import 'pages/trelles_page.dart';
import 'pages/auth_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthProvider authProvider = AuthProvider();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(authProvider: authProvider),
      child: MaterialApp(
        title: 'Kanban',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            foregroundColor: Colors.black,
          ),
          brightness: Brightness.dark,
        ),
        home: BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
          if (authState is AuthInitState) {
            return AuthPage(
              authError: "",
              usernameError: authState.usernameError,
              passwordError: authState.passwordError,
            );
          }
          if (authState is AuthSuccessState) {
            return TrellesPage();
          }
          if (authState is AuthLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (authState is AuthErrorState) {
            return AuthPage(
              authError: "Auth error",
              usernameError: "",
              passwordError: "",
            );
          }
          return AuthPage(
            authError: "",
            usernameError: "",
            passwordError: "",
          );
        }),
      ),
    );
  }
}
