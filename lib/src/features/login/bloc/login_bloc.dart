import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:aura_app/src/core/network/api_client.dart';

import '../models/login_request_model.dart';
import '../repository/login_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._loginRepository) : super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginPasswordVisibilityToggled>(_onPasswordVisibilityToggled);
    on<LoginSubmitted>(_onSubmitted);
  }

  final LoginRepository _loginRepository;

  void _onEmailChanged(LoginEmailChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        email: event.email,
        status: LoginStatus.initial,
        clearMessage: true,
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        password: event.password,
        status: LoginStatus.initial,
        clearMessage: true,
      ),
    );
  }

  void _onPasswordVisibilityToggled(
    LoginPasswordVisibilityToggled event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (!state.canSubmit) {
      emit(
        state.copyWith(
          status: LoginStatus.failure,
          message: 'Email and password are required.',
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        status: LoginStatus.loading,
        clearMessage: true,
        clearUser: true,
        clearToken: true,
      ),
    );

    try {
      final session = await _loginRepository.login(
        LoginRequestModel(email: state.email.trim(), password: state.password),
      );

      emit(
        state.copyWith(
          status: LoginStatus.success,
          user: session.user,
          token: session.token,
          message: session.message,
        ),
      );
    } on ApiException catch (error) {
      emit(state.copyWith(status: LoginStatus.failure, message: error.message));
    } catch (_) {
      emit(
        state.copyWith(
          status: LoginStatus.failure,
          message: 'Something went wrong. Please try again.',
        ),
      );
    }
  }
}
