import 'package:aura_app/src/features/smart_automation/widgets/build_appbar.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreenEnhanced extends StatelessWidget {
  const PrivacyPolicyScreenEnhanced({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: buildAppBar(context, "Privacy Policy"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with Security Badge
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.secondaryColor.withOpacity(0.1),
                    AppColors.primaryColor.withOpacity(0.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.secondaryColor.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.lock_rounded,
                            color: Colors.black,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Aura Privacy Policy",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Last updated: October 24, 2023",
                                style: TextStyle(
                                  color: AppColors.greyText,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Welcome to Aura. We are committed to protecting your personal information and your right to privacy. This Privacy Policy describes how your personal information is collected, used, and shared when you use our mobile application and services.",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),

            // Content Sections
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // 1. Introduction
                  _buildPrivacyCard(
                    number: "1",
                    title: "Introduction",
                    icon: Icons.info_outline_rounded,
                    children: [
                      const Text(
                        "Welcome to Aura. We are committed to protecting your personal information and your right to privacy. This Privacy Policy describes how your personal information is collected, used, and shared when you use our mobile application and services.",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.secondaryColor.withOpacity(0.3),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.email_rounded,
                              color: AppColors.secondaryColor,
                              size: 20,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Contact Privacy Team",
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  GestureDetector(
                                    onTap: () {
                                      // Open email
                                    },
                                    child: Text(
                                      "privacy@aura.app",
                                      style: TextStyle(
                                        color: AppColors.secondaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // 2. Information We Collect
                  _buildPrivacyCard(
                    number: "2",
                    title: "Information We Collect",
                    icon: Icons.collections_bookmark_rounded,
                    children: [
                      const Text(
                        "We collect information that you provide directly to us when you create an account, use our services, or communicate with us.",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildDataCollectionItem(
                        title: "Account Data",
                        description:
                            "Name, email address, and authentication credentials.",
                        icon: Icons.person_outline_rounded,
                      ),
                      _buildDataCollectionItem(
                        title: "Device Information",
                        description:
                            "Hardware model, operating system version, and unique device identifiers.",
                        icon: Icons.phone_iphone_rounded,
                      ),
                      _buildDataCollectionItem(
                        title: "Usage Data",
                        description:
                            "Information about your interactions with the app, including features used and time spent.",
                        icon: Icons.analytics_outlined,
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // 3. How We Use Your Data
                  _buildPrivacyCard(
                    number: "3",
                    title: "How We Use Your Data",
                    icon: Icons.data_usage_rounded,
                    children: [
                      const Text(
                        "We use the information we collect to provide, maintain, and improve our services, including:",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildUsageItem(
                        "To personalize your experience and deliver the type of content and product offerings it suits you are most interested in.",
                      ),
                      _buildUsageItem(
                        "To monitor and analyze trends, usage, and activities in connection with our services.",
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // 4. Your Rights
                  _buildPrivacyCard(
                    number: "4",
                    title: "Your Rights",
                    icon: Icons.gavel_rounded,
                    children: [
                      const Text(
                        "Depending on your location, you may have certain rights under applicable data protection laws, including:",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildRightItem(
                        "The right to access your personal data.",
                        Icons.visibility_rounded,
                      ),
                      _buildRightItem(
                        "The right to request data deletion.",
                        Icons.delete_outline_rounded,
                      ),
                      _buildRightItem(
                        "The right to data portability.",
                        Icons.import_export_rounded,
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // 5. Data Protection
                  _buildPrivacyCard(
                    number: "5",
                    title: "Data Protection",
                    icon: Icons.security_rounded,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.green.withOpacity(0.1),
                              AppColors.secondaryColor.withOpacity(0.05),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.green.withOpacity(0.3),
                          ),
                        ),
                        child: const Column(
                          children: [
                            Icon(
                              Icons.verified_user_rounded,
                              color: Colors.green,
                              size: 40,
                            ),
                            SizedBox(height: 12),
                            Text(
                              "We implement a variety of security measures to maintain the safety of your personal information. Your personal information is contained behind secured networks and is only accessible by a limited number of persons who have special access rights to such systems.",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14,
                                height: 1.6,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Contact Footer
                  _buildContactFooter(),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrivacyCard({
    required String number,
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.greyText.withOpacity(0.1)),
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
                  color: AppColors.secondaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: AppColors.secondaryColor, size: 22),
              ),
              const SizedBox(width: 12),
              Text(
                number,
                style: TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
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

  Widget _buildDataCollectionItem({
    required String title,
    required String description,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.greyText.withOpacity(0.1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.secondaryColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUsageItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle_outline_rounded,
            color: AppColors.secondaryColor,
            size: 18,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 13,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRightItem(String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.secondaryColor, size: 18),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 13,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactFooter() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.secondaryColor.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.contact_support_rounded,
            color: AppColors.secondaryColor,
            size: 48,
          ),
          const SizedBox(height: 16),
          const Text(
            "Have questions?",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            "Our privacy team is here to help you understand your rights and our obligations.",
            style: TextStyle(
              color: AppColors.greyText,
              fontSize: 14,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Navigate to support
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryColor,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.support_agent_rounded,
                    color: AppColors.primaryColor,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Contact Support",
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
          const SizedBox(height: 24),
          const Divider(color: AppColors.greyText, height: 1),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.copyright_rounded,
                color: AppColors.greyText,
                size: 14,
              ),
              SizedBox(width: 8),
              Text(
                "2019 Aura App Inc. All rights reserved.",
                style: TextStyle(color: AppColors.greyText, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
