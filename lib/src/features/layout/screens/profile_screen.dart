import 'package:aura_app/src/core/bloc/bloc_exports.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/features/settings/widgets/language_settings_dialog.dart';
import 'package:aura_app/src/features/layout/widgets/profile_card.dart';
import 'package:aura_app/src/features/layout/widgets/setting_item.dart';
import 'package:aura_app/src/shared/routing/route_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        final languageBloc = context.read<LanguageBloc>();

        final List<Map<String, dynamic>> settingsItems = [
          {
            'title': context.l10n.personalInfo,
            'icon': Icons.person_outline_rounded,
            'subtitle': context.l10n.managePersonalInformation,
            'onTap': () =>
                Navigator.pushNamed(context, Routes.personalInfoScreen),
          },
          {
            'title': context.l10n.analyzes,
            'icon': Icons.analytics_outlined,
            'subtitle': context.l10n.viewAnalysisHistory,
            'onTap': () => Navigator.pushNamed(context, Routes.analysisScreen),
          },
          {
            'title': context.l10n.transactionHistory,
            'icon': Icons.history_rounded,
            'subtitle': context.l10n.trackAllTransactions,
            'onTap': () =>
                Navigator.pushNamed(context, Routes.transactionHistoryScreen),
          },
          {
            'title': context.l10n.investmentPreferences,
            'icon': Icons.tune_rounded,
            'subtitle': context.l10n.customizeInvestmentSettings,
            'onTap': () => Navigator.pushNamed(
              context,
              Routes.investmentPreferencesScreen,
            ),
          },
          {
            'title': context.l10n.smartAutomations,
            'icon': Icons.auto_awesome_rounded,
            'subtitle': context.l10n.setAutomatedInvestmentStrategies,
            'onTap': () =>
                Navigator.pushNamed(context, Routes.smartAutomationScreen),
          },
          {
            'title': context.l10n.notificationSettings,
            'icon': Icons.notifications_outlined,
            'subtitle': context.l10n.manageNotificationPreferences,
            'onTap': () =>
                Navigator.pushNamed(context, Routes.notificationSettingsScreen),
          },
          {
            'title': context.l10n.language,
            'icon': Icons.language,
            'subtitle': languageBloc.isArabic
                ? context.l10n.arabic
                : context.l10n.english,
            'onTap': () {
              showDialog<void>(
                context: context,
                builder: (_) => const LanguageSettingsDialog(),
              );
            },
          },
          {
            'title': context.l10n.legalAndSupport,
            'icon': Icons.description_outlined,
            'subtitle': context.l10n.termsPrivacyAndSupport,
            'onTap': () =>
                Navigator.pushNamed(context, Routes.legalSupportScreenEnhanced),
          },
        ];

        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      context.l10n.settings,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  buildUserProfileCard(),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 32, 20, 16),
                    child: Text(
                      context.l10n.account,
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: settingsItems
                          .map((item) => buildSettingItem(item))
                          .toList(),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 24,
                    ),
                    child: Divider(
                      color: Colors.white.withOpacity(0.07),
                      height: 1,
                    ),
                  ),

                  Center(
                    child: Text(
                      context.l10n.appVersionLabel,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 14,
                      ),
                    ),
                  ),

                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
