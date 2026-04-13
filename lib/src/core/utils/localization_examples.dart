// This file contains examples of how to use localization throughout the app

import 'package:flutter/material.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';

/// Example usage of localization strings across different widgets

class LocalizationExamples {
  /// Authentication strings
  static String loginTitle(BuildContext context) => context.l10n.login;
  static String createAccountTitle(BuildContext context) =>
      context.l10n.createAccount;

  /// Form fields
  static String emailHint(BuildContext context) => context.l10n.email;
  static String passwordHint(BuildContext context) => context.l10n.password;

  /// Buttons
  static String signInButton(BuildContext context) => context.l10n.signIn;
  static String signUpButton(BuildContext context) => context.l10n.signUp;
  static String logoutButton(BuildContext context) => context.l10n.logout;

  /// Navigation
  static String homeTab(BuildContext context) => context.l10n.home;
  static String portfolioTab(BuildContext context) => context.l10n.portfolio;
  static String stocksTab(BuildContext context) => context.l10n.stocks;
  static String profileTab(BuildContext context) => context.l10n.profile;

  /// Status/Messages
  static String loading(BuildContext context) => context.l10n.loading;
  static String error(BuildContext context) => context.l10n.error;
  static String success(BuildContext context) => context.l10n.success;
  static String noInternet(BuildContext context) => context.l10n.noInternet;

  /// Common actions
  static String save(BuildContext context) => context.l10n.save;
  static String cancel(BuildContext context) => context.l10n.cancel;
  static String delete(BuildContext context) => context.l10n.delete;
  static String edit(BuildContext context) => context.l10n.edit;
  static String back(BuildContext context) => context.l10n.back;
}

/// Helper widget examples

class LocalizedButton extends StatelessWidget {
  final String labelKey;
  final VoidCallback onPressed;
  final bool isPrimary;

  const LocalizedButton({
    super.key,
    required this.labelKey,
    required this.onPressed,
    this.isPrimary = true,
  });

  @override
  Widget build(BuildContext context) {
    return isPrimary
        ? ElevatedButton(onPressed: onPressed, child: Text(labelKey))
        : OutlinedButton(onPressed: onPressed, child: Text(labelKey));
  }
}

class LocalizedSnackBar {
  static void show(BuildContext context, String messageKey) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(messageKey)));
  }
}

/// Example in a Form Widget
class LocalizedFormExample extends StatelessWidget {
  const LocalizedFormExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: context.l10n.email,
            labelText: context.l10n.email,
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: context.l10n.password,
            labelText: context.l10n.password,
          ),
          obscureText: true,
        ),
      ],
    );
  }
}
