import 'package:aeig/domain/repositories/authRepositories.dart';

class ResetPassword {
  final AuthRepository authRepository;

  ResetPassword(this.authRepository);

  Future<void> call(String email) {
    return authRepository.resetPassword(email);
  }
}