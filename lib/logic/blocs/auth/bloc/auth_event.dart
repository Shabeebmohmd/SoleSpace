abstract class AuthEvent {}

class CheckAuthStatus extends AuthEvent {}

class SignInWithEmailAndPassword extends AuthEvent {
  final String email;
  final String password;

  SignInWithEmailAndPassword({required this.email, required this.password});
}

class SignInWithGoogle extends AuthEvent {}

class SignUpWithEmailAndPassword extends AuthEvent {
  final String email;
  final String password;

  SignUpWithEmailAndPassword({required this.email, required this.password});
}

class SignOut extends AuthEvent {}
