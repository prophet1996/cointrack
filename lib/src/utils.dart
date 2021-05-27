import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

var currencyFormatter =
    NumberFormat.currency(name: "en_US", symbol: r'$', locale: 'en');

var coinFormatter = (symbol, val) =>
    "${NumberFormat.currency(symbol: "", locale: "en_US").format(val)} $symbol";

var percentChangeFormatter = (num val) {
  final symbol = val < 0 ? '▼' : '▲';
  return '$symbol${val.toStringAsFixed(2)}%';
};

var percentFormatter = (num val) {
  return '${val.toStringAsFixed(2)}%';
};

const UP_COLOR = Color.fromARGB(255, 22, 199, 132);
const DOWN_COLOR = Color.fromARGB(255, 234, 57, 67);
