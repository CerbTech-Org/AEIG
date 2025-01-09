import 'package:aeig/domain/repositories/authRepositories.dart';

class SignedIn {
  final AuthRepository authRepository;

  SignedIn(this.authRepository);

  Future<bool> call() {
    return authRepository.isSignedIn();
  }
}