import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class SessionCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title, description, date, time, status;
  final bool completed;
  final Function(bool?) onChangedCheckBox;

  const SessionCard({super.key, required this.icon, required this.iconColor, required this.title, required this.description, required this.date, required this.time, required this.status, this.completed = false, required this.onChangedCheckBox});

  @override
  Widget build(BuildContext context) {
    final statusColor = completed ? AppColors.green : AppColors.orange;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
        boxShadow: const [BoxShadow(color: Color(0x08000000), blurRadius: 8, offset: Offset(0, 2))],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(color: iconColor.withValues(alpha: .12), borderRadius: BorderRadius.circular(11)),
                child: Icon(icon, color: iconColor, size: 18),
              ),
              Checkbox(
                shape: const CircleBorder(),
                checkColor: AppColors.bgColor,
                activeColor: AppColors.activeCheckboxColor,
                side: const BorderSide(color: AppColors.inactiveCheckboxBorderColor),
                value: completed,
                onChanged: onChangedCheckBox,
              ),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: AppColors.text, fontWeight: FontWeight.w700, fontSize: 12),
                ),
                const SizedBox(height: 4),
                Text(description, style: const TextStyle(color: AppColors.muted, fontSize: 10)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.calendar_month_outlined, size: 12, color: AppColors.muted),
                    const SizedBox(width: 3),
                    Text(date, style: const TextStyle(color: AppColors.muted, fontSize: 9)),
                    const SizedBox(width: 9),
                    const Icon(Icons.access_time, size: 12, color: AppColors.muted),
                    const SizedBox(width: 3),
                    Text(time, style: const TextStyle(color: AppColors.muted, fontSize: 9)),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
            decoration: BoxDecoration(color: statusColor.withOpacity(.16), borderRadius: BorderRadius.circular(10)),
            child: Text(
              status,
              style: TextStyle(color: completed ? AppColors.green : const Color(0xFF9A6500), fontSize: 8, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
