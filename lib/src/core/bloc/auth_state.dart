sealed class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class OnboardingRequired extends AuthState {
  const OnboardingRequired();
}

class Authenticated extends AuthState {
  const Authenticated(this.token);

  final String token;
}

class Unauthenticated extends AuthState {
  const Unauthenticated();
}
