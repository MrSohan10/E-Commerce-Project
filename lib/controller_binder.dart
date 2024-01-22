import 'package:crafty_bay/presentation/state_holder/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holder/complete_profile_controller.dart';
import 'package:crafty_bay/presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/state_holder/otp_time_decrease_controller.dart';
import 'package:crafty_bay/presentation/state_holder/read_profile_data_controller.dart';
import 'package:crafty_bay/presentation/state_holder/send_otp_to_email_controller.dart';
import 'package:crafty_bay/presentation/state_holder/verify_otp_controller.dart';
import 'package:get/get.dart';

class controllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(OtpTimeDecreaseController());
    Get.put(MainBottomNavController());
    Get.put(SendOtpToEmailController());
    Get.put(VerifyOtpController());
    Get.put(ReadProfileDataController());
    Get.put(AuthController());
    Get.put(CompleteProfileController());
  }
}
