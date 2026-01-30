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
    symbol: "INTC",
    company: "Intel Corporation",
    signal: "STRONG BUY",
    peRatio: "15.4",
    upside: "+24%",
  ),
  StockPickModel(
    symbol: "PYPL",
    company: "PayPal Holdings",
    signal: "BUY",
    peRatio: "12.1",
    upside: "+18%",
  ),
  StockPickModel(
    symbol: "NVDA",
    company: "NVIDIA Corporation",
    signal: "STRONG BUY",
    peRatio: "35.2",
    upside: "+42%",
  ),
  StockPickModel(
    symbol: "AAPL",
    company: "Apple Inc.",
    signal: "BUY",
    peRatio: "28.7",
    upside: "+15%",
  ),
  StockPickModel(
    symbol: "TSLA",
    company: "Tesla Inc.",
    signal: "HOLD",
    peRatio: "62.3",
    upside: "+8%",
  ),
  StockPickModel(
    symbol: "MSFT",
    company: "Microsoft Corporation",
    signal: "STRONG BUY",
    peRatio: "32.1",
    upside: "+22%",
  ),
  StockPickModel(
    symbol: "AMZN",
    company: "Amazon.com Inc.",
    signal: "BUY",
    peRatio: "58.9",
    upside: "+19%",
  ),
  StockPickModel(
    symbol: "GOOGL",
    company: "Alphabet Inc.",
    signal: "BUY",
    peRatio: "24.6",
    upside: "+17%",
  ),
];