import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key});

  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  bool _isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Theme(
          data: ThemeData(
            unselectedWidgetColor: AppColors.greyText.withOpacity(0.5),
          ),
          child: Checkbox(
            value: _isAccepted,
            activeColor: AppColors.secondaryColor,
            checkColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            onChanged: (value) {
              setState(() {
                _isAccepted = value ?? false;
              });
            },
          ),
        ),

        Expanded(
          child: RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodySmall,
              children: [
                const TextSpan(text: "I agree to the "),
                TextSpan(
                  text: "Terms and Conditions",
                  style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const TextSpan(text: " and "),
                TextSpan(
                  text: "Privacy Policy",
                  style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const TextSpan(text: "."),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
