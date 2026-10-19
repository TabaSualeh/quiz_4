import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/stat_pill.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Column(
        children: [
          Container(
            width: double.infinity,

            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).padding.top + 18, 20, 28),
            decoration: const BoxDecoration(
              gradient: AppColors.gradient,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.orange,
                  child: Text(
                    'TS',
                    style: TextStyle(color: AppColors.text, fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
                SizedBox(height: 9),
                Text(
                  'Taba Sualeh',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text('taba@studynest.app', style: TextStyle(color: Colors.white70, fontSize: 10)),
              ],
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -22),
            child: const Row(
              children: [
                StatPill(value: '4', label: 'Total'),
                StatPill(value: '3', label: 'Pending'),
                StatPill(value: '1', label: 'Done'),
              ],
            ),
          ),
          _infoRow(Icons.menu_book_outlined, 'Next session', 'Data Structures revision'),
          _infoRow(Icons.donut_large, 'Completion rate', '75%'),
          _infoRow(Icons.calendar_month_outlined, 'Member since', 'Sep 2026'),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 10, 22, 24),
            child: SizedBox(
              width: double.infinity,
              height: 44,
              child: OutlinedButton.icon(
                onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen())),
                icon: const Icon(Icons.logout, size: 17),
                label: const Text('Logout'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  side: const BorderSide(color: AppColors.primary),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _infoRow(IconData icon, String title, String value) => Container(
    margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: AppColors.border),
    ),
    child: Row(
      children: [
        Icon(icon, size: 16, color: AppColors.primary),
        const SizedBox(width: 10),
        Expanded(
          child: Text(title, style: const TextStyle(color: AppColors.muted, fontSize: 11)),
        ),
        Text(
          value,
          style: const TextStyle(color: AppColors.text, fontSize: 10, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}
