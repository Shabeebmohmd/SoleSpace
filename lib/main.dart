import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sole_space_user/presentation/routes/app_router.dart';
import 'package:sole_space_user/presentation/routes/app_routes.dart';
import 'package:sole_space_user/core/theme/app_theme.dart';
import 'package:sole_space_user/logic/blocs/auth/bloc/auth_bloc.dart';
import 'package:sole_space_user/logic/blocs/auth/bloc/auth_event.dart';
import 'package:sole_space_user/presentation/screens/splash/bloc/splash_cubit.dart';
// import 'package:sole_space_user/presentation/splash/pages/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashCubit()..appStarted()),
        BlocProvider(create: (context) => AuthBloc()..add(CheckAuthStatus())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
