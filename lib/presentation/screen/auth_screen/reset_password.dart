import 'package:aeig/di/setup_dependency_injection.dart';
import 'package:aeig/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:aeig/presentation/bloc/auth_bloc/auth_event.dart';
import 'package:aeig/presentation/bloc/auth_bloc/auth_state.dart';
import 'package:aeig/routing/app_router.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({super.key});

  @override
  _PasswordResetPageState createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;
  final AppRouter router = getIt();

  bool _isEmailValid(String email) {
    final regex = RegExp(r"^[a-z.-]+@epitech\.eu$");
    return regex.hasMatch(email);
  }

  void _resetPassword() async {
    if (_emailController.text.isEmpty || !_isEmailValid(_emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez entrer un email Epitech valide')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      context.read<AuthBloc>().add(
        ResetPasswordEvent(_emailController.text)
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email de réinitialisation envoyé")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur: ${e.toString()}')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            setState(() {
              _isLoading = true;
            });
          } else if (state is AuthError) {
            setState(() {
              _isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message))
            );
          }
        },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF2196F3), Color(0xFF1976D2)],
            ),
          ),
          child: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: constraints.maxWidth * 0.08,
                          vertical: constraints.maxHeight * 0.05,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Flexible(
                              flex: 2,
                              child: Center(
                                child: Container(
                                  padding: EdgeInsets.all(constraints.maxHeight * 0.02),
                                  child: Image.asset(
                                    'assets/images/epitech.png',
                                    height: constraints.maxHeight * 0.1,
                                    color: Colors.white,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Icon(Icons.lock_reset, size: constraints.maxHeight * 0.1, color: Colors.white);
                                    },
                                  ),
                                ),
                              ),
                            ),
                            // Titre de la page
                            Flexible(
                              flex: 1,
                              child: Text(
                                "Mot de passe oublié ?",
                                style: GoogleFonts.poppins(
                                  fontSize: constraints.maxHeight * 0.035,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withOpacity(0.1),
                                      offset: const Offset(2, 2),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.02),
                            Flexible(
                              flex: 1,
                              child: Text(
                                "Pas de soucis ! Entrez votre email Epitech et nous vous enverrons un lien pour réinitialiser votre mot de passe.",
                                style: GoogleFonts.poppins(
                                  fontSize: constraints.maxHeight * 0.018,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.03),
                            Flexible(
                              flex: 3,
                              child: Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(constraints.maxHeight * 0.02),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextFormField(
                                        controller: _emailController,
                                        decoration: InputDecoration(
                                          labelText: 'Email Epitech',
                                          prefixIcon: const Icon(Icons.email, color: Colors.blue),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15),
                                            borderSide: BorderSide(color: Colors.blue.shade200),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15),
                                            borderSide: const BorderSide(color: Colors.blue, width: 2),
                                          ),
                                          filled: true,
                                          fillColor: Colors.grey.shade100,
                                        ),
                                        style: const TextStyle(color: Colors.black87),
                                      ),
                                      SizedBox(height: constraints.maxHeight * 0.02),
                                      ElevatedButton(
                                        onPressed: _isLoading ? null : _resetPassword,
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor: Colors.blue,
                                          padding: EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.015),
                                          textStyle: GoogleFonts.poppins(
                                            fontSize: constraints.maxHeight * 0.018,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          elevation: 5,
                                        ),
                                        child: _isLoading ? SizedBox(
                                          width: constraints.maxHeight * 0.025,
                                          height: constraints.maxHeight * 0.025,
                                          child: const CircularProgressIndicator(
                                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                          ),
                                        ) : Padding(
                                          padding: EdgeInsets.all(constraints.maxHeight * 0.01),
                                          child: Text(
                                            "Réinitialiser le mot de passe",
                                            style: GoogleFonts.poppins(
                                              fontSize: constraints.maxHeight * 0.018,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            TextButton.icon(
                              onPressed: () {
                                router.pushAndPopUntil(const ConnectionBetweenLoginAndSignUpRoute(), predicate: (_) => true);
                              },
                              icon: const Icon(Icons.arrow_back, color: Colors.white),
                              label: Text(
                                "Retour à la connexion",
                                style: GoogleFonts.poppins(
                                  fontSize: constraints.maxHeight * 0.018,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
