import 'package:aeig/data/repositories/sign_up_with_email_and_password_failure.dart';
import 'package:aeig/domain/useCases/is_signed_in.dart';
import 'package:aeig/domain/useCases/reset_password.dart';
import 'package:aeig/domain/useCases/sign_in_with_email_password.dart';
import 'package:aeig/domain/useCases/sign_out.dart';
import 'package:aeig/domain/useCases/sign_up_with_email_password.dart';
import 'package:aeig/presentation/bloc/auth_bloc/auth_event.dart';
import 'package:aeig/presentation/bloc/auth_bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/log_in_with_email_and_password_failure.dart';
import '../../../di/setup_dependency_injection.dart';
import '../../../routing/app_router.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithEmail signInWithEmail;
  final SignUpWithEmailPassword signUpWithEmailPassword;
  final SignedIn isSignedIn;
  final SignOut signOut;
  final ResetPassword resetPassword;
  final AppRouter router = getIt();

  AuthBloc({
    required this.signInWithEmail,
    required this.signUpWithEmailPassword,
    required this.isSignedIn,
    required this.signOut,
    required this.resetPassword
  }) : super(AuthInitial()) {
    on<SignInWithEmailEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        print('>>>processing');
        final String response = await signInWithEmail(event.email, event.password);
        print('>>reponse: $response');
        if(response == 'success admin') {
          router.pushAndPopUntil(const AdminHomeRoute(), predicate: (_) => true);
          emit(Authenticated());
        } else if (response == 'success user') {
          router.pushAndPopUntil(const StudentHomeRoute(), predicate: (_) => true);
          emit(Authenticated());
        } else if (response == 'email check') {
          emit(AuthError("Un e-mail de vérification a été renvoyé. Veuillez vérifier votre boîte de réception."));
        } else {
          emit(AuthError("Erreur de connexion"));
        }
      } on LogInWithEmailAndPasswordFailure catch (e) {
        emit(AuthError("Erreur de connexion : ${e.message}"));
      }
    });

    on<SignUpWithEmailEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await signUpWithEmailPassword(event.email, event.password, event.username);
        emit(Authenticated());
      } on SignUpWithEmailAndPasswordFailure catch (e) {
        emit(AuthError("Erreur d'inscription : ${e.message}"));
      }
    });

    on<SignOutEvent>((event, emit) async {
      await signOut();
      emit(AuthInitial());
    });

    on<ResetPasswordEvent>((event, emit) async{
      emit(AuthLoading());
      try {
        await resetPassword(event.email);
      } catch(e) {
        emit(AuthError("Erreur lors de l'envoie d'Email de réinitialisation : $e"));
      }
    });

  }
}