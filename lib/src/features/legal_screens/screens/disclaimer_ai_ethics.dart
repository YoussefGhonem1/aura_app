import 'package:aura_app/src/features/smart_automation/widgets/build_appbar.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class DisclaimerScreenEnhanced extends StatelessWidget {
  const DisclaimerScreenEnhanced({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: buildAppBar(context, "Disclaimer & AI Ethics"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Warning Icon at Top
            Center(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.orange.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: const Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.orange,
                  size: 32,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // NOT FINANCIAL ADVICE Section with Card
            _buildSectionCard(
              title: "NOT FINANCIAL ADVICE",
              icon: Icons.account_balance_wallet_rounded,
              iconColor: Colors.orange,
              children: [
                const Text(
                  "Aura AI provides market analysis for educational purposes only. Our forecasts are probabilistic models based on historical patterns, not guarantees of future performance.",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // AI Limitations Section with Card
            _buildSectionCard(
              title: "AI Limitations",
              icon: Icons.psychology_rounded,
              iconColor: AppColors.secondaryColor,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      height: 1.6,
                    ),
                    children: [
                      const TextSpan(
                        text:
                            "Our AI models are trained on vast datasets of historical market data. However, past performance is not indicative of future results.\n\n",
                      ),
                      TextSpan(
                        text:
                            "The AI may encounter \"edge cases,\" high volatility scenarios, or unprecedented global events (black swan events) that it has not been trained on.",
                        style: TextStyle(
                          color: Colors.orange.withOpacity(0.9),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const TextSpan(
                        text:
                            " In these instances, predictions may be significantly less accurate or fail to capture the full scope of market risk.",
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // User Responsibility Section with Card
            _buildSectionCard(
              title: "User Responsibility",
              icon: Icons.person_rounded,
              iconColor: Colors.blue,
              children: [
                const Text(
                  "Aura AI is a technology provider, not a registered investment advisor or broker-dealer.",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 16),
                _buildResponsibilityBullet(
                  icon: Icons.assignment_turned_in_rounded,
                  text:
                      "You retain full responsibility for all investment decisions.",
                ),
                const SizedBox(height: 12),
                _buildResponsibilityBullet(
                  icon: Icons.search_rounded,
                  text:
                      "You should conduct your own due diligence before executing any trade.",
                ),
                const SizedBox(height: 12),
                _buildResponsibilityBullet(
                  icon: Icons.group_rounded,
                  text:
                      "Consider consulting with a qualified financial professional.",
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Data Sources & Latency Section with Card
            _buildSectionCard(
              title: "Data Sources & Latency",
              icon: Icons.cloud_sync_rounded,
              iconColor: Colors.green,
              children: [
                const Text(
                  "Market data feeds may experience latency. While we strive for real-time accuracy, data delays can occur due to connectivity issues or third-party provider outages.",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.red.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: const Text(
                    "Do not rely solely on Aura for time-sensitive trade execution.",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Bottom Button with Checkbox
            _buildAcknowledgeSection(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required Color iconColor,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.greyText.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: iconColor, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildResponsibilityBullet({
    required IconData icon,
    required String text,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.secondaryColor, size: 18),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 14,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAcknowledgeSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.secondaryColor.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondaryColor.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(
                  Icons.check_rounded,
                  color: AppColors.secondaryColor,
                  size: 16,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  "By clicking below, I confirm that I have read and understood all the terms and limitations mentioned above.",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Handle acknowledge action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryColor,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                shadowColor: AppColors.secondaryColor.withOpacity(0.4),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.verified_user_rounded,
                    color: AppColors.primaryColor,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Understand & Acknowledge",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
