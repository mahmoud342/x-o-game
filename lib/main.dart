import 'package:flutter/material.dart';
import 'package:x_o_game/players_name.dart';
import 'home_page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        PlayersName.routeName : (context) => PlayersName(),
      },
      //initialRoute: 'home_page',
      initialRoute: 'players_name',
    );
  }
}

