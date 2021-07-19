import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/bloc/card_state.dart';
import 'package:kanban/models/card_data.dart';
import 'package:kanban/services/card_api_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'card_events.dart';

class CardBloc extends Bloc<CardEvents, CardState> {
  CardBloc({required this.cardProvider}) : super(CardInitState());

  final CardProvider cardProvider;

  @override
  Stream<CardState> mapEventToState(CardEvents event) async* {
    if (event is CardGetEvent) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      print(token);
      if (token != null) {
        List<CardData> _cards = await cardProvider.getCards(token, event.row);
        yield CardLoadedState(cards: _cards);
      } else {
        yield CardErrorState();
      }
    }
  }
}
