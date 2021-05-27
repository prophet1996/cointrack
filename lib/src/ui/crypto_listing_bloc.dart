import 'package:cointrack/src/ui/crypto_list_item.dart';
import 'package:flutter/material.dart';
import '../models/api_response.dart';
import '../models/crypto_currency.dart';
import '../blocs/crypto_curr_listings_bloc.dart';

class CryptoList extends StatelessWidget {
  final Function(CryptoCurrency) onCryptoTapped;

  CryptoList({required this.onCryptoTapped});

  @override
  Widget build(BuildContext context) {
    bloc.fetchCryptoListings();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto'),
      ),
      body: StreamBuilder(
        stream: bloc.cryptoListings,
        builder:
            (context, AsyncSnapshot<ApiResponse<CryptoCurrency>> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot, onCryptoTapped);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ApiResponse<CryptoCurrency>> snapshot,
      Function(CryptoCurrency) onCryptoTapped) {
    List<CryptoCurrency>? data = snapshot.data?.data;
    return GridView.builder(
        itemCount: data?.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          CryptoCurrency? currency = data?[index];
          if (currency != null && currency.name != null) {
            return CryptoListItem(coin: currency, onTap: onCryptoTapped);
          } else {
            return const Text("Cannot Load this coin");
          }
        });
  }
}
