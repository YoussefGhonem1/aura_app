import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:aura_app/src/core/network/api_client.dart';
import 'package:aura_app/src/core/repository/auth_repository.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository, this._apiClient) : super(const AuthInitial());

  final AuthRepository _authRepository;
  final ApiClient _apiClient;

  Future<void> checkAuthStatus() async {
    emit(const AuthLoading());

    final onboardingCompleted = await _authRepository.isOnboardingCompleted();
    if (!onboardingCompleted) {
      emit(const OnboardingRequired());
      return;
    }

    final token = await _authRepository.getToken();
    if (token != null && token.isNotEmpty) {
      await _apiClient.setAccessToken(token);
      emit(Authenticated(token));
      return;
    }

    emit(const Unauthenticated());
  }

  Future<void> completeOnboarding() async {
    await _authRepository.markOnboardingCompleted();
  }

  Future<void> logout() async {
    emit(const AuthLoading());
    await _authRepository.logout();
    _apiClient.clearAccessToken();
    emit(const Unauthenticated());
  }
}
