import 'package:crafty_bay/data/network/network_caller.dart';
import 'package:crafty_bay/data/api/api_urls.dart';
import 'package:crafty_bay/view_model/auth/auth_view_model.dart';
import 'package:crafty_bay/view_model/profile/read_profile_data_view_model.dart';
import 'package:get/get.dart';

class VerifyOtpViewModel extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  bool _shouldNavigateCompleteProfile = true;

  bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;
  String _token = '';

  String get token => _token;

  Future<bool> verifyOtp(String email, String otp) async {
    _inProgress = true;
    update();
    final response =
        await NetworkCaller().getRequest(Urls.verifyOtp(email, otp));
    _inProgress = false;
    if (response.isSuccess) {
      _token = response.responseData['data'];
      final result =
          await Get.find<ReadProfileDataViewModel>().readProfileData(_token);
      if (result) {
        _shouldNavigateCompleteProfile =
            Get.find<ReadProfileDataViewModel>().isProfileCompleted == false;
        if (_shouldNavigateCompleteProfile == false) {
          Get.find<AuthViewModel>().saveUserDetails(
              _token, Get.find<ReadProfileDataViewModel>().readProfile,null);
        }
      } else {
        _errorMessage = Get.find<ReadProfileDataViewModel>().errorMessage;
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
