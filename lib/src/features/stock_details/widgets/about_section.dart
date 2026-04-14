import 'package:aura_app/src/features/stock_details/models/stock_details_model.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AboutSection extends StatefulWidget {
  final StockModel stock;

  const AboutSection({super.key, required this.stock});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final bool shouldTrim = widget.stock.about.length > 200;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${context.l10n.about} ${widget.stock.name}',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),

          AnimatedCrossFade(
            firstChild: Text(
              shouldTrim
                  ? '${widget.stock.about.substring(0, 200)}...'
                  : widget.stock.about,
              style: TextStyle(
                color: AppColors.white.withOpacity(0.8),
                fontSize: 14,
                height: 1.6,
              ),
            ),
            secondChild: Text(
              widget.stock.about,
              style: TextStyle(
                color: AppColors.white.withOpacity(0.8),
                fontSize: 14,
                height: 1.6,
              ),
            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 250),
          ),

          if (shouldTrim) ...[
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Text(
                isExpanded ? context.l10n.showLess : context.l10n.readMore,
                style: TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
