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

// بيانات واقعية للأسهم (EGX)
final List<HoldingModel> holdings = [
  HoldingModel(
    symbol: "COMI",
    name: "CIB Egypt",
    price: "EGP 126.89",
    change: "+ 0.52%",
    color: Colors.green,
    chartData: [124.5, 125.2, 125.8, 126.1, 126.5, 126.89],
  ),
  HoldingModel(
    symbol: "TMGH",
    name: "TMG Holding",
    price: "جم 93.20",
    change: "- 2.36%",
    color: Colors.red,
    chartData: [95.5, 94.8, 94.2, 93.8, 93.5, 93.2],
  ),
  HoldingModel(
    symbol: "SWDY",
    name: "Elsewedy Electric",
    price: "EGP 84.99",
    change: "- 0.19%",
    color: Colors.red,
    chartData: [85.5, 85.3, 85.1, 85.0, 84.9, 84.99],
  ),
  HoldingModel(
    symbol: "HRHO",
    name: "EFG Hermes",
    price: "EGP 26.42",
    change: "+ 0.08%",
    color: Colors.green,
    chartData: [26.2, 26.3, 26.35, 26.38, 26.4, 26.42],
  ),
];

final List<HoldingModel> topAIPicks = [
  HoldingModel(
    symbol: "COMI",
    name: "CIB Egypt",
    price: "EGP 126.89",
    change: "+ 0.52%",
    color: Colors.green,
    chartData: [124.5, 125.2, 125.8, 126.1, 126.5, 126.89],
  ),
  HoldingModel(
    symbol: "FWRY",
    name: "Fawry",
    price: "EGP 18.30",
    change: "+ 1.10%",
    color: Colors.green,
    chartData: [17.8, 17.9, 18.0, 18.1, 18.2, 18.3],
  ),
  HoldingModel(
    symbol: "EFIH",
    name: "e-finance",
    price: "EGP 24.50",
    change: "+ 0.95%",
    color: Colors.green,
    chartData: [23.5, 23.8, 24.0, 24.2, 24.4, 24.5],
  ),
  HoldingModel(
    symbol: "ETEL",
    name: "Telecom Egypt",
    price: "EGP 90.00",
    change: "- 1.10%",
    color: Colors.red,
    chartData: [91.5, 91.2, 90.8, 90.5, 90.2, 90.0],
  ),
];
