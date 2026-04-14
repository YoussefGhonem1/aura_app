import 'package:aura_app/src/features/layout/screens/ai_recommendation_screen.dart';
import 'package:aura_app/src/features/layout/screens/home_screen.dart';
import 'package:aura_app/src/features/layout/screens/portfolio_screen.dart';
import 'package:aura_app/src/features/layout/screens/profile_screen.dart';
import 'package:aura_app/src/features/layout/screens/search_screen.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    PortfolioScreen(),
    AuraAIRecommendationScreen(),
    AuraSearchExploreScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 65,
        width: 65,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.secondaryColor.withOpacity(0.3),
              blurRadius: 15,
              spreadRadius: 2,
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () => setState(() => _currentIndex = 2),
          backgroundColor: AppColors.secondaryColor,
          shape: const CircleBorder(),
          elevation: 0,
          child: const Icon(
            Icons.auto_awesome_rounded,
            color: AppColors.primaryColor,
            size: 34,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: AppColors.cardColor,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(Icons.home_filled, context.l10n.home, 0),
              _buildNavItem(
                Icons.account_balance_wallet_rounded,
                context.l10n.portfolio,
                1,
              ),

              const SizedBox(width: 40),
              _buildNavItem(Icons.search, context.l10n.search, 3),
              _buildNavItem(Icons.person_rounded, context.l10n.profile, 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = _currentIndex == index;
    return InkWell(
      onTap: () => setState(() => _currentIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected
                ? AppColors.secondaryColor
                : AppColors.greyText.withOpacity(0.5),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected
                  ? AppColors.secondaryColor
                  : AppColors.greyText.withOpacity(0.5),
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
