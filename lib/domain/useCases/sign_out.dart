import 'package:aeig/domain/repositories/authRepositories.dart';

class SignOut {
  final AuthRepository authRepository;
  SignOut(this.authRepository);

  Future<void> call() {
    return authRepository.signOut();
  }
}