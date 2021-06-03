import 'package:cointrack/src/blocs/currency_stat_listings_block.dart';
import 'package:cointrack/src/models/api_response.dart';
import 'package:cointrack/src/models/crypto_currency.dart';
import 'package:cointrack/src/models/currency_stat.dart';
import 'package:cointrack/src/ui/components/common_chip.dart';
import 'package:cointrack/src/ui/notifiers/currency_stat_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils.dart';
import 'components/coin_detail_main.dart';
import 'components/currency_selector.dart';
import 'components/stats_list.dart';

class CoinDetail extends StatelessWidget {
  final CryptoCurrency coin;

  CoinDetail({required this.coin});

  @override
  Widget build(BuildContext context) {
    String name = coin.name ?? "";
    String symbol = coin.symbol ?? "";
    int id = coin.id ?? 0;
    num price = coin.quote?.uSD?.price ?? 0;
    num percent24hr = coin.quote?.uSD?.percentChange24h ?? 0;
    Color coinChangeColor = percent24hr > 0 ? UP_COLOR : DOWN_COLOR;
    currencyStatBloc.fetchCurrencyStatListings();

    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Image.network(
            'https://s2.coinmarketcap.com/static/img/coins/64x64/$id.png',
            fit: BoxFit.cover,
          ),
          Text(name),
          CommonChip(symbol: symbol),
          StreamBuilder(
            stream: currencyStatBloc.currencyStatListings,
            builder:
                (context, AsyncSnapshot<ApiResponse<CurrencyStat>> snapshot) {
              if (snapshot.hasData) {
                final data =
                    snapshot.data?.data ?? [CurrencyStat(symbol: 'USD')];
                return CurrencySelector(currencyList: data);
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
          Expanded(
            child: Container(
              child: Flex(
                direction: Axis.horizontal,
                textDirection: TextDirection.rtl,
                children: [
                  Chip(
                    label: Text(percentChangeFormatter(percent24hr)),
                    labelStyle: const TextStyle(fontSize: 12),
                    backgroundColor: coinChangeColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 0.0,
                      horizontal: 10.0,
                    ),
                    child: Text(
                      currencyFormatter.format(price),
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 10.0,
              ),
            ),
          )
        ]),
      ),
      body: Column(
        children: [
          StatsList(coin: coin),
          CoinDetailMain(coin: coin),
        ],
      ),
    );
  }
}
