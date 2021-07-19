import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kanban/models/account.dart';

class AuthProvider {
  Future<Account> logIn(String username, String password) async {
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
      final Map<String, dynamic> userJson = json.decode(response.body);
      return Account.fromJson(userJson);
    } else {
      throw Exception('Error log in');
    }
  }
}
