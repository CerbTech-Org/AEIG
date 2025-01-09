abstract class AuthRepository {
  Future<void> signUpWithEmail(String email, String password, String username);

  Future<String> signInWithEmail(String email, String password);

  Future<void> signOut();

  Future<bool> isSignedIn();

  Future<void> resetPassword(String email);

}