import 'package:aura_app/src/features/layout/widgets/aura_insight_search_container.dart';
import 'package:aura_app/src/features/layout/widgets/build_compare_bar.dart';
import 'package:aura_app/src/features/layout/widgets/build_section_header_search.dart';
import 'package:aura_app/src/features/layout/widgets/build_trending_list_search.dart';
import 'package:aura_app/src/features/layout/widgets/build_recent_searshes_list.dart';
import 'package:aura_app/src/features/layout/widgets/search_bar.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/features/stock_details/models/stock_details_model.dart';
import 'package:aura_app/src/shared/routing/route_strings.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AuraSearchExploreScreen extends StatefulWidget {
  const AuraSearchExploreScreen({super.key});

  @override
  State<AuraSearchExploreScreen> createState() =>
      _AuraSearchExploreScreenState();
}

class _AuraSearchExploreScreenState extends State<AuraSearchExploreScreen> {
  // تحويل عمليات البحث الأخيرة لتكون باللغة العربية ومنطقية مع السوق المصري
  final List<String> recentSearches = [
    'البنك التجاري الدولي',
    'قطاع العقارات',
    'فوري',
    'طلعت مصطفى',
    'السويدي إليكتريك',
    'الذكاء الاصطناعي',
    'حديد عز',
    'البورصة المصرية',
  ];

  // تجهيز القائمة فارغة ليتم ملؤها من الموديل الخاص بنا
  List<Map<String, dynamic>> trendingStocks = [];

  bool _showCompareBar = false;
  int _selectedCount = 0;
  bool _isCompareMode = false;

  @override
  void initState() {
    super.initState();
    _loadTrendingFromModel();
  }

  // دالة لتحميل البيانات من الموديل الذي قمنا بإنشائه بدلاً من البيانات الثابتة
  void _loadTrendingFromModel() {
    final List<String> symbols = [
      'COMI',
      'TMGH',
      'FWRY',
      'ESRS',
    ]; // أسهم من السوق المصري

    trendingStocks = symbols.map((symbol) {
      final stock = StockModel.dummy(symbol); // جلب البيانات من Factory Method
      return {
        'symbol': stock.symbol,
        'name': stock.name,
        'price': stock.currentPrice,
        'change': '${stock.isPositive ? '+' : ''}${stock.priceChangePercent}%',
        'isPositive': stock.isPositive,
        'isSelected': false,
        'stockModel': stock, // نحتفظ بالموديل بالكامل لاستخدامه عند الانتقال
      };
    }).toList();
  }

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
    final stockInfo = trendingStocks[index];
    print('فتح تفاصيل السهم: ${stockInfo['symbol']}');

    // استدعاء الموديل المخزن مباشرة
    final stockModel = stockInfo['stockModel'] as StockModel;

    Navigator.pushNamed(
      context,
      Routes.stockDetailsScreen,
      arguments: stockModel,
    );
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
                  buildSearchBar(context),
                  const SizedBox(height: 25),
                  buildSectionHeader(
                    context.tr('Recent Searches', 'عمليات البحث الأخيرة'),
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
                    context.tr('Trending Now', 'الأكثر تداولًا الآن'),
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

                if (selectedStocks.length != 2) {
                  return;
                }

                // جلب بيانات الموديل الخاص بالسهمين المختارين وتمريرهم للمقارنة
                final stock1 = selectedStocks[0]['stockModel'] as StockModel;
                final stock2 = selectedStocks[1]['stockModel'] as StockModel;

                Navigator.pushNamed(
                  context,
                  Routes.stocksCompareScreen,
                  arguments: {'stock1': stock1, 'stock2': stock2},
                );
              },
            ),
        ],
      ),
    );
  }
}
