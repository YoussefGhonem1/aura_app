import 'package:flutter/material.dart';

class HoldingModel {
  final String symbol;
  final String name;
  final String price;
  final String change;
  final Color color;
  final List<double> chartData;

  HoldingModel({
    required this.symbol,
    required this.name,
    required this.price,
    required this.change,
    required this.color,
    required this.chartData,
  });
}
final List<HoldingModel> holdings = [
  HoldingModel(
    symbol: "AAPL",
    name: "Apple Inc.",
    price: "\$175.42",
    change: "+ 1.45%",
    color: Colors.red,
    chartData: [1.2, 1.8, 1.5, 2.2, 2.8, 3.1],
  ),
  HoldingModel(
    symbol: "TSLA",
    name: "Tesla, Inc.",
    price: "\$240.50",
    change: "- 0.85%",
    color: Colors.orange,
    chartData: [3.5, 3.2, 2.8, 2.5, 2.3, 2.1],
  ),
  HoldingModel(
    symbol: "NVDA",
    name: "NVIDIA Corp",
    price: "\$485.00",
    change: "+ 2.30%",
    color: Colors.green,
    chartData: [1.5, 2.1, 2.8, 2.5, 3.2, 3.8],
  ),
  HoldingModel(
    symbol: "BTC",
    name: "Bitcoin",
    price: "\$34,200",
    change: "+ 0.45%",
    color: Colors.orange,
    chartData: [2.8, 2.6, 2.5, 2.7, 2.4, 2.5],
  ),
];
final List<HoldingModel> topAIPicks = [
  HoldingModel(
    symbol: "AAPL",
    name: "Apple Inc.",
    price: "\$175.42",
    change: "+ 1.45%",
    color: Colors.red,
    chartData: [1.2, 1.8, 1.5, 2.2, 2.8, 3.1],
  ),
  HoldingModel(
    symbol: "TSLA",
    name: "Tesla, Inc.",
    price: "\$240.50",
    change: "+ 0.85%",
    color: Colors.orange,
    chartData: [3.5, 3.2, 2.8, 2.5, 2.3, 2.7],
  ),
  HoldingModel(
    symbol: "NVDA",
    name: "NVIDIA Corp",
    price: "\$485.00",
    change: "+ 2.30%",
    color: Colors.green,
    chartData: [1.5, 2.1, 2.8, 2.5, 3.2, 3.8],
  ),
  HoldingModel(
    symbol: "BTC",
    name: "Bitcoin",
    price: "\$34,200",
    change: "+ 0.45%",
    color: Colors.orange,
    chartData: [2.8, 2.6, 2.5, 2.7, 2.4, 2.5],
  ),
];
