import 'package:flutter/material.dart';

class AnimatedLetter extends StatelessWidget {
  final String char;
  final Animation<Offset> slideAnimation;
  final Animation<double> fadeAnimation;

  const AnimatedLetter({
    required this.char,
    required this.slideAnimation,
    required this.fadeAnimation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: FadeTransition(
        opacity: fadeAnimation,
        child: Text(
          char,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge?.copyWith(letterSpacing: 4),
        ),
      ),
    );
  }
}
