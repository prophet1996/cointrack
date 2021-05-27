import 'package:cointrack/src/models/crypto_currency.dart';
import 'package:flutter/material.dart';

/// A ListItem that contains data to display a heading.
class CryptoListItem extends StatelessWidget {
  CryptoCurrency coin;
  final Function(CryptoCurrency) onTap;
  // TODO: add list key here
  CryptoListItem({required this.coin, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var name = "";
    var symbol = "";
    var id = 0;
    if (coin != null) {
      name = coin.name!;
      symbol = coin.symbol!;
      id = coin.id!;
    }
    return Card(
      child: InkWell(
        onTap: () => onTap(coin),
        child: Column(
          children: [
            Text(
              "$name ($symbol)",
              style: Theme.of(context).textTheme.headline5,
            ),
            Image.network(
              'https://s2.coinmarketcap.com/static/img/coins/64x64/$id.png',
              fit: BoxFit.scaleDown,
            ),
          ],
        ),
      ),
    );
  }
}
