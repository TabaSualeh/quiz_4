import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quiz_4/constants/app_colors.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool hidePassword = true;

  bool loading = false;

  void login() {
    setState(() => loading = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      setState(() => loading = false);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xff4B45B5), Color(0xff766FE8)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),

        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25),

            child: Column(
              children: [
                const Icon(Icons.menu_book_rounded, size: 80, color: Colors.white),

                const SizedBox(height: 15),

                const Text(
                  "StudyNest",

                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Plan your study sessions\nand stay on track",

                  textAlign: TextAlign.center,

                  style: TextStyle(color: Colors.white70, fontSize: 15),
                ),

                const SizedBox(height: 40),

                TextField(
                  controller: emailController,

                  decoration: InputDecoration(
                    hintText: "Email",

                    filled: true,

                    fillColor: Colors.white,

                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide.none),

                    prefixIcon: const Icon(Icons.email),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: passwordController,

                  obscureText: hidePassword,

                  decoration: InputDecoration(
                    hintText: "Password",

                    filled: true,

                    fillColor: Colors.white,

                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide.none),

                    prefixIcon: const Icon(Icons.lock),

                    suffixIcon: IconButton(
                      icon: Icon(hidePassword ? Icons.visibility_off : Icons.visibility),

                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,

                  child: TextButton(
                    onPressed: () {},

                    child: const Text("Forgot password?", style: TextStyle(color: Colors.white)),
                  ),
                ),

                const SizedBox(height: 15),

                SizedBox(
                  width: double.infinity,

                  height: 50,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,

                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    ),

                    onPressed: login,

                    child: loading
                        ? Row(
                            spacing: 12,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  backgroundColor: AppColors.blueText.withValues(alpha: 0.25),
                                  valueColor: const AlwaysStoppedAnimation<Color>(
                                    AppColors.blueText,
                                  ),
                                ),
                              ),
                              const Text("Signing in..", style: TextStyle(color: AppColors.blueText, fontSize: 18)),
                            ],
                          )
                        : const Text("Login", style: TextStyle(color: AppColors.blueText, fontSize: 18)),
                  ),
                ),

                const SizedBox(height: 15),

                RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(color: AppColors.white),
                    children: [
                      TextSpan(
                        text: "Sign up",
                        style: const TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("Sign up clicked");
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
