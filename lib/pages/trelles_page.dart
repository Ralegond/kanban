import 'package:flutter/material.dart';

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
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.grey[850],
          actions: [
            RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: Colors.cyan,
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 26.0,
              ),
              padding: EdgeInsets.all(10.0),
              shape: CircleBorder(),
            )
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
            for (final tab in tabs)
              ListTile(
                title: Text(
                  "id: 213",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  tab,
                  style: TextStyle(color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
