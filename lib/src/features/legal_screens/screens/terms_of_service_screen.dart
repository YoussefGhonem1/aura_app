import 'package:aura_app/src/features/smart_automation/widgets/build_appbar.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class TermsOfServiceScreenEnhanced extends StatelessWidget {
  const TermsOfServiceScreenEnhanced({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: buildAppBar(context, context.l10n.termsOfService),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with gradient
            Container(
              margin: EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.secondaryColor.withOpacity(0.1),
                    AppColors.primaryColor,
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.secondaryColor.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.gavel_rounded,
                          color: AppColors.secondaryColor,
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.auraTermsOfServiceTitle,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                context.l10n.termsLastUpdatedVersion24,
                                style: const TextStyle(
                                  color: AppColors.greyText,
                                  fontSize: 12,
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
                    context.l10n.termsWelcomeMessage,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),

            // Terms Content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Acceptance of Terms
                  _buildTermCard(
                    number: "1",
                    title: context.l10n.acceptanceOfTerms,
                    icon: Icons.check_circle_rounded,
                    children: [
                      Text(
                        context.l10n.acceptanceOfTermsBody,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildNoteCard(context.l10n.acceptanceNote),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // 2. Privacy Policy
                  _buildTermCard(
                    number: "2",
                    title: context.l10n.privacyPolicy,
                    icon: Icons.privacy_tip_rounded,
                    children: [
                      Text(
                        context.l10n.privacyPolicyTermsBody,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to Privacy Policy
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.description_rounded,
                                color: AppColors.secondaryColor,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                context.l10n.viewPrivacyPolicy,
                                style: const TextStyle(
                                  color: AppColors.secondaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // 3. User Conduct
                  _buildTermCard(
                    number: "3",
                    title: context.l10n.userConduct,
                    icon: Icons.rule_rounded,
                    children: [
                      Text(
                        context.l10n.prohibitedActivitiesIntro,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildConductItem(
                        icon: Icons.copy_rounded,
                        text: context.l10n.copyingDistributingText,
                      ),
                      _buildConductItem(
                        icon: Icons.security_rounded,
                        text: context.l10n.interferingSecurityText,
                      ),
                      _buildConductItem(
                        icon: Icons.speed_rounded,
                        text: context.l10n.unreasonableLoadText,
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // 4. Intellectual Property
                  _buildTermCard(
                    number: "4",
                    title: context.l10n.intellectualProperty,
                    icon: Icons.copyright_rounded,
                    children: [
                      Text(
                        context.l10n.intellectualPropertyBody,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // 5. Limitation of Liability
                  _buildTermCard(
                    number: "5",
                    title: context.l10n.limitationOfLiability,
                    icon: Icons.warning_amber_rounded,
                    children: [
                      Text(
                        context.l10n.limitationOfLiabilityBody,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // Contact Section
                  _buildContactSection(context),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTermCard({
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
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: AppColors.secondaryColor, size: 20),
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

  Widget _buildNoteCard(String text) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.secondaryColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline_rounded,
            color: AppColors.secondaryColor,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 13,
                height: 1.5,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConductItem({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.red, size: 16),
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

  Widget _buildContactSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.secondaryColor.withOpacity(0.1),
            AppColors.primaryColor.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.secondaryColor.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.question_answer_rounded,
            color: AppColors.secondaryColor,
            size: 48,
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.haveQuestionsAboutTheseTerms,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            context.l10n.legalTeamHelpClarifyTerms,
            style: TextStyle(
              color: AppColors.greyText,
              fontSize: 14,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    // Email support
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: BorderSide(
                      color: AppColors.secondaryColor.withOpacity(0.5),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    context.l10n.emailSupport,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Contact legal support
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    context.l10n.contactLegal,
                    style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
