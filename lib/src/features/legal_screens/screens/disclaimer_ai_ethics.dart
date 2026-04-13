import 'package:aura_app/src/features/smart_automation/widgets/build_appbar.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class DisclaimerScreenEnhanced extends StatelessWidget {
  const DisclaimerScreenEnhanced({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: buildAppBar(
        context,
        context.tr(
          'Disclaimer & AI Ethics',
          'إخلاء المسؤولية وأخلاقيات الذكاء الاصطناعي',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Warning Icon at Top
            Center(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.orange.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: const Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.orange,
                  size: 32,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // NOT FINANCIAL ADVICE Section with Card
            _buildSectionCard(
              title: context.tr('NOT FINANCIAL ADVICE', 'ليست نصيحة مالية'),
              icon: Icons.account_balance_wallet_rounded,
              iconColor: Colors.orange,
              children: [
                Text(
                  context.tr(
                    'Aura AI provides market analysis for educational purposes only. Our forecasts are probabilistic models based on historical patterns, not guarantees of future performance.',
                    'يوفر Aura AI تحليلات للسوق لأغراض تعليمية فقط. توقعاتنا نماذج احتمالية مبنية على أنماط تاريخية وليست ضمانًا للأداء المستقبلي.',
                  ),
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // AI Limitations Section with Card
            _buildSectionCard(
              title: context.tr('AI Limitations', 'قيود الذكاء الاصطناعي'),
              icon: Icons.psychology_rounded,
              iconColor: AppColors.secondaryColor,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      height: 1.6,
                    ),
                    children: [
                      TextSpan(
                        text: context.tr(
                          'Our AI models are trained on vast datasets of historical market data. However, past performance is not indicative of future results.\n\n',
                          'تم تدريب نماذج الذكاء الاصطناعي لدينا على مجموعات كبيرة من البيانات التاريخية للسوق. ومع ذلك، الأداء السابق لا يدل بالضرورة على النتائج المستقبلية.\n\n',
                        ),
                      ),
                      TextSpan(
                        text: context.tr(
                          'The AI may encounter "edge cases," high volatility scenarios, or unprecedented global events (black swan events) that it has not been trained on.',
                          'قد يواجه الذكاء الاصطناعي حالات نادرة، أو تقلبات عالية، أو أحداثًا عالمية غير مسبوقة (البجعة السوداء) لم يتم التدريب عليها.',
                        ),
                        style: TextStyle(
                          color: Colors.orange.withOpacity(0.9),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: context.tr(
                          ' In these instances, predictions may be significantly less accurate or fail to capture the full scope of market risk.',
                          ' في هذه الحالات، قد تكون التوقعات أقل دقة بشكل ملحوظ أو لا تعكس كامل نطاق مخاطر السوق.',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // User Responsibility Section with Card
            _buildSectionCard(
              title: context.tr('User Responsibility', 'مسؤولية المستخدم'),
              icon: Icons.person_rounded,
              iconColor: Colors.blue,
              children: [
                Text(
                  context.tr(
                    'Aura AI is a technology provider, not a registered investment advisor or broker-dealer.',
                    'Aura AI مزود تقنية وليس مستشارًا استثماريًا مسجلًا أو وسيطًا ماليًا.',
                  ),
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 16),
                _buildResponsibilityBullet(
                  icon: Icons.assignment_turned_in_rounded,
                  text: context.tr(
                    'You retain full responsibility for all investment decisions.',
                    'تتحمل المسؤولية الكاملة عن جميع قراراتك الاستثمارية.',
                  ),
                ),
                const SizedBox(height: 12),
                _buildResponsibilityBullet(
                  icon: Icons.search_rounded,
                  text: context.tr(
                    'You should conduct your own due diligence before executing any trade.',
                    'يجب عليك إجراء التحقق اللازم بنفسك قبل تنفيذ أي صفقة.',
                  ),
                ),
                const SizedBox(height: 12),
                _buildResponsibilityBullet(
                  icon: Icons.group_rounded,
                  text: context.tr(
                    'Consider consulting with a qualified financial professional.',
                    'فكّر في استشارة مختص مالي مؤهل.',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Data Sources & Latency Section with Card
            _buildSectionCard(
              title: context.tr(
                'Data Sources & Latency',
                'مصادر البيانات وزمن التأخير',
              ),
              icon: Icons.cloud_sync_rounded,
              iconColor: Colors.green,
              children: [
                Text(
                  context.tr(
                    'Market data feeds may experience latency. While we strive for real-time accuracy, data delays can occur due to connectivity issues or third-party provider outages.',
                    'قد يحدث تأخير في تدفق بيانات السوق. رغم سعينا للدقة الفورية، قد تظهر تأخيرات بسبب مشاكل الاتصال أو أعطال مزودي البيانات الخارجيين.',
                  ),
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.red.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    context.tr(
                      'Do not rely solely on Aura for time-sensitive trade execution.',
                      'لا تعتمد فقط على Aura لتنفيذ الصفقات الحساسة للوقت.',
                    ),
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Bottom Button with Checkbox
            _buildAcknowledgeSection(context),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required Color iconColor,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.greyText.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: iconColor, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildResponsibilityBullet({
    required IconData icon,
    required String text,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.secondaryColor, size: 18),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 14,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAcknowledgeSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.secondaryColor.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondaryColor.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(
                  Icons.check_rounded,
                  color: AppColors.secondaryColor,
                  size: 16,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  context.tr(
                    'By clicking below, I confirm that I have read and understood all the terms and limitations mentioned above.',
                    'بالضغط أدناه، أؤكد أنني قرأت وفهمت جميع الشروط والقيود المذكورة أعلاه.',
                  ),
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Handle acknowledge action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryColor,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                shadowColor: AppColors.secondaryColor.withOpacity(0.4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.verified_user_rounded,
                    color: AppColors.primaryColor,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    context.tr('Understand & Acknowledge', 'فهمت وأوافق'),
                    style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
