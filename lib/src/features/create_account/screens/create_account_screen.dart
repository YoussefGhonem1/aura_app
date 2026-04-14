import 'package:aura_app/src/features/create_account/widgets/condition_terms.dart';
import 'package:aura_app/src/features/create_account/widgets/social_button.dart';
import 'package:aura_app/src/features/create_account/widgets/social_driver.dart';
import 'package:aura_app/src/features/forget_password/widgets/build_validation_item.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/shared/componants/auth_option.dart';
import 'package:aura_app/src/shared/componants/custom_button.dart';
import 'package:aura_app/src/shared/componants/text_form.dart';
import 'package:aura_app/src/shared/routing/route_strings.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateAccount extends StatefulWidget {
  CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool _hasEightChars = true;

  bool _hasUppercase = true;

  bool _hasNumber = true;

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bool passwordHasError =
        !_hasEightChars || !_hasUppercase || !_hasNumber;
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
                      color: AppColors.secondaryColor.withOpacity(0.15),
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
              context.l10n.createYourAura,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 5),
            Text(
              context.l10n.startAiPoweredInvestmentJourney,
              style: Theme.of(context).textTheme.bodySmall,
            ),

            const SizedBox(height: 40),
            AuraTextField(
              label: context.l10n.username,
              hintText: context.l10n.enterYourName,
            ),
            const SizedBox(height: 20),
            AuraTextField(
              label: context.l10n.emailAddress,
              hintText: context.l10n.emailExample,
            ),
            const SizedBox(height: 20),

            AuraTextField(
              label: context.l10n.password,
              hintText: context.l10n.password,
              isPassword: true,
              hasError: passwordHasError,
              controller: _passwordController,
              tooltipContent: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildValidationItem(
                    context.l10n.atLeastEightCharacters,
                    _hasEightChars,
                  ),
                  buildValidationItem(
                    context.l10n.oneUppercaseLetter,
                    _hasUppercase,
                  ),
                  buildValidationItem(context.l10n.oneNumber, _hasNumber),
                ],
              ),
            ),

            const SizedBox(height: 15),

            const TermsAndConditionsWidget(),
            const SizedBox(height: 25),
            AuraButton(title: context.l10n.createAccount, onPressed: () {}),

            const SizedBox(height: 20),
            AuthOptionWidget(
              mainText: context.l10n.alreadyHaveAnAccount,
              actionText: context.l10n.logIn,
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.login);
              },
            ),
            const SizedBox(height: 30),

            buildSocialDivider(context, context.l10n.orSignUpWith),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: SocialLoginButton(
                    label: "Google",
                    icon: const FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.redAccent,
                      size: 20,
                    ),
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: SocialLoginButton(
                    label: "Apple",
                    icon: Icon(
                      FontAwesomeIcons.apple,
                      color: Colors.white,
                      size: 22,
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
