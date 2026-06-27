import 'package:flutter/material.dart';

Widget buildSocialDivider(BuildContext context, String text) {
  return Row(
    children: [
      Expanded(
        child: Divider(
          color: Colors.white.withValues(alpha: 0.3),
          thickness: 1,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(text, style: Theme.of(context).textTheme.bodySmall),
      ),
      Expanded(
        child: Divider(
          color: Colors.white.withValues(alpha: 0.3),
          thickness: 1,
        ),
      ),
    ],
  );
}
