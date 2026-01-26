import 'package:aura_app/src/features/forget_password/widgets/animated_icon.dart';
import 'package:aura_app/src/shared/componants/custom_button.dart';
import 'package:aura_app/src/shared/routing/route_strings.dart';
import 'package:flutter/material.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final List<TextEditingController> _otpControllers = List.generate(
    4,
    (index) => TextEditingController(),
  );

  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),

        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 40),
              buildAnimatedLockIcon(Icons.mark_email_read_outlined),

              const SizedBox(height: 40),
              Text(
                "Verify Email",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 5),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: AppColors.greyText),
                  children: [
                    const TextSpan(text: "Please enter the code sent to \n"),
                    TextSpan(
                      text: "name*******@aura.ai",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) => _buildOTPBox(index)),
              ),

              const SizedBox(height: 30),

              Text(
                "Resend code in 00:59",
                style: TextStyle(
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 40),
              AuraButton(
                title: "Verify code",
                onPressed: () {
                  Navigator.pushNamed(context, Routes.createNewPassword);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOTPBox(int index) {
    return SizedBox(
      width: 70,
      height: 80,
      child: TextFormField(
        controller: _otpControllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          counterText: "",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: AppColors.secondaryColor,
              width: 2,
            ),
          ),
          fillColor: AppColors.cardColor.withOpacity(0.5),
          filled: true,
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            _focusNodes[index + 1].requestFocus();
          }
        },
      ),
    );
  }
}
