import 'package:crafty_bay/presentation/state_holder/auth_controller.dart';
import 'package:get/get.dart';

import '../../data/models/profile.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class CompleteProfileController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  Profile _profile = Profile();

  Profile get profile => _profile;

  Future<bool> createProfileData(
      String token,
      String firstName,
      String lastName,
      String mobile,
      String city,
      String shippingAddress) async {
    _inProgress = true;
    update();

    Map<String, dynamic> inputParams = {
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
      "city": city,
      "shippingAddress": shippingAddress
    };
    final response = await NetworkCaller()
        .postRequest(Urls.createProfile, token: token, body: inputParams);
    _inProgress = false;
    if (response.isSuccess) {
      _profile = Profile.fromJson(response.responseData['data']);
     await Get.find<AuthController>().saveUserDetails(token, _profile);
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
