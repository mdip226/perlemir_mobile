import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/bots.dart';
import '../widgets/bot_card.dart';

class BotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Active Bots"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
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
    );
  }
}
