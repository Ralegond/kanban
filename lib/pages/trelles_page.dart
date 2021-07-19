import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/bloc/auth_bloc.dart';
import 'package:kanban/bloc/auth_events.dart';
import 'package:kanban/bloc/auth_state.dart';
import 'package:kanban/bloc/card_bloc.dart';
import 'package:kanban/bloc/card_events.dart';
import 'package:kanban/bloc/card_state.dart';
import 'package:kanban/services/card_api_provider.dart';
import 'package:kanban/widgets/info_card.dart';

class TrellesPage extends StatelessWidget {
  const TrellesPage({Key? key}) : super(key: key);
  static const tabs = [
    'On hold',
    'In progress',
    'Needs review',
    'Approved',
  ];

  @override
  Widget build(BuildContext context) {
    final CardProvider cardProvider = CardProvider();

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, authState) {
                return RawMaterialButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(AuthLogOutEvent());
                  },
                  elevation: 2.0,
                  fillColor: Colors.cyan,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 26.0,
                  ),
                  padding: EdgeInsets.all(8.0),
                  shape: CircleBorder(),
                );
              },
            ),
          ],
          automaticallyImplyLeading: false,
          bottom: TabBar(
            labelColor: Colors.white,
            isScrollable: true,
            tabs: [
              for (final tab in tabs) Tab(text: tab),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            for (int i = 0; i < tabs.length; i++)
              BlocProvider<CardBloc>(
                create: (context) => CardBloc(cardProvider: cardProvider),
                child: BlocBuilder<CardBloc, CardState>(
                  builder: (context, cardState) {
                    if (cardState is CardInitState) {
                      context.read<CardBloc>().add(CardGetEvent(row: i));
                      return Center(child: CircularProgressIndicator());
                    }
                    if (cardState is CardLoadedState) {
                      return ListView.builder(
                        itemCount: cardState.cards.length,
                        itemBuilder: (context, index) {
                          return InfoCard(
                            id: cardState.cards[index].id,
                            subtitle: cardState.cards[index].text,
                          );
                        },
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
