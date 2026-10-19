import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/session_card.dart';
import '../widgets/stat_pill.dart';
import '../widgets/app_bottom_navigation.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: currentIndex == 0 ? _homeBody() : const ProfileScreen(),
      floatingActionButton: currentIndex == 0 ? FloatingActionButton(backgroundColor: AppColors.orange, foregroundColor: AppColors.text, onPressed: _showAddSession, child: const Icon(Icons.add)) : null,
      bottomNavigationBar: AppBottomNavigation(currentIndex: currentIndex, onTap: (index) => setState(() => currentIndex = index)),
    );
  }

  Widget _homeBody() {
    return SafeArea(
      top: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).padding.top + 18, 20, 28),
            decoration: const BoxDecoration(
              gradient: AppColors.gradient,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('StudyNest', style: TextStyle(color: Colors.white70, fontSize: 10)),
                SizedBox(height: 5),
                Text(
                  'Hello, Taba!',
                  style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 3),
                Text('You have 3 sessions planned.', style: TextStyle(color: Colors.white70, fontSize: 11)),
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
          const Padding(
            padding: EdgeInsets.fromLTRB(18, 0, 18, 12),
            child: Text(
              'Upcoming sessions',
              style: TextStyle(color: AppColors.text, fontWeight: FontWeight.w700, fontSize: 15),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                SessionCard(
                  icon: Icons.menu_book_rounded,
                  iconColor: const Color(0xFF4C49C8),
                  title: 'Data Structures revision',
                  description: 'Chapters 4–5, practice tree problems',
                  date: 'Mon, 12 Oct',
                  time: '4:00 PM',
                  status: 'Pending',
                  onChangedCheckBox: (bool? value) {},
                ),
                SessionCard(
                  icon: Icons.quiz_outlined,
                  iconColor: const Color(0xFF8171E8),
                  title: 'Flutter quiz prep',
                  description: 'Review ListView and Navigator',
                  date: 'Tue, 13 Oct',
                  time: '6:30 PM',
                  status: 'Pending',
                  onChangedCheckBox: (bool? value) {},
                ),
                SessionCard(
                  icon: Icons.calculate_outlined,
                  iconColor: AppColors.orange,
                  title: 'Calculus problem set',
                  description: 'Exercise 7.2, questions 1–10',
                  date: 'Wed, 14 Oct',
                  time: '9:00 AM',
                  status: 'Done',
                  completed: true,
                  onChangedCheckBox: (bool? value) {},
                ),
                SessionCard(
                  icon: Icons.groups_outlined,
                  iconColor: AppColors.green,
                  title: 'Group project meeting',
                  description: 'Finalize slides with the team',
                  date: 'Thu, 15 Oct',
                  time: '2:00 PM',
                  status: 'Pending',
                  onChangedCheckBox: (bool? value) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showAddSession() {
    double sh = MediaQuery.of(context).size.height;
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: StatefulBuilder(
            builder: (context, setSheetState) {
              DateTime selectedDate = DateTime(2026, 10, 16);
              TimeOfDay selectedTime = const TimeOfDay(hour: 17, minute: 0);
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Container(
                        width: 38,
                        height: 4,
                        decoration: BoxDecoration(color: AppColors.border, borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'New study session',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.text),
                          ),
                        ),
                        IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    _sheetField(titleController, 'TITLE'),
                    const SizedBox(height: 10),
                    _sheetField(descriptionController, 'Description', maxLines: 3),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () async {
                              final date = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(2024), lastDate: DateTime(2030));
                              if (date != null) setSheetState(() => selectedDate = date);
                            },
                            icon: const Icon(Icons.calendar_month_outlined, size: 15),
                            label: const Text('Fri, 16 Oct', style: TextStyle(fontSize: 10)),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () async {
                              final time = await showTimePicker(context: context, initialTime: selectedTime);
                              if (time != null) setSheetState(() => selectedTime = time);
                            },
                            icon: const Icon(Icons.access_time, size: 15),
                            label: const Text('5:00 PM', style: TextStyle(fontSize: 10)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: sh * 0.20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14)),
                        child: const Text('Add session'),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _sheetField(TextEditingController controller, String hint, {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(fontSize: 12),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 10),
        filled: true,
        fillColor: AppColors.background,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.all(14),
      ),
    );
  }
}
