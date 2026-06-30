class StockPickModel {
  final String symbol;
  final String company;
  final String signal;
  final String peRatio;
  final String upside;

  StockPickModel({
    required this.symbol,
    required this.company,
    required this.signal,
    required this.peRatio,
    required this.upside,
  });
}

List<StockPickModel> stockPicks = [
  StockPickModel(
    symbol: "COMI.CA",
    company: "البنك التجاري الدولي",
    signal: "شراء قوي",
    peRatio: "7.2",
    upside: "+27%",
  ),
  StockPickModel(
    symbol: "FWRY.CA",
    company: "فوري لتكنولوجيا البنوك والمدفوعات",
    signal: "شراء",
    peRatio: "35.4",
    upside: "+18%",
  ),
  StockPickModel(
    symbol: "TMGH.CA",
    company: "مجموعة طلعت مصطفى القابضة",
    signal: "شراء قوي",
    peRatio: "12.8",
    upside: "+32%",
  ),
  StockPickModel(
    symbol: "HRHO.CA",
    company: "إي إف جي القابضة",
    signal: "شراء",
    peRatio: "9.5",
    upside: "+15%",
  ),
  StockPickModel(
    symbol: "SWDY.CA",
    company: "السويدي إليكتريك",
    signal: "احتفاظ",
    peRatio: "6.8",
    upside: "+8%",
  ),
  StockPickModel(
    symbol: "ETEL.CA",
    company: "المصرية للاتصالات",
    signal: "شراء",
    peRatio: "5.1",
    upside: "+21%",
  ),
  StockPickModel(
    symbol: "EFIH.CA",
    company: "إي فاينانس للاستثمارات المالية",
    signal: "شراء قوي",
    peRatio: "22.3",
    upside: "+24%",
  ),
  StockPickModel(
    symbol: "EAST.CA",
    company: "الشرقية للدخان",
    signal: "احتفاظ",
    peRatio: "8.4",
    upside: "+5%",
  ),
  StockPickModel(
    symbol: "ABUK.CA",
    company: "أبو قير للأسمدة والصناعات الكيماوية",
    signal: "شراء",
    peRatio: "6.2",
    upside: "+14%",
  ),
  StockPickModel(
    symbol: "EKHO.CA",
    company: "القابضة المصرية الكويتية",
    signal: "شراء",
    peRatio: "7.9",
    upside: "+19%",
  ),
  StockPickModel(
    symbol: "AMOC.CA",
    company: "الإسكندرية للزيوت المعدنية - أموك",
    signal: "احتفاظ",
    peRatio: "5.5",
    upside: "+6%",
  ),
  StockPickModel(
    symbol: "ESRS.CA",
    company: "حديد عز",
    signal: "شراء قوي",
    peRatio: "4.8",
    upside: "+35%",
  ),
  StockPickModel(
    symbol: "HELI.CA",
    company: "مصر الجديدة للإسكان والتعمير",
    signal: "شراء",
    peRatio: "14.2",
    upside: "+22%",
  ),
  StockPickModel(
    symbol: "ORWE.CA",
    company: "النساجون الشرقيون",
    signal: "شراء",
    peRatio: "8.7",
    upside: "+16%",
  ),
  StockPickModel(
    symbol: "CIRA.CA",
    company: "القاهرة للاستثمار والتنمية العقارية",
    signal: "احتفاظ",
    peRatio: "18.5",
    upside: "+9%",
  ),
  StockPickModel(
    symbol: "MFPC.CA",
    company: "موبكو للأسمدة",
    signal: "شراء قوي",
    peRatio: "5.9",
    upside: "+28%",
  ),
  StockPickModel(
    symbol: "ISPH.CA",
    company: "ابن سينا فارما",
    signal: "شراء",
    peRatio: "25.1",
    upside: "+17%",
  ),
  StockPickModel(
    symbol: "PHDC.CA",
    company: "بالم هيلز للتعمير",
    signal: "شراء",
    peRatio: "11.3",
    upside: "+20%",
  ),
  StockPickModel(
    symbol: "MNHD.CA",
    company: "مدينة مصر للإسكان والتعمير",
    signal: "شراء قوي",
    peRatio: "9.8",
    upside: "+25%",
  ),
  StockPickModel(
    symbol: "SUGR.CA",
    company: "الدلتا للسكر",
    signal: "احتفاظ",
    peRatio: "4.2",
    upside: "+4%",
  ),
];
