import 'package:aeig/data/repositories/log_in_with_email_and_password_failure.dart';
import 'package:aeig/data/repositories/sign_up_with_email_and_password_failure.dart';
import 'package:aeig/di/setup_dependency_injection.dart';
import 'package:aeig/domain/repositories/authRepositories.dart';
import 'package:aeig/routing/app_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class FirebaseAuthRepository implements AuthRepository {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthRepository({required FirebaseAuth firebaseAuth}) : _firebaseAuth = firebaseAuth;

  final AppRouter router = getIt();

  @override
  Future<bool> isSignedIn() async {
    return _firebaseAuth.currentUser != null;
  }

  @override
  Future<String> signInWithEmail(String email, String password) async{
    bool isAdmin = true;

    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('admins').doc(userCredential.user!.uid).get();

      if (userDoc.exists) {
        String? adminFcmToken = await FirebaseMessaging.instance.getToken();
        await FirebaseFirestore.instance.collection('admins').doc(userCredential.user!.uid).update({
          'fcmToken': adminFcmToken,
          'email': email,
          'isAdmin': isAdmin
        });
        return 'success admin';
        // router.pushAndPopUntil(const AdminHomeRoute(), predicate: (_) => true);
      }

      if (user != null && user.emailVerified) {
        String? fcmToken = await FirebaseMessaging.instance.getToken();
        await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).update({
          'fcmToken': fcmToken,
          'isEmailVerified': true
        });
        // router.pushAndPopUntil(const StudentHomeRoute(), predicate: (_) => true);
        return 'success user';
      } else {
        print('>>>in else');
        // _showMessage("Veuillez vérifier votre e-mail avant de vous connecter.");
        await user?.sendEmailVerification();
        return 'email check';
        // _showMessage("Un e-mail de vérification a été renvoyé. Veuillez vérifier votre boîte de réception.");
      }
    } on FirebaseAuthException catch (e) {
      print('>>>here');
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context as BuildContext).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      router.pushAndPopUntil(const ConnectionBetweenLoginAndSignUpRoute(), predicate: (_) => true);
    } catch(e) {
      _showMessage('Erreur lors de la déconnexion : $e');
    }

  }

  @override
  Future<void> signUpWithEmail(String email, String password, String username) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      final user = credential.user;

      if (user != null) {
        await user.updateDisplayName(username);
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'username': username,
          'email': email,
          'isEmailVerified': false
        });
        await user.sendEmailVerification();
        // _showMessage("Un e-mail de vérification a été envoyé. Veuillez vérifier votre boîte de réception.");
        router.pushAndPopUntil(const SignInRoute(), predicate: (_) => true);
      } else {
        throw Exception("Erreur lors de l'inscription: User is null");
      }
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception("Erreur lors de l'envoi d'email: ${e.toString()}");
    }
  }

}
