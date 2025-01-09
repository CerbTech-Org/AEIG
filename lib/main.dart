import 'package:aeig/data/repositories/firebase_auth_repositories.dart';
import 'package:aeig/di/setup_dependency_injection.dart';
import 'package:aeig/domain/useCases/is_signed_in.dart';
import 'package:aeig/domain/useCases/reset_password.dart';
import 'package:aeig/domain/useCases/sign_in_with_email_password.dart';
import 'package:aeig/domain/useCases/sign_out.dart';
import 'package:aeig/domain/useCases/sign_up_with_email_password.dart';
import 'package:aeig/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:aeig/routing/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    setup();
    final firebaseAuth = FirebaseAuth.instance;
    final authRepository = FirebaseAuthRepository(firebaseAuth: firebaseAuth);
    final signUpWithEmailPassword = SignUpWithEmailPassword(authRepository);
    final signInWithEmail = SignInWithEmail(authRepository);
    final isSignedIn = SignedIn(authRepository);
    final signOut = SignOut(authRepository);
    final resetPassword = ResetPassword(authRepository);
    final AppRouter appRouter = getIt.get<AppRouter>();

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
            create: (_) => AuthBloc(
                signInWithEmail: signInWithEmail,
                signUpWithEmailPassword: signUpWithEmailPassword,
                isSignedIn: isSignedIn,
                signOut: signOut,
                resetPassword: resetPassword
            )
        ),
      ],
      child:  MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(),
      ),
    );
  }
}