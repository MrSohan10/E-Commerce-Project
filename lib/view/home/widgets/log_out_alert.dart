import 'package:crafty_bay/view/auth/pages/verify_email_screen.dart';
import 'package:crafty_bay/view_model/auth/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AlertDialog get logOutAlertDialog {
    return AlertDialog(
      title: const Text('LogOut'),
      content: const Text('Do you want to logout?'),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('No')),
        TextButton(
            onPressed: () {
              AuthViewModel.clearAuthData();
              Get.offAll(() => const VerifyEmailScreen());
            },
            child: const Text('Yes')),
      ],
    );
  }