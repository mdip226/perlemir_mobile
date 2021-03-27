import 'package:flutter/material.dart';

import '../models/DCABot.dart';

class Bots with ChangeNotifier {
  List<DCABot> _dcabots = [
    DCABot(
        id: "a",
        name: "Bot One",
        frequency: Freq.perHour,
        amount: 1.11,
        currency: Currency.BTC),
    DCABot(
        id: "b",
        name: "Bot Two",
        frequency: Freq.perDay,
        amount: 2.22,
        currency: Currency.BTC),
    DCABot(
        id: "c",
        name: "Bot Three",
        frequency: Freq.perWeek,
        amount: 3.33,
        currency: Currency.ETH),
    DCABot(
        id: "c",
        name: "Bot Four",
        frequency: Freq.perMonth,
        amount: 4.44,
        currency: Currency.ETH),
  ];

  List<DCABot> get dcabots {
    return [..._dcabots];
  }

  DCABot findById(String id) {
    return _dcabots.firstWhere((e) => e.id == id);
  }

  void addDCABot(
      String name, Currency currency, double amount, Freq frequency) {
    final newBot = DCABot(
        id: DateTime.now().toString(),
        name: name,
        frequency: frequency,
        amount: amount,
        currency: currency);
    _dcabots.add(newBot);
    notifyListeners();
  }
}
