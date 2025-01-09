import 'package:aeig/presentation/screen/admin_screen/admin_inventory.dart';
import 'package:aeig/presentation/screen/admin_screen/admin_page.dart';
import 'package:aeig/presentation/screen/admin_screen/admin_request_of_customer.dart';
import 'package:aeig/presentation/screen/admin_screen/admin_setting.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHomeScreen> {
  late PageController _pageController;
  int _selectedIndex = 0;


  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> _pages = const [
    AdminPage(),
    AdminRequestOfCustomerScreen(),
    AdminInventoryScreen(),
    AdminSettingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/images/aeig_blue.jpg',
                fit: BoxFit.contain,
                height: 40,
                errorBuilder: (context, error, stackTrace) {
                  return const Text('Image not found');
                },
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person, color: Colors.blue),
            ),
          )
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: _pages.map((page) => page,
        ).toList(),
        onPageChanged: (index) {
          setState(() => _selectedIndex = index);
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() => _selectedIndex = index);
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutQuad,
            );
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
            BottomNavigationBarItem(icon: Icon(Icons.mail_rounded), label: 'Demandes'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Inventaires'),
            BottomNavigationBarItem(icon: Icon(Icons.settings_rounded), label: 'Paramètres'),
          ],
        ),
      ),
    );
  }
}