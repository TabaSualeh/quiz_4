import 'package:flutter/material.dart';
import 'view/login_screen.dart';
import 'constants/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "StudyNest",
      theme: ThemeData(scaffoldBackgroundColor: AppColors.bgColor),
      home: const LoginScreen(),
    );
  }
}
