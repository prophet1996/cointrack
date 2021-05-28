import 'package:flutter/material.dart';

class CommonChip extends StatelessWidget {
  double radius;

  CommonChip({
    Key? key,
    this.symbol = "",
    this.radius = 8.0,
  }) : super(key: key);

  final String symbol;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Chip(
        label: Text(symbol),
        labelStyle: const TextStyle(fontSize: 10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(this.radius))),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
    );
  }
}
