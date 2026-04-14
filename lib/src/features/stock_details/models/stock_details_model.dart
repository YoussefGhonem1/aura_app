// lib/models/stock_model.dart
import 'package:intl/intl.dart';

class StockModel {
  final String symbol;
  final String name;
  final String exchange;
  final double currentPrice;
  final double priceChange;
  final double priceChangePercent;
  final bool isPositive;
  final String sector;
  final String industry;

  // Market Statistics
  final double marketCap; // in billions
  final double peRatio;
  final double dividendYield;
  final double avgVolume; // in millions

  // Aura Signal
  final String auraSignal; // STRONG BUY, BUY, HOLD, SELL, STRONG SELL
  final int auraScore; // 0-100
  final String auraConfidence;
  final List<String> recommendationReasons;

  // About
  final String about;

  // Chart Data
  final List<ChartPoint> chartData;

  StockModel({
    required this.symbol,
    required this.name,
    required this.exchange,
    required this.currentPrice,
    required this.priceChange,
    required this.priceChangePercent,
    required this.isPositive,
    required this.sector,
    required this.industry,
    required this.marketCap,
    required this.peRatio,
    required this.dividendYield,
    required this.avgVolume,
    required this.auraSignal,
    required this.auraScore,
    required this.auraConfidence,
    required this.recommendationReasons,
    required this.about,
    required this.chartData,
  });

  // Factory method لإنشاء نموذج وهمي للاختبار
  factory StockModel.dummy(String symbol, {String? localeCode}) {
    List<ChartPoint> chartData = [];
    double basePrice = 180.0;
    final normalizedLocale = (localeCode ?? Intl.getCurrentLocale())
        .toLowerCase();
    final isArabic = normalizedLocale.startsWith('ar');

    // إنشاء بيانات وهمية للرسم البياني
    for (int i = 0; i < 24; i++) {
      double variation = (i % 5 == 0) ? 0.5 : 0.1;
      basePrice += variation * (i.isEven ? 1 : -1);
      chartData.add(
        ChartPoint(
          time: DateTime.now().subtract(Duration(hours: 23 - i)),
          price: basePrice,
        ),
      );
    }

    return StockModel(
      symbol: symbol,
      name: _getStockName(symbol),
      exchange: 'NASDAQ',
      currentPrice: _getStockPrice(symbol),
      priceChange: _getPriceChange(symbol),
      priceChangePercent: _getPriceChangePercent(symbol),
      isPositive: _getPriceChange(symbol) > 0,
      sector: isArabic ? 'التكنولوجيا' : 'Technology',
      industry: isArabic ? 'الإلكترونيات الاستهلاكية' : 'Consumer Electronics',
      marketCap: _getMarketCap(symbol),
      peRatio: _getPERatio(symbol),
      dividendYield: _getDividendYield(symbol),
      avgVolume: _getAvgVolume(symbol),
      auraSignal: _getAuraSignal(symbol),
      auraScore: _getAuraScore(symbol),
      auraConfidence: _getAuraConfidence(symbol, isArabic: isArabic),
      recommendationReasons: _getRecommendationReasons(
        symbol,
        isArabic: isArabic,
      ),
      about: _getAboutText(symbol, isArabic: isArabic),
      chartData: chartData,
    );
  }

  // Helper methods
  static String _getStockName(String symbol) {
    final Map<String, String> names = {
      'AAPL': 'Apple Inc.',
      'MSFT': 'Microsoft Corporation',
      'GOOGL': 'Alphabet Inc.',
      'AMZN': 'Amazon.com Inc.',
      'TSLA': 'Tesla Inc.',
      'NVDA': 'NVIDIA Corporation',
      'META': 'Meta Platforms Inc.',
      'AMD': 'Advanced Micro Devices Inc.',
      'INTC': 'Intel Corporation',
      'IBM': 'International Business Machines',
    };
    return names[symbol] ?? '$symbol Corporation';
  }

  static double _getStockPrice(String symbol) {
    final Map<String, double> prices = {
      'AAPL': 182.63,
      'MSFT': 402.10,
      'GOOGL': 152.75,
      'AMZN': 178.23,
      'TSLA': 198.80,
      'NVDA': 950.02,
      'META': 485.75,
      'AMD': 160.50,
      'INTC': 44.20,
      'IBM': 187.30,
    };
    return prices[symbol] ?? 100.0;
  }

