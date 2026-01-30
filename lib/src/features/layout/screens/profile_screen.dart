import 'package:aura_app/src/features/layout/widgets/profile_card.dart';
import 'package:aura_app/src/features/layout/widgets/setting_item.dart';
import 'package:flutter/material.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<Map<String, dynamic>> settingsItems = [
    {
      'title': 'Personal Info',
      'icon': Icons.person_outline_rounded,
      'subtitle': 'Manage your personal information',
      'onTap': () => print('Navigate to Personal Info'),
    },
    {
      'title': 'Analyzes',
      'icon': Icons.analytics_outlined,
      'subtitle': 'View your analysis history',
      'onTap': () => print('Navigate to Analyzes'),
    },
    {
      'title': 'Transaction History',
      'icon': Icons.history_rounded,
      'subtitle': 'Track all your transactions',
      'onTap': () => print('Navigate to Transaction History'),
    },
    {
      'title': 'Investment Preferences',
      'icon': Icons.tune_rounded,
      'subtitle': 'Customize your investment settings',
      'onTap': () => print('Navigate to Investment Preferences'),
    },
    {
      'title': 'Notification Settings',
      'icon': Icons.notifications_outlined,
      'subtitle': 'Manage your notification preferences',
      'onTap': () => print('Navigate to Notification Settings'),
    },
    {
      'title': 'Legal & Support',
      'icon': Icons.description_outlined,
      'subtitle': 'Terms, privacy, and support',
      'onTap': () => print('Navigate to Legal & Support'),
    },
    {
      'title': 'Aura AI',
      'icon': Icons.auto_awesome_rounded,
      'subtitle': 'Configure AI preferences',
      'onTap': () => print('Navigate to Aura AI'),
    },
  ];

  @override
  Widget build(BuildContext context) {
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
