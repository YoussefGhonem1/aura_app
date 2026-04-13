import 'package:aura_app/src/features/smart_automation/widgets/build_appbar.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ReportBugScreenEnhanced extends StatefulWidget {
  const ReportBugScreenEnhanced({super.key});

  @override
  State<ReportBugScreenEnhanced> createState() =>
      _ReportBugScreenEnhancedState();
}

class _ReportBugScreenEnhancedState extends State<ReportBugScreenEnhanced> {
  String? _selectedCategory;
  final TextEditingController _descriptionController = TextEditingController();
  final List<String> _categories = [
    'App Crash',
    'UI/Display Issue',
    'Performance',
    'Data Sync',
    'Account/Login',
    'AI Analysis',
    'Other',
  ];

  bool _isSubmitting = false;
  List<String> _screenshots = [];
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: buildAppBar(context, context.l10n.reportBug),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Bug Icon
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.secondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.secondaryColor.withOpacity(0.3),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.bug_report_rounded,
                      color: Colors.red,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.reportBug,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          context.tr(
                            'Help us improve Aura. Provide details about the issue you encountered.',
                            'ساعدنا في تحسين Aura. قدم تفاصيل عن المشكلة التي واجهتها.',
                          ),
                          style: TextStyle(
                            color: AppColors.greyText,
                            fontSize: 13,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Bug Category Section
            _buildCategorySection(),

            const SizedBox(height: 32),

            // Description Section
            _buildDescriptionSection(),

            const SizedBox(height: 32),

            // Upload Screenshot Section
            _buildScreenshotSection(),

            // Error Message
            if (_errorMessage != null) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.red.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.error_outline_rounded,
                      color: Colors.red,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        _errorMessage!,
                        style: const TextStyle(color: Colors.red, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            // Divider
            Container(
              height: 1,
              color: AppColors.greyText.withOpacity(0.3),
              margin: const EdgeInsets.symmetric(vertical: 32),
            ),

            // Submit Button
            _buildSubmitButton(),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.secondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.category_rounded,
                color: AppColors.secondaryColor,
                size: 18,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.tr('Bug Category', 'فئة المشكلة'),
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    context.tr('Select a category', 'اختر فئة'),
                    style: TextStyle(color: AppColors.greyText, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: _categories.map((category) {
            bool isSelected = _selectedCategory == category;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedCategory = category;
                  _errorMessage = null;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.secondaryColor
                      : AppColors.cardColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.secondaryColor
                        : AppColors.greyText.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Text(
                  context.tr(
                    category,
                    {
                          'App Crash': 'تعطل التطبيق',
                          'UI/Display Issue': 'مشكلة واجهة/عرض',
                          'Performance': 'الأداء',
                          'Data Sync': 'مزامنة البيانات',
                          'Account/Login': 'الحساب/تسجيل الدخول',
                          'AI Analysis': 'تحليل الذكاء الاصطناعي',
                          'Other': 'أخرى',
                        }[category] ??
                        category,
                  ),
                  style: TextStyle(
                    color: isSelected
                        ? AppColors.primaryColor
                        : AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.secondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.description_rounded,
                color: AppColors.secondaryColor,
                size: 18,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.tr('Description', 'الوصف'),
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    context.tr(
                      'Describe the issue in detail...',
                      'اشرح المشكلة بالتفصيل...',
                    ),
                    style: TextStyle(color: AppColors.greyText, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.greyText.withOpacity(0.2),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextField(
            controller: _descriptionController,
            maxLines: 8,
            style: const TextStyle(color: AppColors.white, fontSize: 14),
            decoration: InputDecoration(
              hintText: context.tr(
                '• Steps to reproduce the bug\n• Expected behavior\n• Actual behavior\n• Device & app version\n• Any error messages',
                '• خطوات إعادة المشكلة\n• السلوك المتوقع\n• السلوك الفعلي\n• إصدار الجهاز والتطبيق\n• أي رسائل خطأ',
              ),
              hintStyle: TextStyle(
                color: AppColors.greyText.withOpacity(0.7),
                fontSize: 13,
                height: 1.6,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(20),
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  _errorMessage = null;
                });
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildScreenshotSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.secondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.photo_rounded,
                color: AppColors.secondaryColor,
                size: 18,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.tr('Upload Screenshot', 'رفع لقطة شاشة'),
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    context.tr(
                      'Optional: Add screenshots to help us understand the issue',
                      'اختياري: أضف لقطات شاشة لمساعدتنا على فهم المشكلة',
                    ),
                    style: TextStyle(color: AppColors.greyText, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Screenshot Preview
        if (_screenshots.isNotEmpty) ...[
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _screenshots.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 120,
                  margin: EdgeInsets.only(
                    right: index == _screenshots.length - 1 ? 0 : 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.greyText.withOpacity(0.3),
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Placeholder for image
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.cardColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.image_rounded,
                            color: AppColors.greyText,
                            size: 40,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _screenshots.removeAt(index);
                            });
                          },
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close_rounded,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
        ],

        // Upload Button
        GestureDetector(
          onTap: _pickImage,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.secondaryColor.withOpacity(0.3),
                width: 2,
              ),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.cloud_upload_rounded,
                  color: AppColors.secondaryColor,
                  size: 48,
                ),
                const SizedBox(height: 16),
                Text(
                  context.tr('Tap to Upload Screenshot', 'اضغط لرفع لقطة شاشة'),
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  context.tr('PNG, JPG up to 5MB', 'PNG, JPG حتى 5MB'),
                  style: TextStyle(color: AppColors.greyText, fontSize: 13),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isSubmitting ? null : _submitReport,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondaryColor,
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          shadowColor: AppColors.secondaryColor.withOpacity(0.4),
        ),
        child: _isSubmitting
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                  strokeWidth: 2,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.send_rounded,
                    color: AppColors.primaryColor,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    context.tr('Submit Report', 'إرسال البلاغ'),
                    style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  void _pickImage() async {
    // Implement image picking logic
    // For example using image_picker package
    // final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    // if (image != null) {
    //   setState(() {
    //     _screenshots.add(image.path);
    //   });
    // }
  }

  void _submitReport() async {
    // Validate form
    if (_selectedCategory == null) {
      setState(() {
        _errorMessage = context.tr(
          'Please select a bug category',
          'يرجى اختيار فئة للمشكلة',
        );
      });
      return;
    }

    if (_descriptionController.text.isEmpty) {
      setState(() {
        _errorMessage = context.tr(
          'Please describe the bug in detail',
          'يرجى وصف المشكلة بالتفصيل',
        );
      });
      return;
    }

    setState(() {
      _isSubmitting = true;
      _errorMessage = null;
    });

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isSubmitting = false;
    });

    // Show success dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          context.tr('Report Submitted!', 'تم إرسال البلاغ!'),
          style: const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          context.tr(
            'Thank you for helping us improve Aura. Our team will review your report and work on a fix.',
            'شكرًا لمساعدتنا في تحسين Aura. سيقوم فريقنا بمراجعة البلاغ والعمل على حل المشكلة.',
          ),
          style: const TextStyle(color: AppColors.greyText),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              context.tr('Close', 'إغلاق'),
              style: const TextStyle(color: AppColors.secondaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
