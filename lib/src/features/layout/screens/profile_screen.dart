import 'package:aura_app/src/features/layout/widgets/profile_card.dart';
import 'package:aura_app/src/features/layout/widgets/setting_item.dart';
import 'package:aura_app/src/shared/routing/route_strings.dart';
import 'package:flutter/material.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> settingsItems = [
      {
        'title': 'Personal Info',
        'icon': Icons.person_outline_rounded,
        'subtitle': 'Manage your personal information',
        'onTap': () => Navigator.pushNamed(context, Routes.personalInfoScreen),
      },
      {
        'title': 'Analyzes',
        'icon': Icons.analytics_outlined,
        'subtitle': 'View your analysis history',
        'onTap': () => Navigator.pushNamed(context, Routes.analysisScreen),
      },
      {
        'title': 'Transaction History',
        'icon': Icons.history_rounded,
        'subtitle': 'Track all your transactions',
        'onTap': () =>
            Navigator.pushNamed(context, Routes.transactionHistoryScreen),
      },
      {
        'title': 'Investment Preferences',
        'icon': Icons.tune_rounded,
        'subtitle': 'Customize your investment settings',
        'onTap': () =>
            Navigator.pushNamed(context, Routes.investmentPreferencesScreen),
      },
      {
        'title': 'Smart Automations',
        'icon': Icons.auto_awesome_rounded,
        'subtitle': 'Set up automated investment strategies',
        'onTap': () => Navigator.pushNamed(context, Routes.smartAutomationScreen),
      },
      {
        'title': 'Notification Settings',
        'icon': Icons.notifications_outlined,
        'subtitle': 'Manage your notification preferences',
        'onTap': () => Navigator.pushNamed(context, Routes.notificationSettingsScreen),
      },
      {
        'title': 'Legal & Support',
        'icon': Icons.description_outlined,
        'subtitle': 'Terms, privacy, and support',
        'onTap': () => Navigator.pushNamed(context, Routes.legalSupportScreenEnhanced),
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
                  "Settings",
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
                  "ACCOUNT",
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
                  "Aura App v1.0.0",
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
  }
}
