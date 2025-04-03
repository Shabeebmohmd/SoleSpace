import 'package:flutter/material.dart';
import 'package:sole_space_user/common/helper/navigator/app_navigator.dart';
import 'package:sole_space_user/common/widgets/appbar/basic_app_bar.dart';
import 'package:sole_space_user/common/widgets/buttons/basic_app_button.dart';
import 'package:sole_space_user/core/theme/app_color.dart';
import 'package:sole_space_user/presentation/auth/pages/sign_in.dart';

class RecoveryPasswordPage extends StatelessWidget {
  RecoveryPasswordPage({super.key});

  // Move the form key to be a class member
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BasicAppbar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  _recoveryText(context),
                  const SizedBox(height: 20),
                  _recoveryField(context), // Pass formKey here
                  const SizedBox(height: 60),
                  _continueButton(context), // Pass formKey here
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _recoveryText(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Recovery Password',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'Please Enter Your Email Address To Recieve a Verification Code',
          style: TextStyle(color: AppColors.smallTexts),
        ),
      ],
    );
  }

  Widget _recoveryField(BuildContext context) {
    return Form(
      key: formKey, // Use class member formKey
      child: TextFormField(
        decoration: const InputDecoration(labelText: 'Enter your email'),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter an email';
          }
          return null;
        },
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          AppNavigator.pushReplacement(context, SignInPage());
        }
      },
      title: 'Continue',
    );
  }
}
