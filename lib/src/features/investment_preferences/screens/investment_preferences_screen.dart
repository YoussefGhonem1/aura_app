import 'package:aura_app/src/features/investment_preferences/widgets/build_update_botton.dart';
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
  String _risk = "Medium";
  final Set<String> _markets = {"Technology", "Crypto"};
  String _goal = "Growth";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Investment Preferences"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle("Risk Tolerance"),
            _sectionSubtitle("What is your risk appetite?"),
            const SizedBox(height: 16),
            _riskSelector(),

            const SizedBox(height: 32),
            _sectionTitle("Market Interests"),
            _sectionSubtitle("Select sectors for Aura to prioritize."),
            const SizedBox(height: 16),
            _marketChips(),

            const SizedBox(height: 32),
            _sectionTitle("Primary Goal"),
            _sectionSubtitle("What is your main objective?"),
            const SizedBox(height: 16),
            _goalItem(
              title: "Growth",
              description: "Maximizing capital appreciation over time.",
            ),
            const SizedBox(height: 12),
            _goalItem(
              title: "Dividends",
              description: "Generating steady passive income.",
            ),
            const SizedBox(height: 12),
            _goalItem(
              title: "Capital Preservation",
              description: "Protecting current assets with minimal risk.",
            ),
          ],
        ),
      ),
      bottomNavigationBar: updateButton(),
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

  Widget _riskSelector() {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: ["Low", "Medium", "High"].map((e) {
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
              text,
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

  Widget _marketChips() {
    final items = [
      "Technology",
      "Green Energy",
      "Crypto",
      "Healthcare",
      "Real Estate",
      "Consumer Goods",
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
              e,
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

  Widget _goalItem({required String title, required String description}) {
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
                    title,
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
}
