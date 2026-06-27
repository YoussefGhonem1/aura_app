import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/features/create_account/bloc/bloc_exports.dart';
import 'package:aura_app/src/features/create_account/widgets/condition_terms.dart';
import 'package:aura_app/src/features/create_account/widgets/social_button.dart';
import 'package:aura_app/src/features/create_account/widgets/social_driver.dart';
import 'package:aura_app/src/features/forget_password/widgets/build_validation_item.dart';
import 'package:aura_app/src/shared/componants/auth_option.dart';
import 'package:aura_app/src/shared/componants/custom_button.dart';
import 'package:aura_app/src/shared/componants/text_form.dart';
import 'package:aura_app/src/shared/routing/route_strings.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _syncUsername(CreateAccountBloc bloc, String value) {
    bloc.add(CreateAccountUsernameChanged(value));
  }

  void _syncEmail(CreateAccountBloc bloc, String value) {
    bloc.add(CreateAccountEmailChanged(value));
  }

  void _syncPassword(CreateAccountBloc bloc, String value) {
    bloc.add(CreateAccountPasswordChanged(value));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateAccountBloc, CreateAccountState>(
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
        final bloc = context.read<CreateAccountBloc>();
        final bool passwordHasError =
            state.password.isNotEmpty && state.password.length < 8;
        final bool hasUppercase = state.password.contains(RegExp(r'[A-Z]'));
        final bool hasNumber = state.password.contains(RegExp(r'[0-9]'));

        return Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 50),
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
                  context.tr('Create your Aura', 'أنشئ حسابك في Aura'),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 5),
                Text(
                  context.tr(
                    'Start your AI-powered investment journey',
                    'ابدأ رحلتك الاستثمارية المدعومة بالذكاء الاصطناعي',
                  ),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 40),
                AuraTextField(
                  label: context.tr('Username', 'اسم المستخدم'),
                  hintText: context.tr('Enter your name', 'أدخل اسمك'),
                  controller: _usernameController,
                  onChanged: (value) => _syncUsername(bloc, value),
                ),
                const SizedBox(height: 20),
                AuraTextField(
                  label: context.tr('Email Address', 'البريد الإلكتروني'),
                  hintText: context.tr('name@example.com', 'name@example.com'),
                  controller: _emailController,
                  onChanged: (value) => _syncEmail(bloc, value),
                ),
                const SizedBox(height: 20),
                AuraTextField(
                  label: context.l10n.password,
                  hintText: context.l10n.password,
                  isPassword: true,
                  obscureText: !state.isPasswordVisible,
                  hasError: passwordHasError,
                  controller: _passwordController,
                  onChanged: (value) => _syncPassword(bloc, value),
                  onToggleObscure: () =>
                      bloc.add(const CreateAccountPasswordVisibilityToggled()),
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
                const SizedBox(height: 15),
                TermsAndConditionsWidget(
                  isAccepted: state.isAcceptedTerms,
                  onChanged: (value) =>
                      bloc.add(CreateAccountTermsChanged(value)),
                ),
                const SizedBox(height: 25),
                AuraButton(
                  title: state.isSubmitting
                      ? context.tr('Creating...', 'جاري الإنشاء...')
                      : context.l10n.createAccount,
                  onPressed: state.isSubmitting
                      ? () {}
                      : () => bloc.add(const CreateAccountSubmitted()),
                ),
                const SizedBox(height: 20),
                AuthOptionWidget(
                  mainText: context.tr(
                    'Already have an account?',
                    'لديك حساب بالفعل؟',
                  ),
                  actionText: context.tr('Log in', 'تسجيل الدخول'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.login);
                  },
                ),
                const SizedBox(height: 30),
                buildSocialDivider(
                  context,
                  context.tr('Or sign up with', 'أو سجّل عبر'),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: SocialLoginButton(
                        label: 'Google',
                        icon: const FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.redAccent,
                          size: 20,
                        ),
                        onTap: state.isSubmitting
                            ? () {}
                            : () => bloc.add(
                                const CreateAccountProviderRequested('google'),
                              ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: SocialLoginButton(
                        label: 'Apple',
                        icon: const FaIcon(
                          FontAwesomeIcons.apple,
                          color: Colors.white,
                          size: 22,
                        ),
                        onTap: state.isSubmitting
                            ? () {}
                            : () => bloc.add(
                                const CreateAccountProviderRequested('apple'),
                              ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