  static double _getPriceChange(String symbol) {
    final Map<String, double> changes = {
      'AAPL': 1.24,
      'MSFT': 0.82,
      'GOOGL': -0.45,
      'AMZN': 2.15,
      'TSLA': 2.15,
      'NVDA': 5.20,
      'META': -1.25,
      'AMD': -0.54,
      'INTC': 0.35,
      'IBM': -0.20,
    };
    return changes[symbol] ?? 0.0;
  }

  static double _getPriceChangePercent(String symbol) {
    final Map<String, double> changes = {
      'AAPL': 1.24,
      'MSFT': 0.82,
      'GOOGL': -0.45,
      'AMZN': 2.15,
      'TSLA': 2.15,
      'NVDA': 5.20,
      'META': -1.25,
      'AMD': -0.54,
      'INTC': 0.35,
      'IBM': -0.20,
    };
    return changes[symbol] ?? 0.0;
  }

  static double _getMarketCap(String symbol) {
    final Map<String, double> marketCaps = {
      'AAPL': 2800.0, // في الواقع 2.8T
      'MSFT': 3000.0,
      'GOOGL': 1900.0,
      'AMZN': 1800.0,
      'TSLA': 630.0,
      'NVDA': 2300.0,
      'META': 1250.0,
      'AMD': 260.0,
      'INTC': 185.0,
      'IBM': 170.0,
    };
    return marketCaps[symbol] ?? 100.0;
  }

  static double _getPERatio(String symbol) {
    final Map<String, double> peRatios = {
      'AAPL': 29.5,
      'MSFT': 35.2,
      'GOOGL': 28.7,
      'AMZN': 60.5,
      'TSLA': 42.3,
      'NVDA': 74.8,
      'META': 32.1,
      'AMD': 230.5,
      'INTC': 112.3,
      'IBM': 22.7,
    };
    return peRatios[symbol] ?? 25.0;
  }

  static double _getDividendYield(String symbol) {
    final Map<String, double> yields = {
      'AAPL': 0.52,
      'MSFT': 0.73,
      'GOOGL': 0.0,
      'AMZN': 0.0,
      'TSLA': 0.0,
      'NVDA': 0.02,
      'META': 0.0,
      'AMD': 0.0,
      'INTC': 1.05,
      'IBM': 3.85,
    };
    return yields[symbol] ?? 0.0;
  }

  static double _getAvgVolume(String symbol) {
    final Map<String, double> volumes = {
      'AAPL': 54.2,
      'MSFT': 28.5,
      'GOOGL': 31.7,
      'AMZN': 42.8,
      'TSLA': 105.3,
      'NVDA': 47.6,
      'META': 18.9,
      'AMD': 62.4,
      'INTC': 45.2,
      'IBM': 4.8,
    };
    return volumes[symbol] ?? 10.0;
  }

  static String _getAuraSignal(String symbol) {
    final Map<String, String> signals = {
      'AAPL': 'STRONG BUY',
      'MSFT': 'BUY',
      'GOOGL': 'HOLD',
      'AMZN': 'BUY',
      'TSLA': 'STRONG BUY',
      'NVDA': 'STRONG BUY',
      'META': 'HOLD',
      'AMD': 'BUY',
      'INTC': 'SELL',
      'IBM': 'HOLD',
    };
    return signals[symbol] ?? 'HOLD';
  }

  static int _getAuraScore(String symbol) {
    final Map<String, int> scores = {
      'AAPL': 92,
      'MSFT': 85,
      'GOOGL': 65,
      'AMZN': 78,
      'TSLA': 88,
      'NVDA': 95,
      'META': 62,
      'AMD': 72,
      'INTC': 42,
      'IBM': 58,
    };
    return scores[symbol] ?? 50;
  }

  static String _getAuraConfidence(String symbol, {required bool isArabic}) {
    if (isArabic) {
      return 'ثقة الذكاء الاصطناعي مرتفعة بناء على نتائج الأرباح الأخيرة وزخم المؤسسات الإيجابي.';
    }
    return "AI confidence is high based on recent earnings reports and positive institutional sentiment.";
  }

