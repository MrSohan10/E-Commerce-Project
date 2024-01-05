import 'package:crafty_bay/presentation/state_holder/otp_time_decrease.dart';
import 'package:crafty_bay/presentation/ui/screen/splash_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_theme_data.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const SplashScreen(),
      theme: AppThemeData.lightTheme,
      initialBinding: controllerBinding(),
    );
  }
}

class controllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OtpTimeDecrease());
  }
}
