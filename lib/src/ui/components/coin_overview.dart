import 'package:cointrack/src/models/crypto_currency.dart';
import 'package:flutter/cupertino.dart';

class CoinOverview extends StatelessWidget {
  final CryptoCurrency coin;

  const CoinOverview({Key? key, required this.coin}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CoinOverviewDetails(coin: coin),
        CoinOverviewStats(coin: coin)
      ],
    );
  }
}

class CoinOverviewDetails extends StatelessWidget {
  final CryptoCurrency coin;

  const CoinOverviewDetails({Key? key, required this.coin}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final String coinName = coin.name ?? "";

    return Column(children: [Text("$coinName")]);
  }
}

class CoinOverviewStats extends StatelessWidget {
  final CryptoCurrency coin;

  const CoinOverviewStats({Key? key, required this.coin}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final String coinName = coin.name ?? "";

    return Column(children: [Text("$coinName")]);
  }
}
