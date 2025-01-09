import 'package:aeig/di/setup_dependency_injection.dart';
import 'package:aeig/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:aeig/presentation/bloc/auth_bloc/auth_event.dart';
import 'package:aeig/presentation/bloc/auth_bloc/auth_state.dart';
import 'package:aeig/routing/app_router.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  bool _passwordVisible = false;
  bool _isLoading = false;
  final AppRouter router = getIt();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _isEmailValid(String email) {
    final regex = RegExp(r"^[a-z.-]+@epitech\.eu$");
    return regex.hasMatch(email);
  }

  void _handleSignUp() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty || _usernameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Veuillez entrer un email, un mot de passe et un nom d'utilisateur valides.")),
      );
      return;
    }

    if (!_isEmailValid(_emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Veuillez utiliser un email Epitech valide.")),
      );
      return;
    }

    if (_passwordController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Le mot de passe doit contenir au moins 6 caractères.")),
      );
      return;
    }

    try {
      context.read<AuthBloc>().add(
        SignUpWithEmailEvent(_emailController.text.trim(), _passwordController.text.trim(), _usernameController.text.trim()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Un e-mail de vérification a été envoyé. Veuillez vérifier votre boîte de réception.")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur: ${e.toString()}')),
      );
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
        } else if (state is Authenticated) {
          setState(() {
            _isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Inscription réussie !")),
          );
        } else if (state is AuthError) {
          setState(() {
            _isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      } ,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 32),
            child: Column(
              children: [
                const Text(
                  "Bienvenue !",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Remplissez ce formulaire pour créer votre compte",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Nom d\'utilisateur',
                    prefixIcon: const Icon(Icons.person, color: Colors.blue),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black87),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email, color: Colors.blue),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black87),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    labelText: 'Mot de Passe',
                    prefixIcon: const Icon(Icons.lock, color: Colors.blue),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue, width: 2),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                  style: const TextStyle(color: Colors.black87),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: _isLoading ? null : _handleSignUp,
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                        "S’inscrire",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Text(
                        "Vous avez déjà un compte ?",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        router.push(const ConnectionBetweenLoginAndSignUpRoute());
                      },
                      child: const Text(
                        "Connectez-vous",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Image.asset(
                      'assets/images/epitech.png',
                      height: 60,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error_outline, size: 80, color: Colors.red);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}