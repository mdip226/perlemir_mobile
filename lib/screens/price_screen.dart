import 'package:flutter/material.dart';
import 'package:perlemir_mobile/providers/coin_price.dart';
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
      Provider.of<CoinPrice>(context)
          .fetchAndSetPrices(Provider.of<CoinPrice>(context).timespan,
              Provider.of<CoinPrice>(context).coin)
          .then((value) => _isInit = false);
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final _data = Provider.of<CoinPrice>(context).getPrices;
    final _span = Provider.of<CoinPrice>(context).timespan;
    final _coin = Provider.of<CoinPrice>(context).coin;
    return Scaffold(
      appBar: AppBar(
        title: Text("Live Pricing"),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          ButtonBar(
            buttonPadding: EdgeInsets.symmetric(horizontal: 2),
            alignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Provider.of<CoinPrice>(context, listen: false)
                      .fetchAndSetPrices(
                    "max",
                    _coin,
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: _span == "max"
                      ? BoxDecoration(
                          border: Border.all(
                            width: 2.1,
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                        )
                      : null,
                  child: Text(
                    "MAX",
                    style: TextStyle(
                      fontSize: 18,
                      color: _span == "max"
                          ? Theme.of(context).primaryColor
                          : Colors.black,
                      fontWeight:
                          _span == "max" ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<CoinPrice>(context, listen: false)
                      .fetchAndSetPrices(
                    "${365 * 2}",
                    _coin,
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: _span == "${365 * 2}"
                      ? BoxDecoration(
                          border: Border.all(
                            width: 2.1,
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                        )
                      : null,
                  child: Text(
                    "2Y",
                    style: TextStyle(
                      fontSize: 18,
                      color: _span == "${365 * 2}"
                          ? Theme.of(context).primaryColor
                          : Colors.black,
                      fontWeight: _span == "${365 * 2}"
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<CoinPrice>(context, listen: false)
                      .fetchAndSetPrices(
                    "365",
                    _coin,
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: _span == "365"
                      ? BoxDecoration(
                          border: Border.all(
                            width: 2.1,
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                        )
                      : null,
                  child: Text(
                    "1Y",
                    style: TextStyle(
                      fontSize: 18,
                      color: _span == "365"
                          ? Theme.of(context).primaryColor
                          : Colors.black,
                      fontWeight:
                          _span == "365" ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<CoinPrice>(context, listen: false)
                      .fetchAndSetPrices(
                    "90",
                    _coin,
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: _span == "90"
                      ? BoxDecoration(
                          border: Border.all(
                            width: 2.1,
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                        )
                      : null,
                  child: Text(
                    "90D",
                    style: TextStyle(
                      fontSize: 18,
                      color: _span == "90"
                          ? Theme.of(context).primaryColor
                          : Colors.black,
                      fontWeight:
                          _span == "90" ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<CoinPrice>(context, listen: false)
                      .fetchAndSetPrices(
                    "30",
                    _coin,
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: _span == "30"
                      ? BoxDecoration(
                          border: Border.all(
                            width: 2.1,
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                        )
                      : null,
                  child: Text(
                    "30D",
                    style: TextStyle(
                      color: _span == "30"
                          ? Theme.of(context).primaryColor
                          : Colors.black,
                      fontSize: 18,
                      fontWeight:
                          _span == "30" ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<CoinPrice>(context, listen: false)
                      .fetchAndSetPrices(
                    "1",
                    _coin,
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: _span == "1"
                      ? BoxDecoration(
                          border: Border.all(
                            width: 2.1,
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                        )
                      : null,
                  child: Text(
                    "1D",
                    style: TextStyle(
                      color: _span == "1"
                          ? Theme.of(context).primaryColor
                          : Colors.black,
                      fontSize: 18,
                      fontWeight:
                          _span == "1" ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
              DropdownButton(
                items: [
                  DropdownMenuItem(
                    child: Text("helo"),
                  )
                ],
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
