import 'package:aura_app/src/features/smart_automation/widgets/build_appbar.dart';
import 'package:aura_app/src/features/smart_automation/widgets/build_order_value_card.dart';
import 'package:aura_app/src/features/smart_automation/widgets/build_set_automation_button.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SmartAutomationScreen extends StatefulWidget {
  const SmartAutomationScreen({super.key});

  @override
  State<SmartAutomationScreen> createState() => _SmartAutomationScreenState();
}

class _SmartAutomationScreenState extends State<SmartAutomationScreen> {
  String _selectedStock = "NVIDIA Corp (NVDA)";
  String _action = "Buy";

  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  double get _orderValue {
    final price = double.tryParse(_priceController.text) ?? 0;
    final qty = double.tryParse(_quantityController.text) ?? 0;
    return price * qty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        context.l10n.smartAutomationTitle,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: AppColors.secondaryColor,
              size: 24,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _label(context.l10n.stockSelector),
            _dropdown(),

            const SizedBox(height: 24),
            _label(context.l10n.action),
            _actionToggle(),

            const SizedBox(height: 24),
            _label(context.l10n.targetPrice),
            _priceInput(),

            const SizedBox(height: 24),
            _label(context.l10n.quantity),
            _quantityInput(),

            const SizedBox(height: 24),
            orderValueCard(context, _orderValue),

            const SizedBox(height: 24),
            setAutomationButton(context),

            const SizedBox(height: 16),
            Text(
              context
                  .l10n
                  .bySettingThisAutomationAuraAiWillMonitorMarketConditionsToExecuteYourOrderAtTheTargetPrice,
              style: const TextStyle(
                color: AppColors.greyText,
                fontSize: 12,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      style: const TextStyle(color: AppColors.greyText, fontSize: 14),
    ),
  );

  Widget _dropdown() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedStock,
          dropdownColor: AppColors.cardColor,
          isExpanded: true,
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.greyText,
          ),
          style: const TextStyle(color: AppColors.white),
          items: ["NVIDIA Corp (NVDA)", "Apple Inc (AAPL)", "Tesla Inc (TSLA)"]
              .map((e) {
                return DropdownMenuItem<String>(
                  value: e,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      e,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                );
              })
              .toList(),
          onChanged: (value) => setState(() => _selectedStock = value!),

          borderRadius: BorderRadius.circular(12),
          elevation: 8,

          iconEnabledColor: AppColors.secondaryColor,

          selectedItemBuilder: (BuildContext context) {
            return [
              "NVIDIA Corp (NVDA)",
              "Apple Inc (AAPL)",
              "Tesla Inc (TSLA)",
            ].map<Widget>((String item) {
              return Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  item,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList();
          },
        ),
      ),
    );
  }

  Widget _actionToggle() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: ['Buy', 'Sell'].map((e) {
          final selected = _action == e;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _action = e),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: selected
                      ? AppColors.secondaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    _localizedActionLabel(context, e),
                    style: TextStyle(
                      color: selected
                          ? AppColors.primaryColor
                          : AppColors.greyText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  String _localizedActionLabel(BuildContext context, String value) {
    switch (value) {
      case 'Buy':
        return context.l10n.buy;
      case 'Sell':
        return context.l10n.sell;
      default:
        return value;
    }
  }

  Widget _priceInput() {
    return _inputField(
      controller: _priceController,
      hint: "0.00",
      prefix: "\$",
      suffix: "USD",
      keyboard: TextInputType.number,
    );
  }

  Widget _quantityInput() {
    return _inputField(
      controller: _quantityController,
      hint: context.l10n.shares,
      suffixWidget: GestureDetector(
        onTap: () => setState(() => _quantityController.text = "100"),
        child: Column(
          children: [
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                context.l10n.max,
                style: const TextStyle(
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      keyboard: TextInputType.number,
    );
  }

  Widget _inputField({
    required TextEditingController controller,
    required String hint,
    String? prefix,
    String? suffix,
    Widget? suffixWidget,
    TextInputType? keyboard,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboard,
        style: const TextStyle(color: AppColors.white),
        onChanged: (_) => setState(() {}),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(color: AppColors.greyText),
          prefixText: prefix,
          suffixText: suffix,
          suffixIcon: suffixWidget != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: suffixWidget,
                )
              : null,
        ),
      ),
    );
  }
}
