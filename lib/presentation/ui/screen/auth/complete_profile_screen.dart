import 'package:crafty_bay/presentation/state_holder/complete_profile_controller.dart';
import 'package:crafty_bay/presentation/state_holder/verify_otp_controller.dart';
import 'package:crafty_bay/presentation/ui/screen/main_bottom_nav_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
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
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _shippingAddressTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(42),
          child: Form(
            key: _formKey,
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
                  controller: _firstNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(labelText: 'First Name'),
                  validator: (value) {
                    if (value!.trim().isEmpty ?? true) {
                      return 'Enter First Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _lastNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(labelText: 'Last Name'),
                  validator: (value) {
                    if (value!.trim().isEmpty ?? true) {
                      return 'Enter Last Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _mobileTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      labelText: 'Mobile', hintText: '01234-567891'),
                  validator: (value) {
                    if (value!.trim().isEmpty ?? true) {
                      return 'Enter Name';
                    } else if (RegExp(r"^(?:(?:\+|00)88|01)?\d{11}$")
                        .hasMatch(value)) {
                      return null;
                    }

                    return 'Enter valid 11 digit number';
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _cityTEController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(labelText: 'City'),
                  validator: (value) {
                    if (value!.trim().isEmpty ?? true) {
                      return 'Enter City Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _shippingAddressTEController,
                  textInputAction: TextInputAction.done,
                  maxLines: 3,
                  decoration:
                      const InputDecoration(labelText: 'Shipping Address'),
                  validator: (value) {
                    if (value!.trim().isEmpty ?? true) {
                      return 'Enter Shipping Address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                GetBuilder<CompleteProfileController>(builder: (controller) {
                  return SizedBox(
                    width: double.infinity,
                    child: Visibility(
                      visible: controller.inProgress == false,
                      replacement: const CenterCircularProgressIndication(),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final bool result =
                                await controller.createProfileData(
                              Get.find<VerifyOtpController>().token,
                              _firstNameTEController.text.trim(),
                              _lastNameTEController.text.trim(),
                              _mobileTEController.text.trim(),
                              _cityTEController.text.trim(),
                              _shippingAddressTEController.text.trim(),
                            );
                            if (result) {
                              Get.offAll(()=> const MainBottomNavScreen());
                            } else {
                              Get.showSnackbar(GetSnackBar(
                                duration: const Duration(seconds: 2),
                                isDismissible: true,
                                title: 'Complete Profile Failed',
                                message: controller.errorMessage,
                                backgroundColor: Colors.red,
                              ));
                            }
                          }
                        },
                        child: const Text('Complete'),
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameTEController.clear();
    _lastNameTEController.clear();
    _mobileTEController.clear();
    _cityTEController.clear();
    _shippingAddressTEController.clear();
    super.dispose();
  }
}
