import 'package:aura_app/src/features/risk_disclaimer/widgets/build_expansion_tile.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';

class RiskDisclaimerScreen extends StatefulWidget {
  const RiskDisclaimerScreen({super.key});

  @override
  State<RiskDisclaimerScreen> createState() => _RiskDisclaimerScreenState();
}

class _RiskDisclaimerScreenState extends State<RiskDisclaimerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
              ),
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: AppColors.white,
                size: 18,
              ),
            ),
          ),
        ),
        title: Text(
          context.l10n.riskDisclaimer,
          style: const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            headerIcon(),
            const SizedBox(height: 24),
            mainTitle(context),
            const SizedBox(height: 12),
            mainDescription(context),
            const SizedBox(height: 30),
            expansionTiles(context),
            const SizedBox(height: 24),
            acknowledgementCard(context),
            const SizedBox(height: 24),
            understandButton(context),
            const SizedBox(height: 12),
            declineButton(context),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

Widget headerIcon() {
  return Container(
    width: 90,
    height: 90,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: AppColors.surfaceColor,
      border: Border.all(color: AppColors.secondaryColor.withOpacity(0.2)),
      boxShadow: [
        // Outer glow shadow
        BoxShadow(
          color: AppColors.secondaryColor.withOpacity(0.1),
          blurRadius: 15,
        ),
      ],
    ),
    child: const Icon(Icons.shield, color: AppColors.secondaryColor, size: 40),
  );
}

Widget mainTitle(BuildContext context) {
  return Text(
    context.tr('Important Risk Warning', 'تحذير مخاطر مهم'),
    textAlign: TextAlign.center,
    style: const TextStyle(
      color: AppColors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget mainDescription(BuildContext context) {
  return Text(
    context.tr(
      "Please read the following carefully before proceeding with Aura's AI forecasts. Your capital is at risk.",
      'يرجى قراءة ما يلي بعناية قبل متابعة توقعات Aura بالذكاء الاصطناعي. رأس مالك معرض للمخاطر.',
    ),
    textAlign: TextAlign.center,
    style: const TextStyle(color: AppColors.greyText, height: 1.5),
  );
}

Widget expansionTiles(BuildContext context) {
  return Column(
    children: [
      expansionTile(
        icon: Icons.psychology,
        title: context.tr(
          'AI Forecast Limitations',
          'قيود توقعات الذكاء الاصطناعي',
        ),
        content: context.tr(
          'Aura uses advanced artificial intelligence to analyze market trends. However, these forecasts are for educational and informational purposes only. AI predictions are probabilistic and represent hypothetical scenarios, not guarantees of future performance.',
          'يستخدم Aura ذكاءً اصطناعيًا متقدمًا لتحليل اتجاهات السوق. هذه التوقعات لأغراض تعليمية ومعلوماتية فقط، وهي احتمالية وتمثل سيناريوهات افتراضية وليست ضمانًا للأداء المستقبلي.',
        ),
      ),
      const SizedBox(height: 16),
      expansionTile(
        icon: Icons.gavel,
        title: context.tr('No Financial Advice', 'لا توجد نصيحة مالية'),
        content: context.tr(
          'Aura does not provide personalized financial advice. Users should consult with a licensed financial advisor before making investment decisions.',
          'لا يقدم Aura نصائح مالية شخصية. يجب استشارة مستشار مالي مرخص قبل اتخاذ قرارات استثمارية.',
        ),
      ),
      const SizedBox(height: 16),
      expansionTile(
        icon: Icons.trending_down,
        title: context.tr('Capital at Risk', 'رأس المال معرض للمخاطر'),
        content: context.tr(
          'Investing involves risk, including possible loss of principal. Past performance does not guarantee future results.',
          'الاستثمار ينطوي على مخاطر، بما في ذلك احتمال خسارة رأس المال. الأداء السابق لا يضمن النتائج المستقبلية.',
        ),
      ),
    ],
  );
}

Widget acknowledgementCard(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColors.cardColor,
      borderRadius: BorderRadius.circular(14),
    ),
    child: Text(
      context.tr(
        "By tapping 'I Understand' below, you acknowledge that you have read, understood, and agreed to our Terms of Service and Privacy Policy.",
        'بالضغط على "أنا أفهم" أدناه، فإنك تقر بأنك قرأت وفهمت ووافقت على شروط الخدمة وسياسة الخصوصية.',
      ),
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: AppColors.greyText,
        fontSize: 13,
        height: 1.4,
      ),
    ),
  );
}

Widget understandButton(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondaryColor,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      onPressed: () {},
      child: Text(
        context.tr('I Understand', 'أنا أفهم'),
        style: TextStyle(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget declineButton(BuildContext context) {
  return TextButton(
    onPressed: () {},
    child: Text(
      context.tr('Decline', 'رفض'),
      style: const TextStyle(color: AppColors.greyText),
    ),
  );
}
