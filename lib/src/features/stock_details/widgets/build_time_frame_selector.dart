
  import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget timeFrameSelector({
    required List<String> timeFrames,
    required int selectedIndex,
    required Function(int) onSelect,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          timeFrames.length,
          (index) => GestureDetector(
            onTap: () => onSelect(index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? AppColors.secondaryColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: selectedIndex == index
                      ? AppColors.secondaryColor
                      : AppColors.white.withOpacity(0.2),
                  width: 1.5,
                ),
              ),
              child: Text(
                timeFrames[index],
                style: TextStyle(
                  color: selectedIndex == index
                      ? AppColors.primaryColor
                      : AppColors.white.withOpacity(0.7),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
