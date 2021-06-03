import 'package:cointrack/src/models/currency_stat.dart';
import 'package:cointrack/src/ui/notifiers/currency_stat_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencySelector extends StatefulWidget {
  List<CurrencyStat> currencyList;
  CurrencySelector({Key? key, required this.currencyList}) : super(key: key);

  @override
  State<CurrencySelector> createState() =>
      _CurrencySelectorState(currencyList: this.currencyList);
}

/// This is the private State class that goes with MyStatefulWidget.
class _CurrencySelectorState extends State<CurrencySelector> {
  String dropdownValue = 'USD';
  List<CurrencyStat> currencyList;
  _CurrencySelectorState({required this.currencyList});
  @override
  Widget build(BuildContext context) {
    return Consumer<CurrencyModel>(
      builder: (context, currency, child) {
        if (currency.currency == null) {
          currency.updateCurrency(currencyList[0]);
        } else {
          dropdownValue = currency.currency?.code ?? "USD";
        }
        return DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue ?? "USD";
              currency.updateCurrency(currencyList
                  .firstWhere((currency) => currency.code == newValue));
            });
          },
          items: currencyList.map<DropdownMenuItem<String>>(
            (CurrencyStat value) {
              String code = value.code ?? "";

              return DropdownMenuItem<String>(
                value: code,
                child: Text(code),
              );
            },
          ).toList(),
        );
      },
    );
  }
}
