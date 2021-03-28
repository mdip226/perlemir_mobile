import 'package:flutter/material.dart';
import 'package:perlemir_mobile/models/DCABot.dart';

class BotForm extends StatefulWidget {
  // final void Function(
  //   String id,
  //   String name,
  //   Currency currency,
  //   double amount,
  //   Freq frequency,
  // ) submitFn;
  BotForm();
  @override
  _BotFormState createState() => _BotFormState();
}

class _BotFormState extends State<BotForm> {
  final _formKey = GlobalKey<FormState>();
  String _name;
  Currency _currency;
  double _amount;
  Freq _frequency;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  key: ValueKey("Name"),
                  decoration: InputDecoration(labelText: "Name"),
                  onSaved: (value) {
                    _name = value;
                  },
                ),
                TextFormField(
                  key: ValueKey("Amount"),
                  decoration: InputDecoration(
                    labelText: "Amount",
                    prefix: Text("USD "),
                  ),
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    _amount = double.tryParse(value);
                  },
                ),
                DropdownButtonFormField(
                  key: ValueKey("Currency"),
                  decoration: InputDecoration(labelText: "Currency"),
                  items: [
                    DropdownMenuItem<Currency>(
                      child: Text("BTC"),
                      value: Currency.BTC,
                    ),
                    DropdownMenuItem<Currency>(
                      child: Text("ETH"),
                      value: Currency.ETH,
                    ),
                  ],
                  onChanged: (value) {
                    _currency = value;
                  },
                ),
                DropdownButtonFormField(
                  key: ValueKey("Frequency"),
                  decoration: InputDecoration(labelText: "Frequency"),
                  items: [
                    DropdownMenuItem<Freq>(
                      child: Text("Per Hour"),
                      value: Freq.perHour,
                    ),
                    DropdownMenuItem<Freq>(
                      child: Text("Per Day"),
                      value: Freq.perDay,
                    ),
                    DropdownMenuItem<Freq>(
                      child: Text("Per Week"),
                      value: Freq.perWeek,
                    ),
                    DropdownMenuItem<Freq>(
                      child: Text("Per Month"),
                      value: Freq.perMonth,
                    ),
                  ],
                  // hint: Text("Choose a frequency"),
                  onChanged: (value) {
                    _frequency = value;
                  },
                )
              ],
            )),
      ),
    );
  }
}
