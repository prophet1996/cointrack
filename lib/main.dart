import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/app.dart';
import 'src/ui/notifiers/currency_stat_notifier.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (create) => CurrencyModel(), child: App()));
}
