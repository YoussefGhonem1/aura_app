import 'package:aura_app/src/features/legal_support/widgets/build_menu_item.dart';
import 'package:aura_app/src/features/legal_support/widgets/build_version_card.dart';
import 'package:aura_app/src/features/legal_support/widgets/buils_card_section.dart';
import 'package:aura_app/src/features/smart_automation/widgets/build_appbar.dart';
import 'package:aura_app/src/shared/routing/route_strings.dart';
import 'package:flutter/material.dart';

class LegalSupportScreenEnhanced extends StatelessWidget {
  const LegalSupportScreenEnhanced({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Legal & Support"),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSectionCard(
                    title: "LEGAL",
                    items: [
                      buildMenuItemWithIcon(
                        title: "Disclaimer & AI Ethics",
                        icon: Icons.gavel_rounded,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.disclaimerScreenEnhanced,
                          );
                        },
                      ),
                      buildMenuItemWithIcon(
                        title: "Terms of Service",
                        icon: Icons.description_rounded,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.termsOfServiceScreenEnhanced,
                          );
                        },
                      ),
                      buildMenuItemWithIcon(
                        title: "Privacy Policy",
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
                    title: "SUPPORT",
                    items: [
                      buildMenuItemWithIcon(
                        title: "Help Center",
                        icon: Icons.help_center_rounded,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.helpCenterScreenEnhanced,
                          );
                        },
                      ),
                      buildMenuItemWithIcon(
                        title: "Contact Us",
                        icon: Icons.mail_rounded,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.contactUsScreenEnhanced,
                          );
                        },
                      ),
                      buildMenuItemWithIcon(
                        title: "Report a Bug",
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
