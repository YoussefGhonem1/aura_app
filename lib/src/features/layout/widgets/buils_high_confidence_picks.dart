import 'package:aura_app/src/features/layout/models/holding_stocks_model.dart';
import 'package:aura_app/src/features/layout/widgets/build_stock_tile.dart';
import 'package:aura_app/src/features/stock_details/models/stock_details_model.dart';
import 'package:aura_app/src/shared/routing/route_strings.dart';
import 'package:flutter/material.dart';

Widget buildHighConfidencePicks(BuildContext context) {
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
              onTap: () {
                final stock = StockModel.dummy(
                  item.symbol,
                  localeCode: Localizations.localeOf(context).toLanguageTag(),
                );

                Navigator.pushNamed(
                  context,
                  Routes.stockDetailsScreen,
                  arguments: stock,
                );
              },
            ),
          ),
        )
        .toList(),
  );
}