  static List<String> _getRecommendationReasons(
    String symbol, {
    required bool isArabic,
  }) {
    if (isArabic) {
      return [
        'نمو الإيرادات يتجاوز متوسط القطاع بنسبة 15%.',
        'تدفقات نقدية قوية وميزانية عمومية متينة.',
        'نظرة إيجابية من المحللين مع 85% تقييمات شراء.',
        'خط إنتاج الابتكار يُظهر منتجات واعدة مستقبلًا.',
        'ريادة سوقية في قطاعات النمو الرئيسية.',
      ];
    }

    return [
      "Revenue growth exceeds sector average by 15%.",
      "Strong cash flow generation and balance sheet.",
      "Positive analyst sentiment with 85% buy ratings.",
      "Innovation pipeline shows promising future products.",
      "Market leadership in key growth segments.",
    ];
  }

  static String _getAboutText(String symbol, {required bool isArabic}) {
    if (isArabic) {
      final Map<String, String> aboutTextsAr = {
        'AAPL':
            'شركة Apple Inc. تقوم بتصميم وتصنيع وتسويق الهواتف الذكية وأجهزة الكمبيوتر الشخصية والأجهزة اللوحية والأجهزة القابلة للارتداء والملحقات على مستوى العالم. وتقدم iPhone وMac وiPad وAirPods وApple TV وApple Watch ومنتجات Beats وHomePod، إضافة إلى خدمات AppleCare والخدمات السحابية ومنصات مثل App Store وApple Music وApple Pay وiCloud.',
        'MSFT':
            'شركة Microsoft Corporation تطور وتمنح تراخيص وتدعم البرمجيات والخدمات والأجهزة والحلول حول العالم. وتعمل الشركة عبر ثلاثة قطاعات: الإنتاجية وعمليات الأعمال، والسحابة الذكية، والحوسبة الشخصية الأكثر قربًا للمستخدم.',
        'TSLA':
            'شركة Tesla, Inc. تصمم وتطور وتصنع وتؤجر وتبيع المركبات الكهربائية وحلول توليد وتخزين الطاقة في الولايات المتحدة والصين ودوليًا. وتعمل الشركة عبر قطاعين رئيسيين: السيارات، وتوليد وتخزين الطاقة.',
        'NVDA':
            'شركة NVIDIA Corporation تقدم حلول الرسوميات والحوسبة والشبكات في الولايات المتحدة وتايوان والصين ودوليًا. ويشمل قطاع الرسوميات معالجات GeForce للألعاب والحواسيب وخدمة GeForce NOW وبنية تحتية مرتبطة بها.',
      };
      return aboutTextsAr[symbol] ??
          '$symbol Corporation شركة رائدة في قطاعها مع موقع سوقي قوي وآفاق نمو جيدة. تركز الشركة على الابتكار ورضا العملاء لدعم قيمة مستدامة للمساهمين على المدى الطويل.';
    }

    final Map<String, String> aboutTexts = {
      'AAPL':
          "Apple Inc. designs, manufactures, and markets smartphones, personal computers, tablets, wearables, and accessories worldwide. The company offers iPhone, Mac, iPad, AirPods, Apple TV, Apple Watch, Beats products, and HomePod. It also provides AppleCare support and cloud services, and operates various platforms including the App Store, Apple Music, Apple Pay, and iCloud.",
      'MSFT':
          "Microsoft Corporation develops, licenses, and supports software, services, devices, and solutions worldwide. The company operates in three segments: Productivity and Business Processes, Intelligent Cloud, and More Personal Computing.",
      'TSLA':
          "Tesla, Inc. designs, develops, manufactures, leases, and sells electric vehicles, and energy generation and storage systems in the United States, China, and internationally. The company operates in two segments, Automotive, and Energy Generation and Storage.",
      'NVDA':
          "NVIDIA Corporation provides graphics, and compute and networking solutions in the United States, Taiwan, China, and internationally. The company's Graphics segment offers GeForce GPUs for gaming and PCs, the GeForce NOW game streaming service and related infrastructure.",
    };
    return aboutTexts[symbol] ??
        "$symbol Corporation is a leading company in its industry with strong market position and growth prospects. The company focuses on innovation and customer satisfaction to drive long-term shareholder value.";
  }
}

class ChartPoint {
  final DateTime time;
  final double price;

  ChartPoint({required this.time, required this.price});
}
