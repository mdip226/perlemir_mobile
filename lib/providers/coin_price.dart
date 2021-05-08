import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class PriceDatum {
  PriceDatum(this.date, this.price);
  final DateTime date;
  final double price;
}

class CoinPrice with ChangeNotifier {
  List<PriceDatum> _prices = [];
  String _timespan = "30";
  String _coin = "bitcoin";

  List<PriceDatum> get getPrices {
    return [..._prices];
  }

  String get timespan {
    return _timespan;
  }

  String get coin {
    return _coin;
  }

  Future<void> fetchAndSetPrices(String timespan, String coin) async {
    try {
      //you can provide start and end parameters here
      final url = Uri.parse(
          'https://api.coingecko.com/api/v3/coins/$coin/market_chart?vs_currency=usd&days=$timespan');
      final response = await http.get(url);
      // print(json.decode(response.body));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      print(extractedData);
      final extractedBpi = extractedData["prices"] as List<dynamic>;
      List<PriceDatum> remotePrices = [];
      extractedBpi.forEach((datum) {
        print(DateTime.fromMillisecondsSinceEpoch((datum[0])).toString());
        // print(datum[1]);
        remotePrices.add(PriceDatum(
            DateTime.fromMillisecondsSinceEpoch(datum[0]), datum[1]));
      });
      _prices = remotePrices;
      _timespan = timespan;
      _coin = coin;
      // print(_prices);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
