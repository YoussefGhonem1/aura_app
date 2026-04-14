import 'package:flutter/material.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';

class FaceIDButton extends StatelessWidget {
  final VoidCallback onPressed;

  const FaceIDButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withOpacity(0.1), width: 1.5),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/face_id.png', width: 50, height: 50),
            Text(
              context.l10n.signInWithFaceId,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
