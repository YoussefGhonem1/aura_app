sealed class CreateAccountEvent {
  const CreateAccountEvent();
}

class CreateAccountUsernameChanged extends CreateAccountEvent {
  const CreateAccountUsernameChanged(this.username);

  final String username;
}

class CreateAccountEmailChanged extends CreateAccountEvent {
  const CreateAccountEmailChanged(this.email);

  final String email;
}

class CreateAccountPasswordChanged extends CreateAccountEvent {
  const CreateAccountPasswordChanged(this.password);

  final String password;
}

class CreateAccountTermsChanged extends CreateAccountEvent {
  const CreateAccountTermsChanged(this.accepted);

  final bool accepted;
}

class CreateAccountPasswordVisibilityToggled extends CreateAccountEvent {
  const CreateAccountPasswordVisibilityToggled();
}

class CreateAccountSubmitted extends CreateAccountEvent {
  const CreateAccountSubmitted();
}

class CreateAccountProviderRequested extends CreateAccountEvent {
  const CreateAccountProviderRequested(this.provider);

  final String provider;
}
