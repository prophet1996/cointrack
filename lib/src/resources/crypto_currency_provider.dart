import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';

import '../../secret.dart';
import '../models/crypto_currency.dart';
import '../models/api_response.dart';

class CryptoCurrencyApiProvider {
  Client client = Client();
  Future<ApiResponse<CryptoCurrency>> fetchCryptoListings() async {
    // ignore: avoid_print
    final _apiKey = API_KEY;
    Uri apiUrl = Uri.http(
        "pro-api.coinmarketcap.com", "/v1/cryptocurrency/listings/latest");
    final response =
        await client.get(apiUrl, headers: {'X-CMC_PRO_API_KEY': _apiKey});
    // ignore: avoid_print
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ApiResponse<CryptoCurrency>.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load currency listings');
    }
  }
}
