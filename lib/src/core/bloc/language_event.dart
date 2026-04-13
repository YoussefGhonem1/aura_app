abstract class LanguageEvent {
  const LanguageEvent();
}

class ChangeLanguageEvent extends LanguageEvent {
  final String languageCode;

  const ChangeLanguageEvent(this.languageCode);
}

class ToggleLanguageEvent extends LanguageEvent {
  const ToggleLanguageEvent();
}
