import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../state_holder/otp_time_decrease.dart';
import '../../widgets/app_logo.dart';
import 'complete_profile_screen.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final OtpTimeDecrease _otpTimeDecrease = Get.find<OtpTimeDecrease>();

  @override
  void initState() {
    _otpTimeDecrease.decreaseTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(42),
        child: Column(
          children: [
            const SizedBox(height: 120),
            const AppLogo(height: 100),
            const SizedBox(height: 10),
            Text(
              'Enter OTP Code',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'A 4 Digit OTP Code has been sent',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 24,
            ),
            PinCodeTextField(
              cursorColor: AppColors.primaryColor,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              appContext: context,
              length: 4,
              obscureText: true,
              obscuringCharacter: "*",
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                selectedColor: Colors.black,
                activeColor: Colors.green,
                inactiveColor: AppColors.primaryColor,
              ),
              animationDuration: const Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                   Get.to(const CompleteProfileScreen());
                },
                child: const Text('Next'),
              ),
            ),
            const SizedBox(height: 24),
            GetBuilder<OtpTimeDecrease>(builder: (controller) {
              return RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.grey),
                  children: [
                    const TextSpan(text: "This code will expire in "),
                    TextSpan(
                      text: '${_otpTimeDecrease.seconds.toString()}s',
                      style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              );
            }),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Resend Code',
                style: TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
