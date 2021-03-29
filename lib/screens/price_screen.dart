import 'package:flutter/material.dart';
import 'package:perlemir_mobile/providers/bitcoin_price.dart';
import 'package:perlemir_mobile/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

class PriceScreen extends StatefulWidget {
  static const routeName = '/price-screen';

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<BitcoinPrice>(context).fetchAndSetPrices();
      _isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Live Pricing"),
      ),
      drawer: AppDrawer(),
    );
  }
}
