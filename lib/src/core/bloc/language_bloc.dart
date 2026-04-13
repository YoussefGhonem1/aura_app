import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'language_event.dart';
import 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageInitial()) {
    on<ChangeLanguageEvent>(_onChangeLanguage);
    on<ToggleLanguageEvent>(_onToggleLanguage);
  }

  Future<void> _onChangeLanguage(
    ChangeLanguageEvent event,
    Emitter<LanguageState> emit,
  ) async {
    final locale = event.languageCode == 'ar'
        ? const Locale('ar')
        : const Locale('en');
    emit(LanguageChanged(locale: locale));
  }

  Future<void> _onToggleLanguage(
    ToggleLanguageEvent event,
    Emitter<LanguageState> emit,
  ) async {
    final currentLanguage = state.locale.languageCode;
    final newLanguage = currentLanguage == 'ar' ? 'en' : 'ar';
    final locale = newLanguage == 'ar'
        ? const Locale('ar')
        : const Locale('en');
    emit(LanguageChanged(locale: locale));
  }

  // Helper getters
  String get languageCode => state.locale.languageCode;

  bool get isArabic => state.locale.languageCode == 'ar';

  bool get isEnglish => state.locale.languageCode == 'en';

  void changeLanguage(String languageCode) {
    add(ChangeLanguageEvent(languageCode));
  }

  void toggleLanguage() {
    add(const ToggleLanguageEvent());
  }
}
