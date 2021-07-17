import 'package:flutter/material.dart';
import 'package:kanban/widgets/input_field.dart';
import 'package:kanban/widgets/log_in_button.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text(
          "Kanban",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            InputField(
              placeholder: "Enter your username",
              errorText: "minimum is 4 characters",
              initialValue: "",
              onChanged: (newValue) {},
            ),
            InputField(
              placeholder: "Enter your password",
              errorText: "minimum is 8 characters",
              initialValue: "",
              onChanged: (newValue) {},
            ),
            SizedBox(
              height: 40,
            ),
            LogInButton(
              child: Text("Log in"),
            ),
          ],
        ),
      ),
    );
  }
}
