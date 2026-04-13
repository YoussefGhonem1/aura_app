import 'package:flutter/material.dart';

abstract class LanguageState {
  final Locale locale;

  const LanguageState({required this.locale});
}

class LanguageInitial extends LanguageState {
  const LanguageInitial() : super(locale: const Locale('ar'));
}

class LanguageChanged extends LanguageState {
  const LanguageChanged({required Locale locale}) : super(locale: locale);
}

class LanguageLoading extends LanguageState {
  const LanguageLoading({required Locale locale}) : super(locale: locale);
}
