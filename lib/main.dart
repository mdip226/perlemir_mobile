import 'package:flutter/material.dart';
import 'package:perlemir_mobile/providers/coin_price.dart';
import 'package:perlemir_mobile/providers/bots.dart';
import 'package:perlemir_mobile/screens/add_bot_screen.dart';
import 'package:perlemir_mobile/screens/price_screen.dart';
import 'package:provider/provider.dart';
import 'package:perlemir_mobile/screens/bot_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Bots(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CoinPrice(),
        )
      ],
      child: MaterialApp(
        title: 'Perlemir',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: BotScreen(),
        routes: {
          AddBotScreen.routeName: (ctx) => AddBotScreen(),
          BotScreen.routeName: (ctx) => BotScreen(),
          PriceScreen.routeName: (ctx) => PriceScreen(),
        },
      ),
    );
  }
}
