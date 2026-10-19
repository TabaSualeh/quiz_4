import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const AppBottomNavigation({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
    currentIndex: currentIndex, onTap: onTap, type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white, selectedItemColor: AppColors.primary, unselectedItemColor: AppColors.muted,
    selectedFontSize: 9, unselectedFontSize: 9, elevation: 8,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home_outlined, size: 20), activeIcon: Icon(Icons.home, size: 20), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.person_outline, size: 20), activeIcon: Icon(Icons.person, size: 20), label: 'Profile'),
    ],
  );
}
