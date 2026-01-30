import 'package:aura_app/src/features/layout/widgets/aura_insight_search_container.dart';
import 'package:aura_app/src/features/layout/widgets/build_compare_bar.dart';
import 'package:aura_app/src/features/layout/widgets/build_section_header_search.dart';
import 'package:aura_app/src/features/layout/widgets/build_trending_list_search.dart';
import 'package:aura_app/src/features/layout/widgets/build_recent_searshes_list.dart';
import 'package:aura_app/src/features/layout/widgets/search_bar.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AuraSearchExploreScreen extends StatefulWidget {
  const AuraSearchExploreScreen({super.key});

  @override
  State<AuraSearchExploreScreen> createState() =>
      _AuraSearchExploreScreenState();
}

class _AuraSearchExploreScreenState extends State<AuraSearchExploreScreen> {
  final List<String> recentSearches = [
    'NVDA',
    'AI Sector',
    'Crypto',
    'Tesla',
    'NVIDIA',
    'AI',
    'Cryptocurrency',
    'Tesla',
  ];

  List<Map<String, dynamic>> trendingStocks = [
    {
      'symbol': 'AAPL',
      'name': 'Apple Inc.',
      'price': 182.40,
      'change': '+1.25%',
      'isPositive': true,
      'isSelected': false,
    },
    {
      'symbol': 'MSFT',
      'name': 'Microsoft Corp',
      'price': 402.10,
      'change': '+0.82%',
      'isPositive': true,
      'isSelected': false,
    },
    {
      'symbol': 'AMD',
      'name': 'Adv Micro Dev',
      'price': 160.50,
      'change': '-0.54%',
      'isPositive': false,
      'isSelected': false,
    },
    {
      'symbol': 'TSLA',
      'name': 'Tesla Inc.',
      'price': 198.80,
      'change': '+2.15%',
      'isPositive': true,
      'isSelected': false,
    },
  ];

  bool _showCompareBar = false;
  int _selectedCount = 0;
  bool _isCompareMode = false;

  void _toggleStockSelection(int index) {
    final stock = trendingStocks[index];
    final currentlySelected = stock['isSelected'] as bool;

    if (currentlySelected) {
      setState(() {
        stock['isSelected'] = false;
        _selectedCount--;
      });
    } else if (_selectedCount < 2) {
      setState(() {
        stock['isSelected'] = true;
        _selectedCount++;
      });
    }

    setState(() {
      _showCompareBar = _selectedCount > 0;
    });
  }

  void _handleStockTap(int index) {
    if (_isCompareMode) {
      _toggleStockSelection(index);
    } else {
      _openStockDetails(index);
    }
  }

  void _openStockDetails(int index) {
    final stock = trendingStocks[index];
    print('فتح تفاصيل السهم: ${stock['symbol']}');

    // Navigator.push(context, MaterialPageRoute(builder: (context) => StockDetailsScreen(stock: stock)));
  }

  void toggleCompareMode() {
    setState(() {
      _isCompareMode = !_isCompareMode;

      if (!_isCompareMode) {
        for (var stock in trendingStocks) {
          stock['isSelected'] = false;
        }
        _selectedCount = 0;
        _showCompareBar = false;
      }
    });
  }

  Color _getStockBackgroundColor(int index) {
    final stock = trendingStocks[index];

    if (stock['isSelected'] as bool) {
      return AppColors.secondaryColor.withOpacity(0.2);
    } else {
      return AppColors.cardColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  buildSearchBar(),
                  const SizedBox(height: 25),
                  buildSectionHeader(
                    "Recent Searches",
                    hasClear: true,
                    isCompareMode: false,
                    toggleCompareMode: () {},
                  ),
                  const SizedBox(height: 10),
                  buildRecentSearches(recentSearches),
                  const SizedBox(height: 25),
                  buildAuraInsight(context),
                  const SizedBox(height: 30),
                  buildSectionHeader(
                    "Trending Now",
                    hasFilters: true,
                    isCompareMode: _isCompareMode,
                    toggleCompareMode: toggleCompareMode,
                  ),
                  const SizedBox(height: 20),
                  buildTrendingList(
                    trendingStocks: trendingStocks,
                    isCompareMode: _isCompareMode,
                    getStockBackgroundColor: _getStockBackgroundColor,
                    handleStockTap: _handleStockTap,
                  ),
                  const SizedBox(height: 300),
                ],
              ),
            ),
          ),
          if (_showCompareBar)
            buildCompareBar(
              trendingStocks: trendingStocks,
              selectedCount: _selectedCount,
              showCompareBar: _showCompareBar,
              onClearAll: () {
                setState(() {
                  for (var stock in trendingStocks) {
                    stock['isSelected'] = false;
                  }
                  _selectedCount = 0;
                  _showCompareBar = false;
                });
              },
              onCompare: () {
                final selectedStocks = trendingStocks
                    .where((stock) => stock['isSelected'] as bool)
                    .toList();
                print(
                  'فتح شاشة المقارنة بين الأسهم: ${selectedStocks.map((s) => s['symbol']).join(' vs ')}',
                );
              },
            ),
        ],
      ),
    );
  }
}
