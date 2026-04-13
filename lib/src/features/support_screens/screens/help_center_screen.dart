import 'package:aura_app/src/features/smart_automation/widgets/build_appbar.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class HelpCenterScreenEnhanced extends StatefulWidget {
  const HelpCenterScreenEnhanced({super.key});

  @override
  State<HelpCenterScreenEnhanced> createState() =>
      _HelpCenterScreenEnhancedState();
}

class _HelpCenterScreenEnhancedState extends State<HelpCenterScreenEnhanced> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _recentSearches(BuildContext context) => [
    context.tr('How to reset password', 'كيفية إعادة تعيين كلمة المرور'),
    context.tr('API documentation', 'توثيق API'),
    context.tr('Subscription plans', 'خطط الاشتراك'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: buildAppBar(context, context.l10n.helpCenter),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section with Search
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.secondaryColor.withOpacity(0.1),
                    AppColors.primaryColor.withOpacity(0.9),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.help_center_rounded,
                          color: AppColors.secondaryColor,
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.helpCenter,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                context.tr(
                                  'Find answers to common questions',
                                  'اعثر على إجابات للأسئلة الشائعة',
                                ),
                                style: TextStyle(
                                  color: AppColors.greyText,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Enhanced Search Bar
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.secondaryColor.withOpacity(0.3),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.secondaryColor.withOpacity(0.1),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search_rounded,
                                color: AppColors.secondaryColor,
                                size: 22,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: TextField(
                                  controller: _searchController,
                                  style: const TextStyle(
                                    color: AppColors.white,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: context.tr(
                                      'Search FAQ...',
                                      'ابحث في الأسئلة الشائعة...',
                                    ),
                                    hintStyle: TextStyle(
                                      color: AppColors.greyText,
                                      fontSize: 15,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (value) {
                                    // Handle search
                                  },
                                ),
                              ),
                              if (_searchController.text.isNotEmpty)
                                IconButton(
                                  icon: const Icon(
                                    Icons.clear_rounded,
                                    color: AppColors.greyText,
                                    size: 18,
                                  ),
                                  onPressed: () {
                                    _searchController.clear();
                                    setState(() {});
                                  },
                                ),
                            ],
                          ),
                        ),

                        // Recent Searches
                        if (_recentSearches(context).isNotEmpty)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context.tr(
                                    'Recent searches',
                                    'عمليات البحث الأخيرة',
                                  ),
                                  style: TextStyle(
                                    color: AppColors.greyText,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: _recentSearches(context).map((
                                    search,
                                  ) {
                                    return GestureDetector(
                                      onTap: () {
                                        _searchController.text = search;
                                        setState(() {});
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.cardColor,
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          border: Border.all(
                                            color: AppColors.greyText
                                                .withOpacity(0.2),
                                          ),
                                        ),
                                        child: Text(
                                          search,
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Content Sections
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Common Categories Section
                  Container(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 16,
                      right: 16,
                      bottom: 16,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      borderRadius: BorderRadius.circular(20),
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
                                color: AppColors.secondaryColor.withOpacity(
                                  0.2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.category_rounded,
                                color: AppColors.secondaryColor,
                                size: 22,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              context.tr('Common Categories', 'الفئات الشائعة'),
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1.4,
                          children: [
                            _buildEnhancedCategoryCard(
                              title: context.tr('Getting Started', 'البدء'),
                              description: context.tr(
                                'Setup guides & tutorials',
                                'أدلة الإعداد والشروحات',
                              ),
                              icon: Icons.rocket_launch_rounded,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue.withOpacity(0.8),
                                  Colors.blue.withOpacity(0.4),
                                ],
                              ),
                            ),
                            _buildEnhancedCategoryCard(
                              title: context.tr(
                                'AI Analysis',
                                'تحليل الذكاء الاصطناعي',
                              ),
                              description: context.tr(
                                'Understand predictions',
                                'افهم التوقعات',
                              ),
                              icon: Icons.insights_rounded,
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.secondaryColor.withOpacity(0.8),
                                  AppColors.secondaryColor.withOpacity(0.4),
                                ],
                              ),
                            ),
                            _buildEnhancedCategoryCard(
                              title: context.tr(
                                'Account Security',
                                'أمان الحساب',
                              ),
                              description: context.tr(
                                '2FA & privacy settings',
                                'إعدادات التحقق الثنائي والخصوصية',
                              ),
                              icon: Icons.lock_rounded,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.green.withOpacity(0.8),
                                  Colors.green.withOpacity(0.4),
                                ],
                              ),
                            ),
                            _buildEnhancedCategoryCard(
                              title: context.tr(
                                'Billing & Plan',
                                'الفوترة والخطة',
                              ),
                              description: context.tr(
                                'Manage subscriptions',
                                'إدارة الاشتراكات',
                              ),
                              icon: Icons.credit_card_rounded,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.purple.withOpacity(0.8),
                                  Colors.purple.withOpacity(0.4),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Popular Articles Section
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      borderRadius: BorderRadius.circular(20),
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
                                color: AppColors.secondaryColor.withOpacity(
                                  0.2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.trending_up_rounded,
                                color: AppColors.secondaryColor,
                                size: 22,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              context.tr(
                                'Popular Articles',
                                'المقالات الشائعة',
                              ),
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        _buildEnhancedArticleItem(
                          title: context.tr(
                            'How to export my data?',
                            'كيف أقوم بتصدير بياناتي؟',
                          ),
                          description: context.tr(
                            'Step-by-step guide for data',
                            'دليل خطوة بخطوة للبيانات',
                          ),
                          icon: Icons.download_rounded,
                          views: context.tr('1.2k views', '1.2 ألف مشاهدة'),
                        ),
                        _buildEnhancedArticleItem(
                          title: context.tr(
                            'Connecting Aura to Apple Health',
                            'ربط Aura مع Apple Health',
                          ),
                          description: context.tr(
                            'Integrate with tracking apps',
                            'تكامل مع تطبيقات التتبع',
                          ),
                          icon: Icons.health_and_safety_rounded,
                          views: context.tr('856 views', '856 مشاهدة'),
                        ),
                        _buildEnhancedArticleItem(
                          title: context.tr(
                            'Managing your 2FA settings',
                            'إدارة إعدادات التحقق الثنائي',
                          ),
                          description: context.tr(
                            'Enhance account security',
                            'تعزيز أمان الحساب',
                          ),
                          icon: Icons.security_rounded,
                          views: context.tr('2.3k views', '2.3 ألف مشاهدة'),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // 24/7 Support Section
                  _build24_7SupportSection(),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEnhancedCategoryCard({
    required String title,
    required String description,
    required IconData icon,
    required Gradient gradient,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          // Navigate to category
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: Colors.white, size: 22),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEnhancedArticleItem({
    required String title,
    required String description,
    required IconData icon,
    required String views,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Open article
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: AppColors.secondaryColor, size: 22),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            description,
                            style: TextStyle(
                              color: AppColors.greyText,
                              fontSize: 12,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            views,
                            style: TextStyle(
                              color: AppColors.greyText.withOpacity(0.7),
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.greyText.withOpacity(0.5),
                  size: 22,
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 1,
          color: AppColors.greyText.withOpacity(0.1),
          margin: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ],
    );
  }

  Widget _build24_7SupportSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.secondaryColor.withOpacity(0.15),
            AppColors.primaryColor.withOpacity(0.9),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.secondaryColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.support_agent_rounded,
                  color: Colors.black,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr('Still need help?', 'ما زلت تحتاج مساعدة؟'),
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      context.tr(
                        'Our support team is available 24/7',
                        'فريق الدعم متاح على مدار الساعة',
                      ),
                      style: TextStyle(color: AppColors.greyText, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            context.tr(
              'Our support team is available 24/7 to assist you with any questions.',
              'فريق الدعم متاح 24/7 لمساعدتك في أي استفسار.',
            ),
            style: TextStyle(color: AppColors.white, fontSize: 14, height: 1.6),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    // Open email
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: BorderSide(
                      color: AppColors.secondaryColor.withOpacity(0.5),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(
                    Icons.email_rounded,
                    color: AppColors.white,
                    size: 20,
                  ),
                  label: Text(
                    context.tr('Email Support', 'الدعم عبر البريد'),
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Open chat
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(
                    Icons.chat_rounded,
                    color: AppColors.primaryColor,
                    size: 20,
                  ),
                  label: Text(
                    context.tr('Live Chat', 'دردشة مباشرة'),
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
