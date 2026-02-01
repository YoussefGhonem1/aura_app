import 'package:aura_app/src/features/risk_disclaimer/widgets/build_expansion_tile.dart';
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
        title: const Text(
          "Risk Disclaimer",
          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            headerIcon(),
            const SizedBox(height: 24),
            mainTitle(),
            const SizedBox(height: 12),
            mainDescription(),
            const SizedBox(height: 30),
            expansionTiles(),
            const SizedBox(height: 24),
            acknowledgementCard(),
            const SizedBox(height: 24),
            understandButton(),
            const SizedBox(height: 12),
            declineButton(),
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

Widget mainTitle() {
  return const Text(
    "Important Risk Warning",
    textAlign: TextAlign.center,
    style: TextStyle(
      color: AppColors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget mainDescription() {
  return const Text(
    "Please read the following carefully before proceeding with Aura's AI forecasts. Your capital is at risk.",
    textAlign: TextAlign.center,
    style: TextStyle(color: AppColors.greyText, height: 1.5),
  );
}

Widget expansionTiles() {
  return Column(
    children: [
      expansionTile(
        icon: Icons.psychology,
        title: "AI Forecast Limitations",
        content:
            "Aura uses advanced artificial intelligence to analyze market trends. However, these forecasts are for educational and informational purposes only. AI predictions are probabilistic and represent hypothetical scenarios, not guarantees of future performance.",
      ),
      const SizedBox(height: 16),
      expansionTile(
        icon: Icons.gavel,
        title: "No Financial Advice",
        content:
            "Aura does not provide personalized financial advice. Users should consult with a licensed financial advisor before making investment decisions.",
      ),
      const SizedBox(height: 16),
      expansionTile(
        icon: Icons.trending_down,
        title: "Capital at Risk",
        content:
            "Investing involves risk, including possible loss of principal. Past performance does not guarantee future results.",
      ),
    ],
  );
}

Widget acknowledgementCard() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColors.cardColor,
      borderRadius: BorderRadius.circular(14),
    ),
    child: const Text(
      "By tapping 'I Understand' below, you acknowledge that you have read, understood, and agreed to our Terms of Service and Privacy Policy.",
      textAlign: TextAlign.center,
      style: TextStyle(color: AppColors.greyText, fontSize: 13, height: 1.4),
    ),
  );
}

Widget understandButton() {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondaryColor,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      onPressed: () {},
      child: const Text(
        "I Understand",
        style: TextStyle(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget declineButton() {
  return TextButton(
    onPressed: () {},
    child: const Text("Decline", style: TextStyle(color: AppColors.greyText)),
  );
}
