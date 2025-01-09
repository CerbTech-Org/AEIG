import 'package:aeig/presentation/screen/auth_screen/login.dart';
import 'package:aeig/presentation/screen/auth_screen/sign_up.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class ConnectionBetweenLoginAndSignUpScreen extends StatefulWidget {
  const ConnectionBetweenLoginAndSignUpScreen({super.key});

  @override
  State<ConnectionBetweenLoginAndSignUpScreen> createState() => _ConnectionBetweenLoginAndSignUpState();
}

class _ConnectionBetweenLoginAndSignUpState extends State<ConnectionBetweenLoginAndSignUpScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: Image.asset(
                'assets/images/aeig_blue.jpg',
                width: 180,
                height: 120,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error_outline, size: 80, color: Colors.red);
                },
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,  // Fond blanc
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TabBar(
                        controller: _tabController,
                        indicator: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          color: Colors.blue,
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.blue,
                        tabs: [
                          _buildTab("Connexion"),
                          _buildTab("Inscription"),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: const [
                          SignInScreen(),
                          SignUpScreen(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String text) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blue, width: 1),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: GoogleFonts.poppins(fontSize: 19),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

}