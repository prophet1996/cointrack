import 'package:cointrack/src/models/currency_stat.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/api_response.dart';

class CryptoListingBloc {
  final _repository = Repository();
  final _cryptoListingsFetcher = PublishSubject<ApiResponse<CurrencyStat>>();

  Stream<ApiResponse<CurrencyStat>> get currencyStatListings =>
      _cryptoListingsFetcher.stream;

  fetchCurrencyStatListings() async {
    ApiResponse<CurrencyStat> itemModel = await _repository.fetchCurrencyStat();
    _cryptoListingsFetcher.sink.add(itemModel);
  }

  dispose() {
    _cryptoListingsFetcher.close();
  }
}

final currencyStatBloc = CryptoListingBloc();
