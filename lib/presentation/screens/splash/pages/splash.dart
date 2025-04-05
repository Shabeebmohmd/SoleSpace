import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sole_space_user/common/helper/navigator/app_navigator.dart';
import 'package:sole_space_user/core/config/assets/app_vectors.dart';
import 'package:sole_space_user/presentation/routes/app_routes.dart';
import 'package:sole_space_user/core/theme/app_color.dart';
import 'package:sole_space_user/presentation/screens/splash/bloc/splash_cubit.dart';
import 'package:sole_space_user/presentation/screens/splash/bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UserNotAuthenticated) {
          AppNavigator.pushReplacement(context, AppRoutes.signIn);
        } else if (state is UserAuthenticated) {
          AppNavigator.pushReplacement(context, AppRoutes.onboardingOne);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(child: SvgPicture.asset(AppVectors.appLogo)),
      ),
    );
  }
}
