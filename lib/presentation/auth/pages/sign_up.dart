import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:sole_space_user/common/helper/navigator/app_navigator.dart';
import 'package:sole_space_user/common/widgets/buttons/basic_app_button.dart';
import 'package:sole_space_user/core/theme/app_color.dart';
import 'package:sole_space_user/presentation/auth/pages/sign_in.dart';
import 'package:sole_space_user/presentation/onboarding/pages/onboarding_one.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
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
                children: [
                  _signUpText(context),
                  const SizedBox(height: 20),
                  _signUpfields(context),
                  const SizedBox(height: 60),
                  _signUpButton(context),
                ],
              ),
              Column(
                children: [
                  _googleSignUpButton(context),
                  const SizedBox(height: 20),
                  _signInAccount(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signUpText(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Create Account',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'Let’s Create Account Together',
          style: TextStyle(color: AppColors.smallTexts),
        ),
      ],
    );
  }

  Widget _signUpfields(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Enter your name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Enter email'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
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

  Widget _signUpButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          AppNavigator.pushReplacement(context, OnboardingOne());
        }
      },
      title: 'Sign up',
    );
  }

  Widget _signInAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Already have an account?',
        children: [
          TextSpan(
            text: 'Sign in',
            style: TextStyle(fontWeight: FontWeight.bold),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    AppNavigator.pushReplacement(context, SignInPage());
                  },
          ),
        ],
      ),
    );
  }

  Widget _googleSignUpButton(BuildContext context) {
    return SignInButton(
      Buttons.GoogleDark,
      text: "Sign up with Google",
      onPressed: () {},
    );
  }
}
