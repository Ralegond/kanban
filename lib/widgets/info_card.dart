import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.id,
    required this.subtitle,
  }) : super(key: key);

  final int id;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          title: Text(
            "ID: $id",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
