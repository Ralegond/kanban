import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kanban/models/auth_result.dart';

class AuthProvider {
  Future<AuthResult> logIn(String username, String password) async {
    final response = await http.post(
      Uri.parse('https://trello.backend.tests.nekidaem.ru/api/v1/users/login/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> userJson =
          json.decode(utf8.decode(response.bodyBytes));
      return AuthResult.fromJson(userJson);
    } else {
      return AuthResult(
        token: "",
        error: "Error code: ${response.statusCode}, answer: ${response.body}",
      );
    }
  }
}
