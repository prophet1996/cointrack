import 'package:cointrack/src/models/crypto_currency.dart';
import 'package:cointrack/src/ui/coin_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'ui/crypto_listing_bloc.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _App();
}

class _App extends State<App> {
  String _route = '/';
  CryptoCurrency? _coin;
  @override
  Widget build(BuildContext context) {
    final onCryptoTapped = (CryptoCurrency coin) {
      setState(() {
        _route = 'coin';
        _coin = coin;
      });
    };
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        //TODO: Check contrast here
        primaryColorLight: Colors.grey[350],
      ),
      home: Navigator(
        pages: [
          MaterialPage(
            key: const ValueKey('/'),
            child: CryptoList(onCryptoTapped: onCryptoTapped),
          ),
          if (_route != '/')
            MaterialPage(
              key: const ValueKey('coin'),
              child: CoinDetail(coin: _coin!),
            ),
        ],
        onPopPage: (route, result) {
          setState(() {
            _route = '/';
          });
          return route.didPop(result);
        },
      ),
    );
  }
}
