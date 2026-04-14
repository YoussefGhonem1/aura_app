import 'package:aura_app/src/features/layout/widgets/build_asset_allocation_card.dart';
import 'package:aura_app/src/features/layout/widgets/build_aura_insight_card_portfolio.dart';
import 'package:aura_app/src/features/layout/widgets/build_header_portfolio.dart';
import 'package:aura_app/src/features/layout/widgets/build_holding_list_portfolio.dart';
import 'package:aura_app/src/features/layout/widgets/build_section_title.dart';
import 'package:aura_app/src/features/layout/widgets/build_total_net_card.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              buildHeaderPortfolio(context),
              const SizedBox(height: 24),
              buildTotalNetWorthCard(context),
              const SizedBox(height: 24),
              buildAuraInsightCard(context),
              const SizedBox(height: 32),
              buildAssetAllocationChart(context),
              const SizedBox(height: 32),
              buildSectionTitle(context, context.l10n.currentHoldings),
              const SizedBox(height: 10),
              buildHoldingsList(context),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
