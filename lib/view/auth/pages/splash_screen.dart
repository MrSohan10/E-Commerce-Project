import 'package:crafty_bay/view_model/auth/auth_view_model.dart';
import 'package:crafty_bay/view/main/pages/main_bottom_nav_screen.dart';
import 'package:crafty_bay/reusable/app_logo/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    moveToNextScreen();
  }

  void moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    await Get.find<AuthViewModel>().initialize();
    Get.offAll(() => const MainBottomNavScreen());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            AppLogo(
              width: 120,
            ),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text("Version 1.0"),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
