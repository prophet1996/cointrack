import 'dart:async';
import 'package:cointrack/src/models/currency_stat.dart';
import 'package:cointrack/src/resources/currency_stat_provider.dart';

import 'crypto_currency_provider.dart';
import '../models/api_response.dart';
import '../models/crypto_currency.dart';

class Repository {
  final cryptoCurrencyApiProvider = CryptoCurrencyApiProvider();
  final currencyStateApiProvider = CurrencyStatApiProvider();
  Future<ApiResponse<CryptoCurrency>> fetchCryptoListings() =>
      cryptoCurrencyApiProvider.fetchCryptoListings();
  Future<ApiResponse<CurrencyStat>> fetchCurrencyStat() =>
      currencyStateApiProvider.fetchCurrencyStat();
}
