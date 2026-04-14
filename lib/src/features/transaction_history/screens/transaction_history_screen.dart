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
      appBar: buildAppBar(context, context.l10n.transactionHistory),
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
          _buildFilterTab(context.l10n.all, isSelected: true),
          _buildFilterTab(context.l10n.buy),
          _buildFilterTab(context.l10n.sell),
          _buildFilterTab(context.l10n.pending),
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
            month: context.l10n.october2023,
            transactions: [
              buildTransactionItem(
                context: context,
                symbol: "AAPL",
                auraPick: true,
                amount: -145.22,
                type: context.l10n.buyMarketOrder,
                date: context.l10n.oct24,
                status: context.l10n.filled,
                statusColor: Colors.green,
              ),
              buildTransactionItem(
                context: context,
                symbol: "TSLA",
                amount: 3200.00,
                type: context.l10n.sellLimitOrder,
                date: context.l10n.oct22,
                status: context.l10n.filled,
                statusColor: Colors.green,
              ),
              buildTransactionItem(
                context: context,
                symbol: "NVDA",
                auraPick: true,
                amount: -840.50,
                type: context.l10n.buyMarketOrder,
                date: context.l10n.oct18,
                status: context.l10n.filled,
                statusColor: Colors.green,
              ),
              buildTransactionItem(
                context: context,
                symbol: "AMZN",
                amount: -125.00,
                type: context.l10n.buyLimitOrder,
                date: context.l10n.oct15,
                status: context.l10n.pending,
                statusColor: Colors.orange,
              ),
            ],
          ),

          const SizedBox(height: 24),

          // SEPTEMBER 2023 Section
          _buildMonthSection(
            month: context.l10n.september2023,
            transactions: [
              buildTransactionItem(
                context: context,
                symbol: "MSFT",
                amount: 12.45,
                type: context.l10n.dividendReceived,
                date: context.l10n.sep28,
                status: context.l10n.completed,
                statusColor: Colors.green,
              ),
              buildTransactionItem(
                context: context,
                symbol: context.l10n.deposit,
                amount: 5000.00,
                type: context.l10n.bankTransfer,
                date: context.l10n.sep20,
                status: "Success",
                statusColor: Colors.green,
              ),
              buildTransactionItem(
                context: context,
                symbol: "COIN",
                amount: 1450.00,
                type: context.l10n.sellMarketOrder,
                date: context.l10n.sep12,
                status: context.l10n.filled,
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
