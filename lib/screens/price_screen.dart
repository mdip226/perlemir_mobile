import 'package:flutter/material.dart';
import 'package:perlemir_mobile/providers/bitcoin_price.dart';
import 'package:perlemir_mobile/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
      Provider.of<BitcoinPrice>(context)
          .fetchAndSetPrices(Provider.of<BitcoinPrice>(context).timespan)
          .then((value) => _isInit = false);
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final _data = Provider.of<BitcoinPrice>(context).getPrices;
    return Scaffold(
      appBar: AppBar(
        title: Text("Live Pricing"),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Provider.of<BitcoinPrice>(context, listen: false)
                      .fetchAndSetPrices("1");
                },
                child: Text(
                  "1D",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<BitcoinPrice>(context, listen: false)
                      .fetchAndSetPrices("30");
                },
                child: Text(
                  "30D",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<BitcoinPrice>(context, listen: false)
                      .fetchAndSetPrices("90");
                },
                child: Text(
                  "90D",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<BitcoinPrice>(context, listen: false)
                      .fetchAndSetPrices("365");
                },
                child: Text(
                  "1Y",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<BitcoinPrice>(context, listen: false)
                      .fetchAndSetPrices("${365 * 2}");
                },
                child: Text(
                  "2Y",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<BitcoinPrice>(context, listen: false)
                      .fetchAndSetPrices("max");
                },
                child: Text(
                  "MAX",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          Container(
            child: SfCartesianChart(
              primaryXAxis: DateTimeAxis(),
              primaryYAxis: NumericAxis(),
              series: <ChartSeries>[
                LineSeries<PriceDatum, DateTime>(
                  dataSource: _data,
                  xValueMapper: (datum, _) => datum.date,
                  yValueMapper: (datum, _) => datum.price,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
