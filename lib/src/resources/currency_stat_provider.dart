import 'package:cointrack/src/models/api_response.dart';
import 'package:cointrack/src/models/currency_stat.dart';

import 'package:http/http.dart' show Client;
import 'dart:convert';

class CurrencyStatApiProvider {
  Client client = Client();
  ApiResponse<CurrencyStat>? _currencyStat;
  Future<ApiResponse<CurrencyStat>> fetchCurrencyStat() async {
    if (_currencyStat == null) {
      Uri apiUrl = Uri.http("jsonkeeper.com", "/b/FVBL");
      final response = await client.get(
        apiUrl,
      );

      if (response.statusCode == 200) {
        _currencyStat =
            ApiResponse<CurrencyStat>.fromJson(json.decode(response.body));
        return _currencyStat!;
      } else {
        throw Exception("Failed to load currency listings");
      }
    } else {
      return _currencyStat!;
    }
  }
}
