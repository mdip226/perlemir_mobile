import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class PriceDatum {
  PriceDatum(this.date, this.price);
  final DateTime date;
  final double price;
}

class BitcoinPrice with ChangeNotifier {
  List<PriceDatum> _prices = [];

  List<PriceDatum> get getPrices {
    return [..._prices];
  }

  void fetchAndSetPrices() async {
    try {
      //you can provide start and end parameters here
      final url =
          Uri.parse('https://api.coindesk.com/v1/bpi/historical/close.json');
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final extractedBpi = extractedData["bpi"] as Map<String, dynamic>;
      extractedBpi.forEach((key, value) {
        _prices.add(PriceDatum(DateTime.parse(key), value));
      });
      print(_prices);
    } catch (e) {
      print(e);
    }
  }
}
