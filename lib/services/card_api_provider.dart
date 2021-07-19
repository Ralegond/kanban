import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:kanban/models/card_data.dart';

class CardProvider {
  Future<List<CardData>> getCards(token, row) async {
    final response = await http.get(
      Uri.parse(
          'https://trello.backend.tests.nekidaem.ru/api/v1/cards/?row=$row'),
      headers: {
        HttpHeaders.authorizationHeader: "JWT $token",
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> cardsJson = json.decode(response.body);
      return cardsJson.map((json) => CardData.fromJson(json)).toList();
    } else {
      throw Exception('Error get cards');
    }
  }
}
