import 'package:cointrack/src/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StatsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: convert to grid if necessary
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        getMarketCapStatsBlock(context),
        getDilutedMarketCapStatsBlock(context),
        getVolumnStatsBlock(context),
        getCirculatingSupplyStatsBlock(context)
      ],
    );
  }
}

final getMarketCapStatsBlock = (BuildContext context) {
  return Expanded(
    child: Column(
      children: [
        Row(children: [
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
      ],
    ),
  );
};

final getDilutedMarketCapStatsBlock = (BuildContext context) {
  return Expanded(
    child: Column(
      children: [
        Row(children: [
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
      ],
    ),
  );
};

final getVolumnStatsBlock = (BuildContext context) {
  return Expanded(
    child: Column(
      children: [
        Row(children: [
          Text(
            "MarketCap",
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
      ],
    ),
  );
};

final getCirculatingSupplyStatsBlock = (BuildContext context) {
  return Expanded(
    child: Column(
      children: [
        Row(children: [
          Text(
            "MarketCap",
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
      ],
    ),
  );
};
