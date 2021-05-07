import 'package:flutter/material.dart';

enum Freq {
  perHour,
  perDay,
  perWeek,
  perMonth,
}
enum Currency {
  BTC,
  ETH,
}

class DCABot {
  final String id;
  final String name;
  final Freq frequency;
  final double amount;
  final Currency currency;

  const DCABot({
    @required this.id,
    @required this.name,
    @required this.frequency,
    @required this.amount,
    @required this.currency,
  });

  String get freq {
    switch (frequency) {
      case Freq.perHour:
        return "hour";
        break;
      case Freq.perDay:
        return "day";
        break;
      case Freq.perWeek:
        return "week";
        break;
      case Freq.perMonth:
        return "month";
        break;
    }
  }
}
