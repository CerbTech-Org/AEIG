import 'package:aeig/domain/repositories/authRepositories.dart';
import 'package:flutter/cupertino.dart';

class SignInWithEmail {
  final AuthRepository authRepository;
  SignInWithEmail(this.authRepository);

  Future<String> call(String email, String password) {
    return authRepository.signInWithEmail(email, password);
  }
}