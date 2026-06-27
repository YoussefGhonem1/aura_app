import 'package:flutter/material.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';

class AuraTextField extends StatefulWidget {
  final String hintText;
  final String label;
  final bool isPassword;
  final bool hasError;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final Widget? tooltipContent;
  final ValueChanged<String>? onChanged;
  final bool? obscureText;
  final VoidCallback? onToggleObscure;

  const AuraTextField({
    required this.label,
    required this.hintText,
    this.isPassword = false,
    this.hasError = false,
    this.suffixIcon,
    this.controller,
    this.tooltipContent,
    this.onChanged,
    this.obscureText,
    this.onToggleObscure,
    super.key,
  });

  @override
  State<AuraTextField> createState() => _AuraTextFieldState();
}

class _AuraTextFieldState extends State<AuraTextField> {
  final GlobalKey<TooltipState> _tooltipKey = GlobalKey<TooltipState>();

  void _showTooltip() {
    _tooltipKey.currentState?.ensureTooltipVisible();
  }

  @override
  Widget build(BuildContext context) {
    final Color infoIconColor = widget.hasError
        ? Colors.redAccent
        : AppColors.secondaryColor.withValues(alpha: 0.8);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white70,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 8),
            if (widget.isPassword && widget.tooltipContent != null)
              Tooltip(
                key: _tooltipKey,
                triggerMode: TooltipTriggerMode.manual,
                verticalOffset: -140,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: widget.hasError
                        ? Colors.redAccent
                        : AppColors.secondaryColor.withValues(alpha: 0.3),
                  ),
                ),
                richMessage: WidgetSpan(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: widget.tooltipContent!,
                  ),
                ),
                child: GestureDetector(
                  onTap: _showTooltip,
                  child: Icon(
                    Icons.info_outline,
                    size: 16,
                    color: infoIconColor,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.obscureText ?? widget.isPassword,
          onChanged: (value) {
            widget.onChanged?.call(value);
            setState(() {});
          },
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: widget.hintText,
            enabledBorder: widget.hasError
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.redAccent,
                      width: 1,
                    ),
                  )
                : null,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      (widget.obscureText ?? widget.isPassword)
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.greyText,
                    ),
                    onPressed: () {
                      widget.onToggleObscure?.call();
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
