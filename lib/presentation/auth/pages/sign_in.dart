import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:sole_space_user/common/helper/navigator/app_navigator.dart';
import 'package:sole_space_user/common/widgets/buttons/basic_app_button.dart';
import 'package:sole_space_user/core/theme/app_color.dart';
import 'package:sole_space_user/presentation/auth/pages/recoverypassword_.dart';
import 'package:sole_space_user/presentation/auth/pages/sign_up.dart';
import 'package:sole_space_user/presentation/onboarding/pages/onboarding_one.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      _signInText(context),
                      const SizedBox(height: 20),
                      _signInfields(context),
                    ],
                  ),
                  _forgetPassword(context),
                  const SizedBox(height: 60),
                  _signInButton(context),
                  const SizedBox(height: 20),
                ],
              ),
              Column(
                children: [
                  _googleSignInButton(context),
                  SizedBox(height: 20),
                  _createAccount(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInText(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Hello Again!',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'Welcome Back You’ve Been Missed!',
          style: TextStyle(color: AppColors.smallTexts),
        ),
      ],
    );
  }

  Widget _signInfields(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Enter email'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an email';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          ValueListenableBuilder<bool>(
            valueListenable: _obscurePassword,
            builder: (context, obscure, child) {
              return TextFormField(
                obscureText: obscure,
                decoration: InputDecoration(
                  labelText: 'Enter password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscure ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      _obscurePassword.value = !_obscurePassword.value;
                    },
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _forgetPassword(BuildContext context) {
    return TextButton(
      onPressed: () {
        AppNavigator.push(context, RecoveryPasswordPage());
      },
      child: Text(
        'Forget password',
        style: TextStyle(color: AppColors.smallTexts),
      ),
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Don't have an account?",
        children: [
          TextSpan(
            text: 'Sign up for free',
            style: TextStyle(fontWeight: FontWeight.bold),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    AppNavigator.pushReplacement(context, SignUpPage());
                  },
          ),
        ],
      ),
    );
  }

  Widget _signInButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          AppNavigator.pushReplacement(context, OnboardingOne());
        }
      },
      title: 'Sign in',
    );
  }

  Widget _googleSignInButton(BuildContext context) {
    return SignInButton(Buttons.GoogleDark, onPressed: () {});
  }
}
