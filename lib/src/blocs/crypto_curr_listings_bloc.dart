import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/crypto_currency.dart';
import '../models/api_response.dart';

class CryptoListingBloc {
  final _repository = Repository();
  final _cryptoListingsFetcher = PublishSubject<ApiResponse<CryptoCurrency>>();

  Stream<ApiResponse<CryptoCurrency>> get cryptoListings =>
      _cryptoListingsFetcher.stream;

  fetchCryptoListings() async {
    ApiResponse<CryptoCurrency> itemModel =
        await _repository.fetchCryptoListings();
    _cryptoListingsFetcher.sink.add(itemModel);
  }

  dispose() {
    _cryptoListingsFetcher.close();
  }
}

final bloc = CryptoListingBloc();
