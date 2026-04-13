import 'package:aura_app/src/features/legal_support/widgets/build_menu_item.dart';
import 'package:aura_app/src/features/legal_support/widgets/build_version_card.dart';
import 'package:aura_app/src/features/legal_support/widgets/buils_card_section.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/features/smart_automation/widgets/build_appbar.dart';
import 'package:aura_app/src/shared/routing/route_strings.dart';
import 'package:flutter/material.dart';

class LegalSupportScreenEnhanced extends StatelessWidget {
  const LegalSupportScreenEnhanced({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        context.tr('Legal & Support', 'القانوني والدعم'),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSectionCard(
                    title: context.tr('LEGAL', 'قانوني'),
                    items: [
                      buildMenuItemWithIcon(
                        title: context.tr(
                          'Disclaimer & AI Ethics',
                          'إخلاء المسؤولية وأخلاقيات الذكاء الاصطناعي',
                        ),
                        icon: Icons.gavel_rounded,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.disclaimerScreenEnhanced,
                          );
                        },
                      ),
                      buildMenuItemWithIcon(
                        title: context.l10n.termsOfService,
                        icon: Icons.description_rounded,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.termsOfServiceScreenEnhanced,
                          );
                        },
                      ),
                      buildMenuItemWithIcon(
                        title: context.l10n.privacyPolicy,
                        icon: Icons.lock_rounded,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.privacyPolicyScreenEnhanced,
                          );
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // SUPPORT Section
                  buildSectionCard(
                    title: context.tr('SUPPORT', 'الدعم'),
                    items: [
                      buildMenuItemWithIcon(
                        title: context.l10n.helpCenter,
                        icon: Icons.help_center_rounded,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.helpCenterScreenEnhanced,
                          );
                        },
                      ),
                      buildMenuItemWithIcon(
                        title: context.l10n.contactUs,
                        icon: Icons.mail_rounded,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.contactUsScreenEnhanced,
                          );
                        },
                      ),
                      buildMenuItemWithIcon(
                        title: context.l10n.reportBug,
                        icon: Icons.bug_report_rounded,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.reportBugScreenEnhanced,
                          );
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // App Version Card
                  buildVersionCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
