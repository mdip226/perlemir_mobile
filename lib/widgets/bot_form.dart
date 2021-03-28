import 'package:flutter/material.dart';
import 'package:perlemir_mobile/models/DCABot.dart';
import 'package:perlemir_mobile/providers/bots.dart';
import 'package:provider/provider.dart';

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

  void _addBot() {
    print(_name);
    print(_currency);
    print(_amount);
    print(_frequency);
    if (_name == null ||
        _currency == null ||
        _amount == null ||
        _frequency == null) return;
    Provider.of<Bots>(context, listen: false)
        .addDCABot(_name, _currency, _amount, _frequency);
    Navigator.of(context).pop();
  }

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
                onChanged: (value) {
                  _name = value;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                key: ValueKey("Amount"),
                decoration: InputDecoration(
                  labelText: "Amount",
                  prefix: Text("USD "),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _amount = double.tryParse(value);
                },
              ),
              SizedBox(
                height: 10,
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
              SizedBox(
                height: 10,
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
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: _addBot,
                      child: Row(
                        children: [
                          Text("Save Bot")
                          // Icon(Icons.save),
                        ],
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
