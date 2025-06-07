import 'package:crafty_bay/models/response_data.dart';
import 'package:crafty_bay/data/network/network_caller.dart';
import 'package:crafty_bay/data/api/api_urls.dart';
import 'package:get/get.dart';

class SendOtpToEmailViewModel extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  bool get inProgress => _inProgress;
  String get errorMessage => _errorMessage;

  Future<bool> sendOtpToEmail(String email) async {
    _inProgress = true;
    update();
    final ResponseData response =
        await NetworkCaller().getRequest(Urls.sendEmailOtp(email));
    _inProgress = false;
    if (response.isSuccess) {
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
