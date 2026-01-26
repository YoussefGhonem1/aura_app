import 'package:flutter/material.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';

class AuraTextField extends StatefulWidget {
  final String hintText;
  final String label;
  final bool isPassword;
  final IconData? suffixIcon;
  final TextEditingController? controller; 

  const AuraTextField({
    required this.label,
    required this.hintText,
    this.isPassword = false,
    this.suffixIcon,
    this.controller,
    super.key,
  });

  @override
  State<AuraTextField> createState() => _AuraTextFieldState();
}

class _AuraTextFieldState extends State<AuraTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white70,
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                      color: AppColors.greyText,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : widget.suffixIcon != null
                    ? Icon(widget.suffixIcon, color: AppColors.greyText)
                    : null,
          ),
        ),
      ],
    );
  }
}