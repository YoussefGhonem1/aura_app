import 'package:aura_app/src/features/layout/models/alerts_model.dart';
import 'package:aura_app/src/features/layout/widgets/build_alert_card.dart';
import 'package:flutter/material.dart';

Widget buildAlertsList() {
  return Column(
    children: examples
        .map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: buildHighVolatilityAlertCard(
              symbol: item.symbol,
              title: item.title,
              subtitle: item.subtitle,
              alertLabel: item.alertLabel,
            ),
          ),
        )
        .toList(),
  );
}

// بيانات تجريبية للبورصة المصرية
final List<HighVolatilityAlert> examples = [
  HighVolatilityAlert(
    symbol: 'COMI',
    title: 'ارتفاع ملحوظ في أحجام التداول',
    subtitle: 'حجم التداول أعلى من متوسط آخر 30 جلسة',
    alertLabel: 'تنبيه',
  ),

  HighVolatilityAlert(
    symbol: 'FWRY',
    title: 'تحرك سعري قوي',
    subtitle: 'السهم يشهد نشاطًا شرائيًا ملحوظًا',
    alertLabel: 'مراقبة',
  ),

  HighVolatilityAlert(
    symbol: 'TMGH',
    title: 'اختراق مستوى مقاومة',
    subtitle: 'السهم أغلق أعلى من مستوى المقاومة الرئيسي',
    alertLabel: 'إشارة شراء',
  ),

  HighVolatilityAlert(
    symbol: 'HRHO',
    title: 'زيادة في السيولة',
    subtitle: 'ارتفاع قيمة التداول مقارنة بالجلسة السابقة',
    alertLabel: 'متابعة',
  ),
];
