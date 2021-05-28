import 'package:cointrack/src/models/crypto_currency.dart';
import 'package:cointrack/src/ui/components/coin_overview.dart';
import 'package:cointrack/src/ui/components/common_chip.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class CoinDetailMain extends StatefulWidget {
  final CryptoCurrency coin;

  const CoinDetailMain({Key? key, required this.coin}) : super(key: key);

  @override
  State<CoinDetailMain> createState() => _CoinDetailMainState(coin: coin);
}

class _CoinDetailMainState extends State<CoinDetailMain> {
  int _openWidgetIndex = 0;
  final CryptoCurrency coin;

  _CoinDetailMainState({required this.coin});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: getNavLabels(context),
        ),
        IndexedStack(
          index: _openWidgetIndex,
          children: [
            CoinOverview(coin: coin),
            Text("2"),
            Text("3"),
            Text("5"),
            Text("6"),
            Text("7"),
            Text("8"),
            Text("9"),
            Text("10"),
          ],
        )
      ],
    );
  }

  List<Widget> getNavLabels(BuildContext context) {
    return coinDetailNavLabels.asMap().entries.map((entry) {
      final label = entry.value;
      final idx = entry.key;
      return Container(
        margin: EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ButtonStyle(backgroundColor:
              MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
            var color = Theme.of(context).primaryColorDark;
            if (_openWidgetIndex == idx) {
              color =
                  Theme.of(context).buttonTheme.colorScheme?.primary ?? color;
            }
            return color;
          })),
          child: Text(label),
          onPressed: () {
            setState(() {
              _openWidgetIndex = idx;
            });
          },
        ),
      );
    }).toList();
  }
}
