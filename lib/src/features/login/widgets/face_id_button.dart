import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            Icon(CupertinoIcons.lock, color: Colors.white, size: 22),
            SizedBox(width: 10),
            Text(
              'Sign in with FaceID',
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
