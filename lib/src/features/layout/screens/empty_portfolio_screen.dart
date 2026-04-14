import 'package:aura_app/src/features/layout/widgets/build_header_home.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class EmptyPortfolioScreen extends StatelessWidget {
  const EmptyPortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header with profile and notification
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Profile photo
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.secondaryColor.withOpacity(0.3),
                        width: 2,
                      ),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/profile.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.surfaceColor.withOpacity(0.5),
                      ),
                      child: const Icon(
                        Icons.person,
                        color: AppColors.secondaryColor,
                        size: 20,
                      ),
                    ),
                  ),
                  // Notification icon
                  buildNotificationIcon(context),
                ],
              ),
            ),
            // Main content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      // Large circular icon with glow effect
                      Container(
                        padding: const EdgeInsets.all(50),
                        decoration: BoxDecoration(
                          color: AppColors.cardColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            // Outer glow shadow
                            BoxShadow(
                              color: AppColors.secondaryColor.withOpacity(0.1),
                              blurRadius: 50,
                              spreadRadius: 50,
                            ),
                            // Inner glow
                            BoxShadow(
                              color: AppColors.secondaryColor.withOpacity(0.15),
                              blurRadius: 30,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.trending_up_rounded,
                          size: 80,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      const SizedBox(height: 100),
                      // Title text
                      Text(
                        context.l10n.yourJourneyStartsHere,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineLarge
                            ?.copyWith(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1.3,
                            ),
                      ),
                      const SizedBox(height: 16),
                      // Subtitle text
                      Text(
                        context.l10n.startVirtualPortfolioPrompt,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.greyText,
                          height: 1.5,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 50),
                      // CTA Button
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to markets or add stock screen
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.secondaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            elevation: 8,
                            shadowColor: AppColors.secondaryColor.withOpacity(
                              0.3,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.add,
                                color: AppColors.primaryColor,
                                size: 24,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                context.l10n.addYourFirstStock,
                                style: const TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
