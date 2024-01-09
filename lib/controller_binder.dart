
import 'package:crafty_bay/presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/state_holder/otp_time_decrease_controller.dart';
import 'package:get/get.dart';


class controllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(OtpTimeDecreaseController());
    Get.put(MainBottomNavController());

  }
}