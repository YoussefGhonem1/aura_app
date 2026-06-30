// lib/models/stock_model.dart
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
  final String auraReason;

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

  // Analysis
  final String aiAnalysis;
  final String analysisUpdated;

  // Sentiment
  final String marketMood;
  final int sentimentScore;

  // Technical Indicators
  final double rsi;
  final String rsiStatus;

  final String macd;
  final String macdStatus;

  final double ma50;
  final String ma50Status;

  final String volumeVolatility;
  final String volumeStatus;

  // Price Drivers
  final List<PriceDriver> priceDrivers;

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
    required this.auraReason,
    required this.aiAnalysis,
    required this.analysisUpdated,
    required this.marketMood,
    required this.sentimentScore,
    required this.rsi,
    required this.rsiStatus,
    required this.macd,
    required this.macdStatus,
    required this.ma50,
    required this.ma50Status,
    required this.volumeVolatility,
    required this.volumeStatus,
    required this.priceDrivers,
  });

  // Factory method لإنشاء نموذج وهمي للاختبار
  factory StockModel.dummy(String symbol) {
    List<ChartPoint> chartData = [];
    double currentPrice = _getStockPrice(symbol);
    double basePrice = currentPrice * 0.95; // السعر بدأ أقل قليلاً

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

    double rsiValue = _getRsi(symbol);
    double ma50Value = _getMa50(symbol, currentPrice);

    return StockModel(
      symbol: symbol,
      name: _getStockName(symbol),
      exchange: 'EGX', // البورصة المصرية
      currentPrice: currentPrice,
      priceChange: _getPriceChange(symbol),
      priceChangePercent: _getPriceChangePercent(symbol),
      isPositive: _getPriceChange(symbol) > 0,
      sector: _getSector(symbol),
      industry: _getIndustry(symbol),
      marketCap: _getMarketCap(symbol),
      peRatio: _getPERatio(symbol),
      dividendYield: _getDividendYield(symbol),
      avgVolume: _getAvgVolume(symbol),
      auraSignal: _getAuraSignal(symbol),
      auraScore: _getAuraScore(symbol),
      auraConfidence: _getAuraConfidence(symbol),
      recommendationReasons: _getRecommendationReasons(symbol),
      about: _getAboutText(symbol),
      chartData: chartData,
      auraReason: _getAuraReason(symbol),
      
      // Fields الجديدة
      aiAnalysis: _getAiAnalysis(symbol),
      analysisUpdated: "مُحدث منذ 15 دقيقة",
      marketMood: _getMarketMood(symbol),
      sentimentScore: _getSentimentScore(symbol),
      rsi: rsiValue,
      rsiStatus: _getRsiStatus(rsiValue),
      macd: _getMacd(symbol),
      macdStatus: _getMacdStatus(symbol),
      ma50: ma50Value,
      ma50Status: currentPrice > ma50Value ? "اتجاه صاعد قوي" : "اتجاه هابط مؤقت",
      volumeVolatility: _getVolumeVolatility(symbol),
      volumeStatus: _getVolumeStatus(symbol),
      priceDrivers: _getPriceDrivers(symbol),
    );
  }

  static String _getAuraReason(String symbol) {
    final Map<String, String> reasons = {
      'COMI': "ارتفاع جودة الأرباح واستقرار الأداء المالي مع قوة المركز المصرفي وزيادة ثقة المستثمرين.",
      'FWRY': "نمو قطاع المدفوعات الرقمية وزيادة استخدام الخدمات الإلكترونية يدعمان فرص النمو المستقبلية.",
      'TMGH': "قوة المبيعات العقارية والمشروعات الجديدة تدعم توقعات النمو على المدى المتوسط.",
      'HRHO': "تحسن نتائج الأنشطة المالية وزيادة الإيرادات التشغيلية يعززان النظرة الإيجابية للسهم.",
      'SWDY': "استقرار أعمال الطاقة والبنية التحتية مع توسع المشاريع يدعم الاحتفاظ بالسهم.",
      'ETEL': "قوة التدفقات النقدية وتنوع الخدمات الرقمية تدعم الأداء المالي للشركة.",
      'EFIH': "النمو المستمر في حلول الدفع الإلكتروني يعزز فرص التوسع وزيادة الأرباح.",
      'ESRS': "تحسن الطلب على منتجات الحديد وزيادة كفاءة التشغيل يدعمان توقعات السهم.",
      'ABUK': "قوة قطاع الأسمدة واستقرار الطلب العالمي يدعمان الأداء المستقبلي للشركة.",
      'EKHO': "تنوع الاستثمارات وتحسن نتائج الشركات التابعة يدعمان القيمة الاستثمارية.",
    };

    return reasons[symbol] ?? "تحليل الذكاء الاصطناعي يشير إلى وجود فرص نمو بناءً على البيانات المالية وحركة التداول.";
  }

  // Helper methods
  static String _getStockName(String symbol) {
    final Map<String, String> names = {
      'COMI': 'البنك التجاري الدولي',
      'FWRY': 'فوري لتكنولوجيا البنوك',
      'TMGH': 'مجموعة طلعت مصطفى القابضة',
      'HRHO': 'إي إف جي القابضة (هيرميس)',
      'SWDY': 'السويدي إليكتريك',
      'ETEL': 'المصرية للاتصالات',
      'EFIH': 'إي فاينانس للاستثمارات',
      'ESRS': 'حديد عز',
      'ABUK': 'أبو قير للأسمدة',
      'EKHO': 'القابضة المصرية الكويتية',
    };
    return names[symbol] ?? '$symbol - شركة مدرجة';
  }

  static String _getSector(String symbol) {
    final Map<String, String> sectors = {
      'COMI': 'البنوك',
      'FWRY': 'التكنولوجيا والمدفوعات',
      'TMGH': 'العقارات',
      'HRHO': 'الخدمات المالية',
      'SWDY': 'الصناعة والطاقة',
      'ETEL': 'الاتصالات والتكنولوجيا',
      'EFIH': 'التكنولوجيا والمدفوعات',
      'ESRS': 'الموارد الأساسية',
      'ABUK': 'الموارد الأساسية',
      'EKHO': 'الخدمات المالية',
    };
    return sectors[symbol] ?? 'متنوع';
  }

  static String _getIndustry(String symbol) {
    return "السوق المصري - EGX30";
  }

  static double _getStockPrice(String symbol) {
    final Map<String, double> prices = {
      'COMI': 82.50, 'FWRY': 18.20, 'TMGH': 94.00, 'HRHO': 26.40,
      'SWDY': 85.00, 'ETEL': 90.00, 'EFIH': 24.50, 'ESRS': 88.00,
      'ABUK': 75.00, 'EKHO': 55.00,
    };
    return prices[symbol] ?? 100.0;
  }

  static double _getPriceChange(String symbol) {
    final Map<String, double> changes = {
      'COMI': 1.20, 'FWRY': -0.15, 'TMGH': 2.50, 'HRHO': 0.10,
      'SWDY': -0.40, 'ETEL': -1.20, 'EFIH': 0.35, 'ESRS': 3.10,
      'ABUK': 1.05, 'EKHO': -0.80,
    };
    return changes[symbol] ?? 0.0;
  }

  static double _getPriceChangePercent(String symbol) {
    final Map<String, double> changes = {
      'COMI': 1.45, 'FWRY': -0.82, 'TMGH': 2.66, 'HRHO': 0.38,
      'SWDY': -0.47, 'ETEL': -1.33, 'EFIH': 1.43, 'ESRS': 3.65,
      'ABUK': 1.40, 'EKHO': -1.45,
    };
    return changes[symbol] ?? 0.0;
  }

  static double _getMarketCap(String symbol) {
    final Map<String, double> marketCaps = {
      'COMI': 250.5, 'FWRY': 31.2, 'TMGH': 190.8, 'HRHO': 30.5,
      'SWDY': 92.4, 'ETEL': 154.0, 'EFIH': 45.3, 'ESRS': 48.0,
      'ABUK': 95.0, 'EKHO': 52.0,
    };
    return marketCaps[symbol] ?? 10.0;
  }

  static double _getPERatio(String symbol) {
    final Map<String, double> peRatios = {
      'COMI': 7.2, 'FWRY': 35.4, 'TMGH': 12.8, 'HRHO': 9.5,
      'SWDY': 6.8, 'ETEL': 5.1, 'EFIH': 22.3, 'ESRS': 4.8,
      'ABUK': 6.2, 'EKHO': 7.9,
    };
    return peRatios[symbol] ?? 8.0;
  }

  static double _getDividendYield(String symbol) {
    final Map<String, double> yields = {
      'COMI': 3.5, 'FWRY': 0.0, 'TMGH': 1.2, 'HRHO': 2.1,
      'SWDY': 2.5, 'ETEL': 4.0, 'EFIH': 0.8, 'ESRS': 0.0,
      'ABUK': 8.5, 'EKHO': 0.0,
    };
    return yields[symbol] ?? 0.0;
  }

  static double _getAvgVolume(String symbol) {
    final Map<String, double> volumes = {
      'COMI': 5.2, 'FWRY': 12.5, 'TMGH': 4.3, 'HRHO': 8.1,
      'SWDY': 2.9, 'ETEL': 1.8, 'EFIH': 6.4, 'ESRS': 3.5,
      'ABUK': 1.2, 'EKHO': 0.9,
    };
    return volumes[symbol] ?? 1.0;
  }

  static String _getAuraSignal(String symbol) {
    final Map<String, String> signals = {
      'COMI': 'شراء قوي', 'FWRY': 'شراء', 'TMGH': 'شراء قوي',
      'HRHO': 'شراء', 'SWDY': 'احتفاظ', 'ETEL': 'شراء',
      'EFIH': 'شراء قوي', 'ESRS': 'شراء قوي', 'ABUK': 'شراء',
      'EKHO': 'احتفاظ',
    };
    return signals[symbol] ?? 'احتفاظ';
  }

  static int _getAuraScore(String symbol) {
    final Map<String, int> scores = {
      'COMI': 92, 'FWRY': 78, 'TMGH': 88, 'HRHO': 75,
      'SWDY': 62, 'ETEL': 80, 'EFIH': 85, 'ESRS': 95,
      'ABUK': 72, 'EKHO': 58,
    };
    return scores[symbol] ?? 50;
  }

  static String _getAuraConfidence(String symbol) {
    return "ثقة ذكاء Aura عالية بناءً على التقارير المالية الأخيرة ومعنويات السوق الإيجابية وتدفق السيولة.";
  }

  static List<String> _getRecommendationReasons(String symbol) {
    return [
      "نمو الإيرادات يتجاوز متوسط القطاع بنسبة ملحوظة.",
      "تدفقات نقدية قوية وقدرة عالية على سداد الالتزامات.",
      "توصيات المحللين الفنيين تشير إلى اختراق مستويات مقاومة هامة.",
      "توسع استراتيجي قوي في الأسواق الإقليمية والخليجية.",
      "إدارة كفؤة للنفقات التشغيلية لتعظيم الأرباح.",
    ];
  }

  static String _getAboutText(String symbol) {
    final Map<String, String> aboutTexts = {
      'COMI': "يعد البنك التجاري الدولي (CIB) أكبر بنك قطاع خاص في مصر، ويقدم مجموعة واسعة من الخدمات المصرفية للشركات والأفراد، ويتميز بحصة سوقية قوية في البورصة المصرية ويعد السهم القيادي الأول.",
      'FWRY': "شركة فوري هي الرائدة في مجال تكنولوجيا المدفوعات والخدمات المالية الرقمية في مصر، وتخدم الملايين من خلال شبكة واسعة من نقاط البيع والتطبيقات.",
      'TMGH': "مجموعة طلعت مصطفى هي المطور العقاري الأكبر في مصر، وتشتهر بتطوير مدن سكنية متكاملة (مثل مدينتي والرحاب) ومشاريع سياحية كبرى.",
      'SWDY': "شركة السويدي إليكتريك هي شركة عالمية متخصصة في حلول الطاقة والبنية التحتية، ولديها نشاط تصنيعي وتجاري واسع في العديد من الدول الأفريقية والعربية.",
    };
    return aboutTexts[symbol] ?? "$symbol هي شركة رائدة في قطاعها بالسوق المصري، وتتمتع بمركز مالي مستقر وآفاق نمو واعدة، مع تركيز مستمر على الابتكار ورضا العملاء لتعظيم القيمة للمساهمين.";
  }

  // --- دوال الحقول الجديدة ---
  
  static String _getAiAnalysis(String symbol) {
    final Map<String, String> aiAnalysisData = {
      'COMI': "يظهر السهم استقراراً مؤسسياً ملحوظاً مع توقعات بتوزيعات أرباح مجزية. المؤشرات الفنية تدعم استمرار المسار الصاعد بدعم من قطاع البنوك.",
      'TMGH': "طفرة المبيعات الأخيرة والمشاريع الاستراتيجية الجديدة تنعكس إيجاباً على تقييم السهم، السيولة الداخلة تؤكد الاتجاه الشرائي.",
      'FWRY': "بعد فترة من التجميع، يظهر السهم إشارات ارتداد إيجابية. يعتمد الأداء القادم على إعلانات الشراكات في قطاع التكنولوجيا المالية.",
      'ESRS': "ارتفاع أسعار المعادن عالمياً مع كفاءة التشغيل يمنح السهم زخماً قوياً لاختراق قمم جديدة."
    };
    return aiAnalysisData[symbol] ?? "يشير التحليل المدمج (الأساسي والفني) إلى أداء متوازن للسهم مقارنة بمؤشر السوق الرئيسي، مع فرص لاقتناص مراكز شرائية عند دعوم السهم.";
  }

  static String _getMarketMood(String symbol) {
    int score = _getAuraScore(symbol);
    if (score >= 85) return "تفاؤل شديد";
    if (score >= 70) return "إيجابي";
    if (score >= 50) return "محايد";
    return "حذر";
  }

  static int _getSentimentScore(String symbol) {
    // نسبة المشاعر الإيجابية بناءً على الـ Aura Score مع اختلاف بسيط
    return (_getAuraScore(symbol) * 0.95).round();
  }

  static double _getRsi(String symbol) {
    final Map<String, double> rsiValues = {
      'COMI': 65.5, 'FWRY': 45.2, 'TMGH': 72.1, 'HRHO': 58.4,
      'SWDY': 42.0, 'ETEL': 55.6, 'EFIH': 68.3, 'ESRS': 78.5,
      'ABUK': 60.1, 'EKHO': 38.5,
    };
    return rsiValues[symbol] ?? 50.0;
  }

  static String _getRsiStatus(double rsi) {
    if (rsi > 70) return "تشبع شرائي";
    if (rsi < 30) return "تشبع بيعي";
    if (rsi > 50) return "زخم إيجابي";
    return "زخم سلبي";
  }

  static String _getMacd(String symbol) {
    final Map<String, String> macdValues = {
      'COMI': "+1.45", 'FWRY': "-0.25", 'TMGH': "+2.10", 'HRHO': "+0.15",
      'SWDY': "-0.80", 'ETEL': "+0.60", 'EFIH': "+1.10", 'ESRS': "+3.05",
      'ABUK': "+0.90", 'EKHO': "-1.20",
    };
    return macdValues[symbol] ?? "+0.00";
  }

  static String _getMacdStatus(String symbol) {
    String macdVal = _getMacd(symbol);
    if (macdVal.startsWith("+")) return "تقاطع إيجابي لأعلى";
    return "تقاطع سلبي لأسفل";
  }

  static double _getMa50(String symbol, double currentPrice) {
    // تقريب المتوسط المتحرك لـ 50 يوم بناءً على السعر الحالي للتجربة
    if (currentPrice > 50) return currentPrice * 0.92;
    return currentPrice * 1.05; 
  }

  static String _getVolumeVolatility(String symbol) {
    double vol = _getAvgVolume(symbol);
    if (vol > 8.0) return "تقلبات عالية السيولة";
    if (vol > 3.0) return "تداول نشط متوسط";
    return "سيولة هادئة";
  }

  static String _getVolumeStatus(String symbol) {
    int score = _getAuraScore(symbol);
    if (score >= 75) return "تجميع قوي (شراء مؤسسي)";
    if (score >= 50) return "استقرار وتدوير سيولة";
    return "ضغوط بيعية (تصريف)";
  }

  static List<PriceDriver> _getPriceDrivers(String symbol) {
    final Map<String, List<PriceDriver>> drivers = {
      'COMI': [
        PriceDriver(title: "قرارات الفائدة", description: "تأثير مباشر لقرارات البنك المركزي على هوامش ربحية البنك."),
        PriceDriver(title: "استثمارات أجنبية", description: "دخول صناديق استثمار أجنبية وعربية للسهم بصفته القيادي الأول."),
      ],
      'TMGH': [
        PriceDriver(title: "مشروع ساوث ميد", description: "مبيعات قياسية في الساحل الشمالي تدعم الإيرادات المستقبلية."),
        PriceDriver(title: "التوسع الإقليمي", description: "تطورات إيجابية في مشروع مدينة بنان بالمملكة العربية السعودية."),
      ],
      'FWRY': [
        PriceDriver(title: "الشمول المالي", description: "توجهات الدولة لتقليل التعامل النقدي تدفع نمو الشركة."),
        PriceDriver(title: "تطبيق MyFawry", description: "زيادة مطردة في عدد المستخدمين النشطين للتطبيق."),
      ],
      'ESRS': [
        PriceDriver(title: "أسعار الصلب عالمياً", description: "ارتباط وثيق بأسعار الخردة والحديد في الأسواق العالمية."),
        PriceDriver(title: "المشروعات القومية", description: "استمرار الطلب المحلي القوي بسبب مشاريع البنية التحتية."),
      ]
    };

    return drivers[symbol] ?? [
      PriceDriver(title: "نتائج الأعمال ربع السنوية", description: "تترقب الأسواق الإفصاح عن القوائم المالية ونسب النمو."),
      PriceDriver(title: "سيولة السوق (EGX)", description: "تأثر السهم بحالة الزخم والسيولة العامة في البورصة المصرية."),
      PriceDriver(title: "أخبار القطاع", description: "تغيرات تنظيمية أو اقتصادية تؤثر على قطاع الشركة المباشر.")
    ];
  }
}

class ChartPoint {
  final DateTime time;
  final double price;

  ChartPoint({required this.time, required this.price});
}

class PriceDriver {
  final String title;
  final String description;

  const PriceDriver({
    required this.title,
    required this.description,
  });
}