import 'package:cointrack/src/models/currency_stat.dart';
import 'package:flutter/foundation.dart';

class CurrencyModel extends ChangeNotifier {
  CurrencyStat? _currency;
  List<CurrencyStat>? _currencyList;
  void updateCurrency(CurrencyStat currencyStat) {
    _currency = currencyStat;
  }

  void saveCurrencyList(List<CurrencyStat> newCurrencyList) {
    _currencyList = newCurrencyList;
  }

  CurrencyStat? get currency => _currency;
  List<CurrencyStat>? get currencyList => _currencyList;
}
