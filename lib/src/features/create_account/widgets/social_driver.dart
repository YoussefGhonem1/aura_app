import 'package:flutter/material.dart';

Widget buildSocialDivider(BuildContext context) {
  return Row(
    children: [
      Expanded(
        child: Divider(color: Colors.white.withOpacity(0.3), thickness: 1),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          "Or sign up with",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
      Expanded(
        child: Divider(color: Colors.white.withOpacity(0.3), thickness: 1),
      ),
    ],
  );
}
