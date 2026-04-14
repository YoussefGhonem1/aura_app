import 'package:aura_app/src/features/smart_automation/widgets/build_appbar.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreenEnhanced extends StatelessWidget {
  const PrivacyPolicyScreenEnhanced({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: buildAppBar(context, context.l10n.privacyPolicy),
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
                              Text(
                                context.l10n.auraPrivacyPolicyTitle,
                                style: const TextStyle(
                                  color: AppColors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                context.l10n.privacyLastUpdated,
                                style: const TextStyle(
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
                  Text(
                    context.l10n.privacyWelcomeMessage,
                    style: const TextStyle(
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
                    title: context.l10n.introduction,
                    icon: Icons.info_outline_rounded,
                    children: [
                      Text(
                        context.l10n.privacyIntroductionBody,
                        style: const TextStyle(
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
                                  Text(
                                    context.l10n.contactPrivacyTeam,
                                    style: const TextStyle(
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
                    title: context.l10n.informationWeCollect,
                    icon: Icons.collections_bookmark_rounded,
                    children: [
                      Text(
                        context.l10n.informationWeCollectBody,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildDataCollectionItem(
                        title: context.l10n.accountData,
                        description: context.l10n.accountDataDescription,
                        icon: Icons.person_outline_rounded,
                      ),
                      _buildDataCollectionItem(
                        title: context.l10n.deviceInformation,
                        description: context.l10n.deviceInformationDescription,
                        icon: Icons.phone_iphone_rounded,
                      ),
                      _buildDataCollectionItem(
                        title: context.l10n.usageData,
                        description: context.l10n.usageDataDescription,
                        icon: Icons.analytics_outlined,
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),
                  // 3. How We Use Your Data
                  _buildPrivacyCard(
                    number: "3",
                    title: context.l10n.howWeUseYourData,
                    icon: Icons.data_usage_rounded,
                    children: [
                      Text(
                        context.l10n.howWeUseYourDataBody,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildUsageItem(context.l10n.personalizeExperienceText),
                      _buildUsageItem(context.l10n.monitorAnalyzeTrendsText),
                    ],
                  ),

                  const SizedBox(height: 24),
                  // 4. Your Rights
                  _buildPrivacyCard(
                    number: "4",
                    title: context.l10n.yourRights,
                    icon: Icons.gavel_rounded,
                    children: [
                      Text(
                        context.l10n.yourRightsBody,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildRightItem(
                        context.l10n.rightToAccessData,
                        Icons.visibility_rounded,
                      ),
                      _buildRightItem(
                        context.l10n.rightToRequestDataDeletion,
                        Icons.delete_outline_rounded,
                      ),
                      _buildRightItem(
                        context.l10n.rightToDataPortability,
                        Icons.import_export_rounded,
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),
                  // 5. Data Protection
                  _buildPrivacyCard(
                    number: "5",
                    title: context.l10n.dataProtection,
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
                        child: Column(
                          children: [
                            const Icon(
                              Icons.verified_user_rounded,
                              color: Colors.green,
                              size: 40,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              context.l10n.dataProtectionBody,
                              style: const TextStyle(
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
                  _buildContactFooter(context),

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

  Widget _buildContactFooter(BuildContext context) {
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
          Text(
            context.l10n.haveQuestions,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            context.l10n.privacyTeamHelpUnderstandRights,
            style: const TextStyle(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.support_agent_rounded,
                    color: AppColors.primaryColor,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    context.l10n.contactSupport,
                    style: const TextStyle(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.copyright_rounded,
                color: AppColors.greyText,
                size: 14,
              ),
              const SizedBox(width: 8),
              Text(
                context.l10n.copyrightNotice,
                style: const TextStyle(color: AppColors.greyText, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
