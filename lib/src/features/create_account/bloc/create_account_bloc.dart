import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:aura_app/src/core/network/api_client.dart';
import 'package:aura_app/src/features/login/models/login_request_model.dart';
import 'package:aura_app/src/features/login/repository/login_repository.dart';

import '../models/oauth_request_model.dart';
import '../models/register_request_model.dart';
import '../repository/create_account_repository.dart';
import 'create_account_event.dart';
import 'create_account_state.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  CreateAccountBloc(this._repository, this._loginRepository)
    : super(const CreateAccountState()) {
    on<CreateAccountUsernameChanged>(_onUsernameChanged);
    on<CreateAccountEmailChanged>(_onEmailChanged);
    on<CreateAccountPasswordChanged>(_onPasswordChanged);
    on<CreateAccountTermsChanged>(_onTermsChanged);
    on<CreateAccountPasswordVisibilityToggled>(_onPasswordVisibilityToggled);
    on<CreateAccountSubmitted>(_onSubmitted);
    on<CreateAccountProviderRequested>(_onProviderRequested);
  }

  final CreateAccountRepository _repository;
  final LoginRepository _loginRepository;

  void _onUsernameChanged(
    CreateAccountUsernameChanged event,
    Emitter<CreateAccountState> emit,
  ) {
    emit(state.copyWith(username: event.username, clearMessage: true));
  }

  void _onEmailChanged(
    CreateAccountEmailChanged event,
    Emitter<CreateAccountState> emit,
  ) {
    emit(state.copyWith(email: event.email, clearMessage: true));
  }

  void _onPasswordChanged(
    CreateAccountPasswordChanged event,
    Emitter<CreateAccountState> emit,
  ) {
    emit(state.copyWith(password: event.password, clearMessage: true));
  }

  void _onTermsChanged(
    CreateAccountTermsChanged event,
    Emitter<CreateAccountState> emit,
  ) {
    emit(state.copyWith(isAcceptedTerms: event.accepted, clearMessage: true));
  }

  void _onPasswordVisibilityToggled(
    CreateAccountPasswordVisibilityToggled event,
    Emitter<CreateAccountState> emit,
  ) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  Future<void> _onSubmitted(
    CreateAccountSubmitted event,
    Emitter<CreateAccountState> emit,
  ) async {
    if (!state.canSubmit) {
      emit(
        state.copyWith(
          status: CreateAccountStatus.failure,
          message: 'All fields are required and terms must be accepted.',
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        status: CreateAccountStatus.loading,
        clearMessage: true,
        clearUser: true,
        clearToken: true,
      ),
    );

    try {
      await _repository.register(
        RegisterRequestModel(
          username: state.username.trim(),
          email: state.email.trim(),
          password: state.password,
          acceptedTerms: state.isAcceptedTerms,
        ),
      );

      final session = await _loginRepository.login(
        LoginRequestModel(email: state.email.trim(), password: state.password),
      );

      emit(
        state.copyWith(
          status: CreateAccountStatus.success,
          user: session.user,
          token: session.token,
          message: session.message,
        ),
      );
    } on ApiException catch (error) {
      emit(
        state.copyWith(
          status: CreateAccountStatus.failure,
          message: error.message,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: CreateAccountStatus.failure,
          message: 'Something went wrong. Please try again.',
        ),
      );
    }
  }

  Future<void> _onProviderRequested(
    CreateAccountProviderRequested event,
    Emitter<CreateAccountState> emit,
  ) async {
    if (state.username.trim().isEmpty || state.email.trim().isEmpty) {
      emit(
        state.copyWith(
          status: CreateAccountStatus.failure,
          message: 'Username and email are required for social sign up.',
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        status: CreateAccountStatus.loading,
        clearMessage: true,
        clearUser: true,
        clearToken: true,
      ),
    );

    try {
      final session = await _repository.loginWithProvider(
        OAuthRequestModel(
          username: state.username.trim(),
          email: state.email.trim(),
          authProvider: event.provider,
        ),
      );

      emit(
        state.copyWith(
          status: CreateAccountStatus.success,
          user: session.user,
          token: session.token,
          message: session.message,
        ),
      );
    } on ApiException catch (error) {
      emit(
        state.copyWith(
          status: CreateAccountStatus.failure,
          message: error.message,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: CreateAccountStatus.failure,
          message: 'Something went wrong. Please try again.',
        ),
      );
    }
  }
}
