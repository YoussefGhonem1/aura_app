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
            _sectionTitle(context.tr('Risk Tolerance', 'تحمل المخاطر')),
            _sectionSubtitle(
              context.tr(
                'What is your risk appetite?',
                'ما مستوى تقبلك للمخاطرة؟',
              ),
            ),
            const SizedBox(height: 16),
            _riskSelector(context),

            const SizedBox(height: 32),
            _sectionTitle(context.tr('Market Interests', 'اهتمامات السوق')),
            _sectionSubtitle(
              context.tr(
                'Select sectors for Aura to prioritize.',
                'اختر القطاعات التي تريد أن يركز عليها Aura.',
              ),
            ),
            const SizedBox(height: 16),
            _marketChips(context),

            const SizedBox(height: 32),
            _sectionTitle(context.tr('Primary Goal', 'الهدف الأساسي')),
            _sectionSubtitle(
              context.tr('What is your main objective?', 'ما هو هدفك الرئيسي؟'),
            ),
            const SizedBox(height: 16),
            _goalItem(
              context: context,
              title: 'Growth',
              description: context.tr(
                'Maximizing capital appreciation over time.',
                'تعظيم نمو رأس المال على المدى الطويل.',
              ),
            ),
            const SizedBox(height: 12),
            _goalItem(
              context: context,
              title: 'Dividends',
              description: context.tr(
                'Generating steady passive income.',
                'تحقيق دخل ثابت ومنتظم.',
              ),
            ),
            const SizedBox(height: 12),
            _goalItem(
              context: context,
              title: 'Capital Preservation',
              description: context.tr(
                'Protecting current assets with minimal risk.',
                'حماية الأصول الحالية بأقل قدر من المخاطرة.',
              ),
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
              context.tr(
                text,
                {'Low': 'منخفض', 'Medium': 'متوسط', 'High': 'مرتفع'}[text] ??
                    text,
              ),
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
              context.tr(
                e,
                {
                      'Technology': 'التقنية',
                      'Green Energy': 'الطاقة الخضراء',
                      'Crypto': 'العملات الرقمية',
                      'Healthcare': 'الرعاية الصحية',
                      'Real Estate': 'العقارات',
                      'Consumer Goods': 'السلع الاستهلاكية',
                    }[e] ??
                    e,
              ),
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
                    context.tr(
                      title,
                      {
                            'Growth': 'النمو',
                            'Dividends': 'توزيعات الأرباح',
                            'Capital Preservation': 'الحفاظ على رأس المال',
                          }[title] ??
                          title,
                    ),
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
