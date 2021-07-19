import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/bloc/auth_bloc.dart';
import 'package:kanban/bloc/auth_events.dart';
import 'package:kanban/bloc/auth_state.dart';
import 'package:kanban/widgets/input_field.dart';
import 'package:kanban/widgets/log_in_button.dart';
import 'package:kanban/services/auth_api_provider.dart';

class AuthPage extends StatelessWidget {
  AuthPage(
      {Key? key,
      required this.authError,
      required this.usernameError,
      required this.passwordError})
      : super(key: key);

  final authProvider = AuthProvider();
  final String authError;
  final String? usernameError;
  final String? passwordError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kanban",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputField(
                  obscureText: false,
                  placeholder: "Enter your username",
                  errorText: usernameError,
                  initialValue: "",
                  onChanged: (newValue) {
                    context
                        .read<AuthBloc>()
                        .add(AuthLoginChangeEvent(data: newValue));
                  },
                ),
                InputField(
                  obscureText: true,
                  placeholder: "Enter your password",
                  errorText: passwordError,
                  initialValue: "",
                  onChanged: (newValue) {
                    context
                        .read<AuthBloc>()
                        .add(AuthPasswordChangeEvent(data: newValue));
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, authState) {
                    return LogInButton(
                      child: Text("Log in"),
                      onPressed: () {
                        context.read<AuthBloc>().add(AuthLogInEvent());
                      },
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 0.0),
                  child: Text(
                    authError,
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
