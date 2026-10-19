import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class StatPill extends StatelessWidget {
  final String value;
  final String label;

  const StatPill({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) => Expanded(
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: const [BoxShadow(color: Color(0x0D000000), blurRadius: 8, offset: Offset(0, 3))],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 2),
          Text(label, style: const TextStyle(color: AppColors.muted, fontSize: 9)),
        ],
      ),
    ),
  );
}
