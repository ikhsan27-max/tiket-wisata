import 'package:flutter/material.dart';
import 'package:tiket_wisata/gen/assets.gen.dart';
import 'package:tiket_wisata/constants/colors.dart';
import 'package:tiket_wisata/widgets/nav_item.dart' as widgets;
import 'package:tiket_wisata/pages/order_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  String _currentPage = 'Home';

  void _changePage(int index, String title) {
    setState(() {
      _selectedIndex = index;
      _currentPage = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ini halaman $_currentPage',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
            const SizedBox(height: 20),
            
            if (_currentPage == 'Home')
              Assets.icons.nav.home.svg(width: 80, height: 80)
            else if (_currentPage == 'Ticket')
              Assets.icons.nav.ticket.svg(width: 80, height: 80)
            else if (_currentPage == 'History')
              Assets.icons.nav.history.svg(width: 80, height: 80)
            else if (_currentPage == 'Settings')
              Assets.icons.nav.setting.svg(width: 80, height: 80)
            else if (_currentPage == 'Scan QR')
              Assets.icons.nav.scan.svg(width: 80, height: 80),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
          color: AppColors.backgroundColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -2),
              blurRadius: 30.0,
              spreadRadius: 0,
              color: AppColors.textColor.withOpacity(0.2),
            ),
          ],
        ),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widgets.NavItem(
              iconPath: Assets.icons.nav.home.path,
              label: 'Home',
              isActive: _selectedIndex == 0,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OrderPage()),
                );
              },
            ),
            widgets.NavItem(
              iconPath: Assets.icons.nav.ticket.path,
              label: 'Ticket',
              isActive: _selectedIndex == 1,
              onTap: () => _changePage(1, "Ticket"),
            ),
            widgets.NavItem(
              iconPath: Assets.icons.nav.history.path,
              label: 'History',
              isActive: _selectedIndex == 2,
              onTap: () => _changePage(2, "History"),
            ),
            widgets.NavItem(
              iconPath: Assets.icons.nav.setting.path,
              label: 'Settings',
              isActive: _selectedIndex == 3,
              onTap: () => _changePage(3, "Settings"),
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () => _changePage(-1, "Scan QR"),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
          ),
          child: Assets.icons.nav.scan.svg(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
