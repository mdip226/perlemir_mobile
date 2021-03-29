import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class BitcoinPrice with ChangeNotifier {
  final _prices = [];
  Future<List> fetchAndSetPrices() async {
    try {
      //you can provide start and end parameters here
      final url =
          Uri.parse('https://api.coindesk.com/v1/bpi/historical/close.json');
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      print(extractedData);
    } catch (e) {
      print(e);
    }
  }
}
