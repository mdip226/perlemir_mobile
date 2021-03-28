import 'package:flutter/material.dart';
import 'package:perlemir_mobile/widgets/bot_form.dart';
import 'package:provider/provider.dart';

import '../providers/bots.dart';

class AddBotScreen extends StatelessWidget {
  static const routeName = "/add-bot";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a Bot"),
      ),
      body: BotForm(),
    );
  }
}
