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

  const AuraTextField({
    required this.label,
    required this.hintText,
    this.isPassword = false,
    this.hasError = false,
    this.suffixIcon,
    this.controller,
    this.tooltipContent,
    super.key,
  });

  @override
  State<AuraTextField> createState() => _AuraTextFieldState();
}

class _AuraTextFieldState extends State<AuraTextField> {
  late bool _obscureText;
  final GlobalKey<TooltipState> _tooltipKey = GlobalKey<TooltipState>();

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  void _showTooltip() {
    _tooltipKey.currentState?.ensureTooltipVisible();
  }

  @override
  Widget build(BuildContext context) {
    final Color infoIconColor = widget.hasError
        ? Colors.redAccent
        : AppColors.secondaryColor.withOpacity(0.8);

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
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: widget.hasError
                        ? Colors.redAccent
                        : AppColors.secondaryColor.withOpacity(0.3),
                  ),
                ),
                richMessage: WidgetSpan(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
          obscureText: _obscureText,
          onChanged: (value) {
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
                      _obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
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
