import 'package:flutter/material.dart';

import 'home_page.dart';

class PlayersName extends StatelessWidget {
  static const String routeName = 'players_name';
  String player1Name = '';
  String player2Name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '.. X-O Game ..',
          style: TextStyle(
          fontSize: 30,
        ),
      ),
        centerTitle: true,
    ),
      body: Column(
        children: [
          const SizedBox(
          height: 30,
        ),
          ///player1 tf
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (text)
              {
               player1Name = text;
              },
              decoration: const InputDecoration(
                labelText: 'First Player1Name',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ///player1 tf
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (text)
              {
               player2Name = text;
              },
              decoration: const InputDecoration(
                labelText: 'Second Player Name',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.of(context).pushNamed(
                    HomePage.routeName,
                  /// sending 2 args player1Name player2Name.
                  arguments: HomePageArgs(player1Name: player1Name, player2Name: player2Name),
                );
              },
              child: Text(
                'Let\'s play',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
          ),
        ],
      ),
    );
  }
}
