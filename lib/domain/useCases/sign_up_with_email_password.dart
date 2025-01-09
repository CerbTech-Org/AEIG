import 'package:aeig/domain/repositories/authRepositories.dart';

class SignUpWithEmailPassword {
  final AuthRepository authRepository;
  SignUpWithEmailPassword(this.authRepository);

  Future<void> call(String email, String password, String username) {
    return authRepository.signUpWithEmail(email, password, username);
  }
}