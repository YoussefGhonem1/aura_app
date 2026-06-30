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
            const SizedBox(height: 8),
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
            month: context.tr('OCTOBER 2025', 'أكتوبر 2025'),

            transactions: [
              buildTransactionItem(
                symbol: "COMI",
                auraPick: true,
                amount: -8250.00,
                type: "شراء بسعر السوق",
                date: "24 أكتوبر",
                status: "تم التنفيذ",
                statusColor: Colors.green,
              ),

              buildTransactionItem(
                symbol: "TMGH",
                amount: 9400.00,
                type: "بيع بأمر محدد",
                date: "22 أكتوبر",
                status: "تم التنفيذ",
                statusColor: Colors.green,
              ),

              buildTransactionItem(
                symbol: "FWRY",
                auraPick: true,
                amount: -1820.00,
                type: "شراء بسعر السوق",
                date: "18 أكتوبر",
                status: "تم التنفيذ",
                statusColor: Colors.green,
              ),

              buildTransactionItem(
                symbol: "SWDY",
                amount: -4250.00,
                type: "شراء بأمر محدد",
                date: "15 أكتوبر",
                status: "قيد الانتظار",
                statusColor: Colors.orange,
              ),
            ],
          ),

          const SizedBox(height: 24),

          _buildMonthSection(
            month: context.tr('SEPTEMBER 2025', 'سبتمبر 2025'),

            transactions: [
              buildTransactionItem(
                symbol: "ETEL",
                amount: 350.00,
                type: "استلام توزيعات نقدية",
                date: "28 سبتمبر",
                status: "مكتمل",
                statusColor: Colors.green,
              ),

              buildTransactionItem(
                symbol: "إيداع",
                amount: 50000.00,
                type: "تحويل بنكي",
                date: "20 سبتمبر",
                status: "ناجح",
                statusColor: Colors.green,
              ),

              buildTransactionItem(
                symbol: "EFIH",
                amount: 2450.00,
                type: "بيع بسعر السوق",
                date: "12 سبتمبر",
                status: "تم التنفيذ",
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
