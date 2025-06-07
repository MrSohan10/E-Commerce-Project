import 'package:flutter/material.dart';
import 'package:crafty_bay/view/auth/pages/splash_screen.dart';
import 'package:crafty_bay/core/theme/app_theme_data.dart';
import 'package:get/get.dart';
import 'dependency/dependency_injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CraftyBay());
}

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const SplashScreen(),
      theme: AppThemeData.lightTheme,
      initialBinding: DependencyInjection(),
    );
  }
}
