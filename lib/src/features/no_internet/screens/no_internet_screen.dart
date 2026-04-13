import 'package:aura_app/src/shared/componants/custom_button.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              // Main Illustration Container
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  color: const Color(
                    0xFFD1D5C2,
                  ), // Matching the image exact illustration background
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Icon(
                    Icons.wifi_off,
                    size: 100,
                    color: AppColors.primaryColor.withOpacity(0.8),
                  ),
                ),
              ),
              const SizedBox(height: 48),

              // Title
              Text(
                context.tr('Connection Lost', 'انقطع الاتصال'),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),

              // Description
              Text(
                context.tr(
                  'Aura needs a connection to sync real-time\nmarket data.',
                  'يحتاج Aura إلى اتصال لمزامنة\nبيانات السوق الفورية.',
                ),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 48),

              // Retry Button
              AuraButton(
                title: context.tr('Retry Connection', 'إعادة المحاولة'),
                onPressed: () {},
              ),
              const SizedBox(height: 10),

              // Footer Links
              TextButton(
                onPressed: () {},
                child: Text(
                  context.tr('Contact Support', 'التواصل مع الدعم'),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
