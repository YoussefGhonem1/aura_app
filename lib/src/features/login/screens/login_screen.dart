import 'package:aura_app/src/features/create_account/widgets/social_driver.dart';
import 'package:aura_app/src/features/forget_password/widgets/build_validation_item.dart';
import 'package:aura_app/src/features/login/bloc/bloc_exports.dart';
import 'package:aura_app/src/features/login/widgets/face_id_button.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/shared/componants/auth_option.dart';
import 'package:aura_app/src/shared/componants/custom_button.dart';
import 'package:aura_app/src/shared/componants/text_form.dart';
import 'package:aura_app/src/shared/routing/route_strings.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _syncEmail(LoginBloc bloc, String value) {
    bloc.add(LoginEmailChanged(value));
  }

  void _syncPassword(LoginBloc bloc, String value) {
    bloc.add(LoginPasswordChanged(value));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.isSuccess) {
          Navigator.pushReplacementNamed(context, Routes.layoutScreen);
          return;
        }

        if (state.isFailure && state.message != null) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.message!)));
        }
      },
      builder: (context, state) {
        final loginBloc = context.read<LoginBloc>();
        final bool passwordHasError =
            state.password.isNotEmpty && state.password.length < 8;
        final bool hasUppercase = state.password.contains(RegExp(r'[A-Z]'));
        final bool hasNumber = state.password.contains(RegExp(r'[0-9]'));

        return Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 60),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.secondaryColor.withValues(
                            alpha: 0.15,
                          ),
                          blurRadius: 20,
                          spreadRadius: -12,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/auth_leading.png',
                      width: 120,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  context.tr('Welcome Back', 'مرحبًا بعودتك'),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 5),
                Text(
                  context.tr(
                    'Your intelligent investment portfolio is ready',
                    'محفظتك الاستثمارية الذكية جاهزة',
                  ),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 40),
                AuraTextField(
                  label: context.tr('Email Address', 'البريد الإلكتروني'),
                  hintText: context.tr('name@example.com', 'name@example.com'),
                  controller: _emailController,
                  onChanged: (value) => _syncEmail(loginBloc, value),
                ),
                const SizedBox(height: 20),
                AuraTextField(
                  label: context.l10n.password,
                  hintText: context.l10n.password,
                  isPassword: true,
                  obscureText: !state.isPasswordVisible,
                  hasError: passwordHasError,
                  controller: _passwordController,
                  onChanged: (value) => _syncPassword(loginBloc, value),
                  onToggleObscure: () =>
                      loginBloc.add(const LoginPasswordVisibilityToggled()),
                  tooltipContent: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildValidationItem(
                        context.tr('At least 8 characters', '8 أحرف على الأقل'),
                        state.password.length >= 8,
                      ),
                      buildValidationItem(
                        context.tr('One uppercase letter', 'حرف كبير واحد'),
                        hasUppercase,
                      ),
                      buildValidationItem(
                        context.tr('One number', 'رقم واحد'),
                        hasNumber,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.forgetPassword);
                    },
                    child: Text(
                      context.l10n.forgetPassword,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                AuraButton(
                  title: state.isSubmitting
                      ? context.tr('Signing in...', 'جاري تسجيل الدخول...')
                      : context.l10n.signIn,
                  onPressed: state.isSubmitting
                      ? () {}
                      : () {
                          loginBloc.add(const LoginSubmitted());
                        },
                ),
                const SizedBox(height: 20),
                AuthOptionWidget(
                  mainText: context.tr(
                    'Don\'t have an account?',
                    'ليس لديك حساب؟',
                  ),
                  actionText: context.l10n.signUp,
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.createAccount,
                    );
                  },
                ),
                const SizedBox(height: 30),
                buildSocialDivider(
                  context,
                  context.tr('Or continue with', 'أو تابع عبر'),
                ),
                const SizedBox(height: 20),
                FaceIDButton(onPressed: () {}),
              ],
            ),
          ),
        );
      },
    );
  }
}
