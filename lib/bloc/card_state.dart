import 'package:kanban/models/card_data.dart';

abstract class CardState {}

class CardInitState extends CardState {}

class CardLoadingState extends CardState {}

class CardLoadedState extends CardState {
  List<CardData> cards;
  CardLoadedState({required this.cards});
}

class CardErrorState extends CardState {}
