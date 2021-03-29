import 'package:flutter/material.dart';
import 'package:perlemir_mobile/screens/add_bot_screen.dart';
import 'package:perlemir_mobile/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

import '../providers/bots.dart';
import '../widgets/bot_card.dart';

class BotScreen extends StatelessWidget {
  static const routeName = '/bot-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Active Bots"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AddBotScreen.routeName);
        },
      ),
      body: Consumer<Bots>(
        child: const Text("hello"),
        builder: (ctx, bots, child) => bots.dcabots.length <= 0
            ? child
            : ListView.builder(
                itemCount: bots.dcabots.length,
                itemBuilder: (ctx, i) {
                  // print(bots.dcabots.length);
                  return BotCard(bots.dcabots[i]);
                }),
      ),
      drawer: AppDrawer(),
    );
  }
}
