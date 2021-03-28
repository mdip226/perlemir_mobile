import 'package:flutter/material.dart';
import 'package:perlemir_mobile/providers/bots.dart';
import 'package:perlemir_mobile/screens/add_bot_screen.dart';
import 'package:provider/provider.dart';
import 'package:perlemir_mobile/screens/bot_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Bots(),
      child: MaterialApp(
        title: 'Perlemir',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: BotScreen(),
        routes: {AddBotScreen.routeName: (ctx) => AddBotScreen()},
      ),
    );
  }
}
