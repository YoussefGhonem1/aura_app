import 'package:aura_app/src/features/layout/models/ai_signals_model.dart';
import 'package:aura_app/src/features/layout/widgets/build_hot_ai_signal_card.dart';
import 'package:flutter/material.dart';

Widget buildQuickPicks() {
  return SizedBox(
    height: 140,
    child: GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 12, 
        crossAxisSpacing: 0,
        childAspectRatio: 0.7, 
      ),
      itemCount: stockPicks.length,
      itemBuilder: (context, index) {
        final pick = stockPicks[index];
        return smallPick(
          pick.symbol,
          pick.company,
          pick.signal,
          pick.peRatio,
          pick.upside,
        );
      },
    ),
  );
}
