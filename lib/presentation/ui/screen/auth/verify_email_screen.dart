import 'package:crafty_bay/presentation/ui/screen/auth/verify_otp_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(42),
          child: Column(
            children: [
              const SizedBox(height: 150),
              const AppLogo(height: 100),
              const SizedBox(height: 10),
              Text(
                'Welcome Back',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Please Enter Your Email Address',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email Address'),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(const VerifyOtpScreen());
                  },
                  child: const Text('Next'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
