import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:crafty_bay/presentation/state_holder/read_profile_data_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class VerifyOtpController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  bool _shouldNavigateCompleteProfile = true;

  bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;

  Future<bool> verifyOtp(String email, String otp) async {
    _inProgress = true;
    update();
    final response =
        await NetworkCaller().getRequest(Urls.verifyOtp(email, otp));
    _inProgress = false;
    if (response.isSuccess) {
      final token = response.responseData['data'];
     await Future.delayed(const Duration(seconds: 2));
      final result =
          await Get.find<ReadProfileDataController>().readProfileData(token);
      if (result) {
        _shouldNavigateCompleteProfile =
            Get.find<ReadProfileDataController>().isProfileCompleted == false;
      } else {
        _errorMessage = Get.find<ReadProfileDataController>().errorMessage;
        update();
        return false;
      }
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
