import 'package:aura_app/src/features/create_account/widgets/condition_terms.dart';
import 'package:aura_app/src/features/create_account/widgets/social_button.dart';
import 'package:aura_app/src/features/create_account/widgets/social_driver.dart';
import 'package:aura_app/src/shared/componants/auth_option.dart';
import 'package:aura_app/src/shared/componants/custom_button.dart';
import 'package:aura_app/src/shared/componants/text_form.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
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
              "Create your Aura",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              "Start your AI-powered investment journey",
              style: Theme.of(context).textTheme.bodySmall,
            ),

            const SizedBox(height: 40),
            const AuraTextField(
              label: "Full Name",
              hintText: "Enter your full name",
            ),
            const SizedBox(height: 20),
            const AuraTextField(
              label: "Email Address",
              hintText: "name@example.com",
            ),
            const SizedBox(height: 20),
            const AuraTextField(
              label: "Password",
              hintText: "Create a password",
              isPassword: true,
              suffixIcon: Icons.visibility_outlined,
            ),
            const SizedBox(height: 15),

            const TermsAndConditionsWidget(),
            const SizedBox(height: 30),
            AuraButton(title: "Create Account", onPressed: () {}),

            const SizedBox(height: 20),
            AuthOptionWidget(
              mainText: "Already have an account?",
              actionText: "Log In",
              onTap: () {
                print("Navigate to Login Page");
              },
            ),
            const SizedBox(height: 30),

            buildSocialDivider(context),

            const SizedBox(height: 30),

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
                    icon: const Icon(
                      CupertinoIcons.heart,
                      color: Colors.white,
                      size: 22,
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
