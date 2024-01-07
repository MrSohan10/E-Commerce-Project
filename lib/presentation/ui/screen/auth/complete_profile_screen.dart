import 'package:crafty_bay/presentation/ui/screen/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/app_colors.dart';
import '../../widgets/app_logo.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(42),
          child: Column(
            children: [
              const SizedBox(height: 80),
              const AppLogo(height: 100),
              const SizedBox(height: 10),
              Text(
                'Complete Profile',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Get started with us with your details',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                cursorColor: AppColors.primaryColor,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'First Name'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                cursorColor: AppColors.primaryColor,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'Last Name'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                cursorColor: AppColors.primaryColor,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Mobile'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                cursorColor: AppColors.primaryColor,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'City'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                cursorColor: AppColors.primaryColor,
                textInputAction: TextInputAction.done,
                maxLines: 3,
                decoration:
                    const InputDecoration(labelText: 'Shipping Address'),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAll(const MainBottomNavScreen());
                  },
                  child: const Text('Complete'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
