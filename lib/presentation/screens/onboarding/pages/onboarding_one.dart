import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sole_space_user/common/helper/navigator/app_navigator.dart';
import 'package:sole_space_user/common/widgets/buttons/basic_app_button.dart';
import 'package:sole_space_user/presentation/routes/app_routes.dart';
import 'package:sole_space_user/logic/blocs/auth/bloc/auth_bloc.dart';
import 'package:sole_space_user/logic/blocs/auth/bloc/auth_event.dart';
import 'package:sole_space_user/logic/blocs/auth/bloc/auth_state.dart';

class OnboardingOne extends StatelessWidget {
  const OnboardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          AppNavigator.pushReplacement(context, AppRoutes.signIn);
        } else if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Onboarding One'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                context.read<AuthBloc>().add(SignOut());
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to Sole Space!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              BasicAppButton(
                onPressed: () {
                  context.read<AuthBloc>().add(SignOut());
                },
                title: 'Sign Out',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
