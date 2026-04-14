import 'package:aura_app/src/features/investment_preferences/widgets/build_update_botton.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/features/smart_automation/widgets/build_appbar.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class InvestmentPreferencesScreen extends StatefulWidget {
  const InvestmentPreferencesScreen({super.key});

  @override
  State<InvestmentPreferencesScreen> createState() =>
      _InvestmentPreferencesScreenState();
}

class _InvestmentPreferencesScreenState
    extends State<InvestmentPreferencesScreen> {
  String _risk = 'Medium';
  final Set<String> _markets = {'Technology', 'Crypto'};
  String _goal = 'Growth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, context.l10n.investmentPreferences),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle(context.l10n.riskTolerance),
            _sectionSubtitle(context.l10n.whatIsYourRiskAppetite),
            const SizedBox(height: 16),
            _riskSelector(context),

            const SizedBox(height: 32),
            _sectionTitle(context.l10n.marketInterests),
            _sectionSubtitle(context.l10n.selectSectorsForAuraToPrioritize),
            const SizedBox(height: 16),
            _marketChips(context),

            const SizedBox(height: 32),
            _sectionTitle(context.l10n.primaryGoal),
            _sectionSubtitle(context.l10n.whatIsYourMainObjective),
            const SizedBox(height: 16),
            _goalItem(
              context: context,
              title: 'Growth',
              description: context.l10n.maximizingCapitalAppreciationOverTime,
            ),
            const SizedBox(height: 12),
            _goalItem(
              context: context,
              title: 'Dividends',
              description: context.l10n.generatingSteadyPassiveIncome,
            ),
            const SizedBox(height: 12),
            _goalItem(
              context: context,
              title: 'Capital Preservation',
              description: context.l10n.protectingCurrentAssetsWithMinimalRisk,
            ),
          ],
        ),
      ),
      bottomNavigationBar: updateButton(context),
    );
  }

  Widget _sectionTitle(String text) => Text(
    text,
    style: const TextStyle(
      color: AppColors.white,
      fontSize: 17,
      fontWeight: FontWeight.bold,
    ),
  );

  Widget _sectionSubtitle(String text) => Padding(
    padding: const EdgeInsets.only(top: 6),
    child: Text(
      text,
      style: const TextStyle(color: AppColors.greyText, fontSize: 13),
    ),
  );

  Widget _riskSelector(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: ['Low', 'Medium', 'High'].map((e) {
          return _riskItem(e);
        }).toList(),
      ),
    );
  }

  Widget _riskItem(String text) {
    final selected = _risk == text;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _risk = text),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: selected ? AppColors.secondaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              _localizedRiskOption(text),
              style: TextStyle(
                color: selected ? AppColors.primaryColor : AppColors.greyText,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _marketChips(BuildContext context) {
    final items = [
      'Technology',
      'Green Energy',
      'Crypto',
      'Healthcare',
      'Real Estate',
      'Consumer Goods',
    ];

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: items.map((e) {
        final selected = _markets.contains(e);
        return GestureDetector(
          onTap: () {
            setState(() {
              selected ? _markets.remove(e) : _markets.add(e);
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: selected ? AppColors.secondaryColor : AppColors.cardColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              _localizedMarketItem(context, e),
              style: TextStyle(
                color: selected ? AppColors.primaryColor : AppColors.white,
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _goalItem({
    required BuildContext context,
    required String title,
    required String description,
  }) {
    final selected = _goal == title;

    return GestureDetector(
      onTap: () => setState(() => _goal = title),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? AppColors.secondaryColor : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _localizedGoalTitle(context, title),
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      color: AppColors.greyText,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected
                      ? AppColors.secondaryColor
                      : AppColors.greyText,
                  width: 2,
                ),
              ),
              child: selected
                  ? Center(
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppColors.secondaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  String _localizedRiskOption(String value) {
    switch (value) {
      case 'Low':
        return context.l10n.riskOptionLow;
      case 'Medium':
        return context.l10n.riskOptionMedium;
      case 'High':
        return context.l10n.riskOptionHigh;
      default:
        return value;
    }
  }

  String _localizedMarketItem(BuildContext context, String value) {
    switch (value) {
      case 'Technology':
        return context.l10n.marketTechnology;
      case 'Green Energy':
        return context.l10n.marketGreenEnergy;
      case 'Crypto':
        return context.l10n.crypto;
      case 'Healthcare':
        return context.l10n.marketHealthcare;
      case 'Real Estate':
        return context.l10n.marketRealEstate;
      case 'Consumer Goods':
        return context.l10n.marketConsumerGoods;
      default:
        return value;
    }
  }

  String _localizedGoalTitle(BuildContext context, String value) {
    switch (value) {
      case 'Growth':
        return context.l10n.goalGrowth;
      case 'Dividends':
        return context.l10n.goalDividends;
      case 'Capital Preservation':
        return context.l10n.goalCapitalPreservation;
      default:
        return value;
    }
  }
}
