import 'package:aeig/presentation/screen/admin_screen/acceptation_customer_object_loan.dart';
import 'package:aeig/presentation/screen/admin_screen/return_customer_object_loan.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class AdminRequestOfCustomerScreen extends StatefulWidget {
  const AdminRequestOfCustomerScreen({super.key});

  @override
  State<AdminRequestOfCustomerScreen> createState() => _AdminRequestOfCustomerScreenState();
}

class _AdminRequestOfCustomerScreenState extends State<AdminRequestOfCustomerScreen> with SingleTickerProviderStateMixin {
  // Controlleur entre plusieurs switch
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // initialisation du controlleur pour prendre uniquement deux éléments
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // Libération du controlleur
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea( //  assure que l'application s'affiche correctement sur différents types d'appareils (smartphones avec encoches, écrans incurvés, etc.), gère les marges de l'app
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueAccent,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black87,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [ // Déclaration des deux éléments
                    Tab(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Center(
                          child: Text(
                            "Emprunt d’objet",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Center(
                          child: Text(
                            "Retour d’objet",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: TabBarView( // redirection respectivement des deux éléments
                  controller: _tabController,
                  children: const [
                    AcceptationCustomerObjectLoanScreen(),
                    ReturnCustomerObjectLoanScreen()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}