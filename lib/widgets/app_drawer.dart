import 'package:flutter/material.dart';
import 'package:perlemir_mobile/screens/bot_screen.dart';
import 'package:perlemir_mobile/screens/price_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("Perlemir"),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.show_chart),
            title: Text("Price Data"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(PriceScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.bolt),
            title: Text("Bots"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(BotScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
