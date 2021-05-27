import 'dart:async';
import 'crypto_currency_provider.dart';
import '../models/api_response.dart';
import '../models/crypto_currency.dart';

class Repository {
  final cryptoCurrencyApiProvider = CryptoCurrencyApiProvider();

  Future<ApiResponse<CryptoCurrency>> fetchCryptoListings() =>
      cryptoCurrencyApiProvider.fetchCryptoListings();
}
