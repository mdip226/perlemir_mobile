import 'package:flutter/material.dart';
import 'package:perlemir_mobile/models/DCABot.dart';

class BotCard extends StatelessWidget {
  final DCABot bot;
  BotCard(this.bot);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Column(
          children: [
            Text(bot.name),
            Text(
              "\$${bot.amount.toStringAsFixed(2)} per ${bot.freq}",
            ),
          ],
        ),
      ),
    );
  }
}
