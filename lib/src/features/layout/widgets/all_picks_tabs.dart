// في ملف: lib/src/features/layout/widgets/ai_pick_tabs.dart
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';

class AIPickTabs extends StatefulWidget {
  final ValueChanged<int>? onTabChanged;
  final int initialIndex;

  const AIPickTabs({super.key, this.onTabChanged, this.initialIndex = 0});

  @override
  State<AIPickTabs> createState() => _AIPickTabsState();
}

class _AIPickTabsState extends State<AIPickTabs> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _selectTab(int index) {
    setState(() {
      _selectedIndex = index;
    });

    widget.onTabChanged?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = [
      context.l10n.allPicks,
      context.l10n.longTerm,
      context.l10n.shortSqueeze,
    ];

    return Row(
      children: [
        for (int i = 0; i < tabs.length; i++)
          Padding(
            padding: EdgeInsets.only(right: i < tabs.length - 1 ? 8 : 0),
            child: GestureDetector(
              onTap: () => _selectTab(i),
              child: _buildTabChip(tabs[i], i == _selectedIndex),
            ),
          ),
      ],
    );
  }

  Widget _buildTabChip(String title, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? AppColors.secondaryColor : AppColors.cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isActive ? AppColors.secondaryColor : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isActive ? AppColors.primaryColor : AppColors.greyText,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
