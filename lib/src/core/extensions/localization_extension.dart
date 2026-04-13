import 'package:aura_app/generated_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension AppLocalizationsExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  String tr(String english, String arabic) {
    final localeCode = Localizations.localeOf(this).languageCode;
    return localeCode == 'ar' ? arabic : english;
  }
}
