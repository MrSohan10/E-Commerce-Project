import 'package:crafty_bay/model/profile/complete_profile_model.dart';
import 'package:crafty_bay/model/profile/create_profile_params.dart';
import 'package:crafty_bay/view_model/auth/auth_view_model.dart';
import 'package:get/get.dart';
import '../../data/network/network_caller.dart';
import '../../data/api/api_urls.dart';

class CompleteProfileViewModel extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  CompleteProfileModel _completeProfile = CompleteProfileModel();

  CompleteProfileModel get completeProfile => _completeProfile;

  Future<bool> createProfileData(
      String token, CreateProfileParams createProfileParams) async {
    _inProgress = true;
    update();
    final response = await NetworkCaller().postRequest(Urls.createProfile,
        token: token, body: createProfileParams.toJson());
    _inProgress = false;
    if (response.isSuccess) {
      _completeProfile = CompleteProfileModel.fromJson(response.responseData['data']);
      await Get.find<AuthViewModel>().saveUserDetails(token,null, _completeProfile);
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
