import 'package:cointrack/src/models/crypto_currency.dart';
import 'package:cointrack/src/models/currency_stat.dart';
import 'package:cointrack/src/ui/notifiers/currency_stat_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

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

    return Column(children: [CoinConverter(coin: coin)]);
  }
}

class CoinConverter extends StatefulWidget {
  final CryptoCurrency coin;

  const CoinConverter({Key? key, required this.coin}) : super(key: key);

  State<StatefulWidget> createState() => _CoinCoverter(coin: coin);
}

class _CoinCoverter extends State<CoinConverter> {
  final CryptoCurrency coin;

  handleChangeValue(String text, bool currency) {
    final value = double.tryParse(text);
    if (value == null) {
      cryptoCurrencyController.text = "";
      currencyController.text = "";
      return;
    }
    if (currency) {
      cryptoCurrencyController.text = "${value * 2}";
    } else {
      currencyController.text = "${value / 2}";
    }
  }

  _CoinCoverter({required this.coin});
  final cryptoCurrencyController = TextEditingController();
  final currencyController = TextEditingController();

  @override
  void dispose() {
    currencyController.dispose();
    cryptoCurrencyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          getCoinConverterBox(
              coin, false, handleChangeValue, cryptoCurrencyController),
          getCoinConverterBox(
              null, true, handleChangeValue, currencyController),
        ],
      ),
    );
  }

  Widget getCoinConverterBox(CryptoCurrency? coin, bool currency,
      Function changeHandler, TextEditingController currencyController) {
    return Consumer<CurrencyModel>(builder: (context, currencyStat, child) {
      var image;
      final currencyCode = currencyStat.currency?.code ?? "USD";
      var name = coin?.name ?? "";
      var symbol = coin?.symbol ?? "";
      var id = coin?.id ?? "";

      if (currency) {
        image = SvgPicture.network(
          'https://s2.coinmarketcap.com/static/cloud/img/fiat-flags/$currencyCode.svg',
        );
        name = currencyStat.currency?.name ?? "";
        symbol = currencyStat.currency?.code ?? "";
      } else if (coin != null) {
        image = Image.network(
          'https://s2.coinmarketcap.com/static/img/coins/64x64/$id.png',
        );
      }
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(100.0),
                ),
              ),
              height: 32.0,
              width: 32.0,
              child: image,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              child: Column(
                children: [
                  Text(symbol),
                  Text(name),
                ],
              ),
            ),
            SizedBox(
              height: 50.0,
              width: 50.0,
              child: TextField(
                textAlign: TextAlign.end,
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  print('First text field: $text');
                  changeHandler(text, currency);
                },
                controller: currencyController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                ].toList(),
              ),
            )
          ],
        ),
      );
    });
  }
}
