import 'package:aura_app/src/features/layout/models/holding_stocks_model.dart';
import 'package:aura_app/src/features/layout/widgets/build_stock_tile.dart';
import 'package:flutter/material.dart';

Widget buildHighConfidencePicks() {
  return Column(
    children: topAIPicks
        .take(2)
        .map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: buildStockTile(
              item.symbol,
              item.name,
              item.price,
              item.change,
              item.color,
              chartData: item.chartData,
              onTap: () {},
            ),
          ),
        )
        .toList(),
  );
}
