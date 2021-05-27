import 'package:cointrack/src/const.dart';
import 'package:cointrack/src/models/crypto_currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utils.dart';

class StatsList extends StatelessWidget {
  final CryptoCurrency coin;

  const StatsList(this.coin);

  @override
  Widget build(BuildContext context) {
    // TODO: convert to grid if necessary
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        getMarketCapStatsBlock(context, coin),
        getDilutedMarketCapStatsBlock(context, coin),
        getVolumnStatsBlock(context, coin),
        getCirculatingSupplyStatsBlock(context, coin)
      ],
    );
  }
}

Widget getMarketCapStatsBlock(BuildContext context, CryptoCurrency coin) {
  num marketCap = coin.quote?.uSD?.marketCap ?? 0;
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Market Cap",
                style: TextStyle(color: Theme.of(context).primaryColorLight),
              ),
              Tooltip(
                message: MARKET_CAP_TOOLTIP_MESSAGE,
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 2.0,
                    horizontal: 5.0,
                  ),
                  child: Chip(
                    shape: const CircleBorder(),
                    labelPadding: EdgeInsets.all(3.0),
                    label: Text(
                      "i",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
        Text(currencyFormatter.format(marketCap)),
      ],
    ),
  );
}

Widget getDilutedMarketCapStatsBlock(
    BuildContext context, CryptoCurrency coin) {
  num marketCap = coin.quote?.uSD?.marketCap ?? 0;
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Fully Diluted Market Cap",
                style: TextStyle(color: Theme.of(context).primaryColorLight),
              ),
              Tooltip(
                message: MARKET_CAP_TOOLTIP_MESSAGE,
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 2.0,
                    horizontal: 5.0,
                  ),
                  child: Chip(
                    shape: const CircleBorder(),
                    labelPadding: EdgeInsets.all(3.0),
                    label: Text(
                      "i",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
        Text(currencyFormatter.format(marketCap)),
      ],
    ),
  );
}

Widget getVolumnStatsBlock(BuildContext context, CryptoCurrency coin) {
  num marketCap = coin.quote?.uSD?.marketCap ?? 0;
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Market Cap",
                style: TextStyle(color: Theme.of(context).primaryColorLight),
              ),
              Tooltip(
                message: MARKET_CAP_TOOLTIP_MESSAGE,
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 2.0,
                    horizontal: 5.0,
                  ),
                  child: Chip(
                    shape: const CircleBorder(),
                    labelPadding: EdgeInsets.all(3.0),
                    label: Text(
                      "i",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
        Text(currencyFormatter.format(marketCap)),
      ],
    ),
  );
}

Widget getCirculatingSupplyStatsBlock(
    BuildContext context, CryptoCurrency coin) {
  num circulatingSupply = coin.circulatingSupply ?? 0;
  String symbol = coin.symbol ?? "";
  num totalSupply = coin.totalSupply ?? 1.0;
  num? maxSupply = coin.maxSupply;
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Circulating Supply",
              style: TextStyle(color: Theme.of(context).primaryColorLight),
            ),
            InfoToolTip(message: MARKET_CAP_TOOLTIP_MESSAGE),
          ],
        ),
        Row(
          children: [
            Text(coinFormatter(symbol, circulatingSupply)),
            maxSupply != null
                ? Text(percentFormatter(totalSupply / maxSupply * 100))
                : Container(color: Colors.white),
          ],
        ),
        maxSupply != null
            ? LinearProgressIndicator(value: totalSupply / maxSupply)
            : Container(color: Colors.white),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text("Max Supply"),
                InfoToolTip(message: MAX_SUPPLY_TOOLTIP_MESSAGE)
              ],
            ),
            Text(coinFormatter("", maxSupply != null ? maxSupply : 0)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text("Max Supply"),
                new InfoToolTip(message: TOTAL_SUPPLY_TOOLTIP_MESSAGE)
              ],
            ),
            Text(coinFormatter("", totalSupply)),
          ],
        )
      ],
    ),
  );
}

class InfoToolTip extends StatelessWidget {
  String? message;
  InfoToolTip({required this.message});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message ?? "",
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 5.0,
        ),
        child: Chip(
          shape: const CircleBorder(),
          labelPadding: EdgeInsets.all(3.0),
          label: Text(
            "i",
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
    );
  }
}
