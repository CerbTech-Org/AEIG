abstract class AuthEvent {}

class SignUpWithEmailEvent extends AuthEvent {
  final String email;
  final String password;
  final String username;
  SignUpWithEmailEvent(this.email, this.password, this.username);
}

class SignInWithEmailEvent extends AuthEvent {
  final String email;
  final String password;

  SignInWithEmailEvent(this.email, this.password);
}

class ResetPasswordEvent extends AuthEvent {
  final String email;

  ResetPasswordEvent(this.email);
}

class SignOutEvent extends AuthEvent {}