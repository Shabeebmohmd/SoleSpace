// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sole_space_user/common/helper/navigator/app_navigator.dart';
// import 'package:sole_space_user/common/widgets/appbar/basic_app_bar.dart';
// import 'package:sole_space_user/common/widgets/buttons/basic_app_button.dart';
// import 'package:sole_space_user/core/bloc/auth/auth_bloc.dart';
// import 'package:sole_space_user/core/bloc/auth/auth_event.dart';
// import 'package:sole_space_user/core/bloc/auth/auth_state.dart';
// import 'package:sole_space_user/core/theme/app_color.dart';
// import 'package:sole_space_user/presentation/auth/pages/sign_in.dart';

// class RecoveryPasswordPage extends StatelessWidget {
//   RecoveryPasswordPage({super.key});

//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: BasicAppbar(),
//         body: BlocListener<AuthBloc, AuthState>(
//           listener: (context, state) {
//             if (state is AuthError) {
//               ScaffoldMessenger.of(
//                 context,
//               ).showSnackBar(SnackBar(content: Text(state.message)));
//             } else if (state is Unauthenticated) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(
//                   content: Text(
//                     'Password reset email sent. Please check your inbox.',
//                   ),
//                 ),
//               );
//               AppNavigator.pushReplacement(context, SignInPage());
//             }
//           },
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 16),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     _recoveryText(context),
//                     const SizedBox(height: 20),
//                     _recoveryField(context),
//                     const SizedBox(height: 60),
//                     _continueButton(context),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _recoveryText(BuildContext context) {
//     return Column(
//       children: [
//         const Text(
//           'Recovery Password',
//           style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           'Please Enter Your Email Address To Receive a Password Reset Link',
//           style: TextStyle(color: AppColors.smallTexts),
//         ),
//       ],
//     );
//   }

//   Widget _recoveryField(BuildContext context) {
//     return Form(
//       key: formKey,
//       child: TextFormField(
//         controller: _emailController,
//         decoration: const InputDecoration(labelText: 'Enter your email'),
//         keyboardType: TextInputType.emailAddress,
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'Please enter an email';
//           }
//           if (!value.contains('@')) {
//             return 'Please enter a valid email';
//           }
//           return null;
//         },
//       ),
//     );
//   }

//   Widget _continueButton(BuildContext context) {
//     return BlocBuilder<AuthBloc, AuthState>(
//       builder: (context, state) {
//         return BasicAppButton(
//           onPressed:
//               state is AuthLoading
//                   ? () {}
//                   : () {
//                     if (formKey.currentState!.validate()) {
//                       context.read<AuthBloc>().add(
//                         ForgotPasswordRequested(_emailController.text),
//                       );
//                     }
//                   },
//           title: state is AuthLoading ? 'Sending...' : 'Continue',
//         );
//       },
//     );
//   }
// }
