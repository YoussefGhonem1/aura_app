import 'package:aura_app/src/features/smart_automation/widgets/build_appbar.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/features/transaction_history/widgets/build_transaction_item.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: buildAppBar(
        context,
        context.tr('Transaction History', 'سجل المعاملات'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildFilterTabs(context),
            SizedBox(height: 8),
            // Transaction List
            _buildTransactionList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterTabs(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildFilterTab(context.tr('All', 'الكل'), isSelected: true),
          _buildFilterTab(context.tr('Buy', 'شراء')),
          _buildFilterTab(context.tr('Sell', 'بيع')),
          _buildFilterTab(context.tr('Pending', 'قيد الانتظار')),
        ],
      ),
    );
  }

  Widget _buildFilterTab(String text, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.secondaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected
              ? AppColors.secondaryColor
              : AppColors.greyText.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? AppColors.primaryColor : AppColors.greyText,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildTransactionList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _buildMonthSection(
            month: context.tr('OCTOBER 2023', 'أكتوبر 2023'),
            transactions: [
              buildTransactionItem(
                symbol: "AAPL",
                auraPick: true,
                amount: -145.22,
                type: "Buy Market Order",
                date: "Oct 24",
                status: "Filled",
                statusColor: Colors.green,
              ),
              buildTransactionItem(
                symbol: "TSLA",
                amount: 3200.00,
                type: "Sell Limit Order",
                date: "Oct 22",
                status: "Filled",
                statusColor: Colors.green,
              ),
              buildTransactionItem(
                symbol: "NVDA",
                auraPick: true,
                amount: -840.50,
                type: "Buy Market Order",
                date: "Oct 18",
                status: "Filled",
                statusColor: Colors.green,
              ),
              buildTransactionItem(
                symbol: "AMZN",
                amount: -125.00,
                type: "Buy Limit Order",
                date: "Oct 15",
                status: "Pending",
                statusColor: Colors.orange,
              ),
            ],
          ),

          const SizedBox(height: 24),

          // SEPTEMBER 2023 Section
          _buildMonthSection(
            month: context.tr('SEPTEMBER 2023', 'سبتمبر 2023'),
            transactions: [
              buildTransactionItem(
                symbol: "MSFT",
                amount: 12.45,
                type: "Dividend Received",
                date: "Sep 28",
                status: "Completed",
                statusColor: Colors.green,
              ),
              buildTransactionItem(
                symbol: "Deposit",
                amount: 5000.00,
                type: "Bank Transfer",
                date: "Sep 20",
                status: "Success",
                statusColor: Colors.green,
              ),
              buildTransactionItem(
                symbol: "COIN",
                amount: 1450.00,
                type: "Sell Market Order",
                date: "Sep 12",
                status: "Filled",
                statusColor: Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMonthSection({
    required String month,
    required List<Widget> transactions,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            month,
            style: TextStyle(
              color: AppColors.greyText,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
        ...transactions,
      ],
    );
  }
}
