import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sole_space_user/presentation/screens/splash/bloc/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));

    final user = _auth.currentUser;
    if (user != null) {
      emit(UserAuthenticated());
    } else {
      emit(UserNotAuthenticated());
    }
  }
}
