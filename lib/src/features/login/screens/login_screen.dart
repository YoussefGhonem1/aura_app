import 'package:aura_app/src/features/create_account/widgets/social_driver.dart';
import 'package:aura_app/src/features/login/widgets/face_id_button.dart';
import 'package:aura_app/src/shared/componants/auth_option.dart';
import 'package:aura_app/src/shared/componants/custom_button.dart';
import 'package:aura_app/src/shared/componants/text_form.dart';
import 'package:aura_app/src/shared/routing/route_strings.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              "Welcome Back",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 5),
            Text(
              "Your intelligent investement protofolio is ready",
              style: Theme.of(context).textTheme.bodySmall,
            ),

            const SizedBox(height: 40),
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
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.forgetPassword);
                },
                child: Text(
                  "Forgot Password?",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            const SizedBox(height: 25),
            AuraButton(title: "Sign In", onPressed: () {}),

            const SizedBox(height: 20),
            AuthOptionWidget(
              mainText: "Don't have an account?",
              actionText: "Sign Up",
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.createAccount);
              },
            ),
            const SizedBox(height: 30),

            buildSocialDivider(context, "Or continue with"),

            const SizedBox(height: 20),
            FaceIDButton(onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
