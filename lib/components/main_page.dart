import 'package:tiket_wisata/gen/assets.gen.dart';
import 'package:tiket_wisata/constants/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/nav_item.dart';
import '../pages/order_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use a method to get the appropriate page based on _selectedIndex
      body: _getPage(_selectedIndex),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          color: AppColors.backgroundColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -2),
              blurRadius: 30.0,
              blurStyle: BlurStyle.outer,
              spreadRadius: 0,
              color: AppColors.textColor.withOpacity(0.08),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavItem(
              iconPath: Assets.icons.nav.home.path,
              label: 'Home',
              isActive: _selectedIndex == 0,
              onTap: () => _onItemTapped(0),
            ),
            NavItem(
              iconPath: Assets.icons.nav.ticket.path,
              label: 'Ticket',
              isActive: _selectedIndex == 1,
              onTap: () => _onItemTapped(1),
            ),
            const SizedBox(width: 10.0),
            NavItem(
              iconPath: Assets.icons.nav.history.path,
              label: 'History',
              isActive: _selectedIndex == 2,
              onTap: () => _onItemTapped(2),
            ),
            NavItem(
              iconPath: Assets.icons.nav.setting.path,
              label: 'Setting',
              isActive: _selectedIndex == 3,
              onTap: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
          ),
          child: Assets.icons.nav.scan.svg(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // Method to return the appropriate page based on index
  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const OrderPage();
      case 1:
        return _buildTicketPage();
      case 2:
        return _buildHistoryPage();
      case 3:
        return _buildSettingPage();
      default:
        return const OrderPage();
    }
  }

  // Ticket page widget
  Widget _buildTicketPage() {
    return const Center(
      child: Text(
        'Ini halaman Ticket',
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  // History page widget
  Widget _buildHistoryPage() {
    return const Center(
      child: Text(
        'Ini halaman History',
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  // Setting page widget
  Widget _buildSettingPage() {
    return const Center(
      child: Text(
        'Ini halaman Setting',
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}