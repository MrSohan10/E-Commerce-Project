import 'package:crafty_bay/data/models/response_data.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class SendOtpToEmailController extends GetxController{
  bool _inProgress = false;
  String _errorMessage = '';
  bool get inProgress => _inProgress;
  String get errorMessage => _errorMessage;

  Future <bool> sendOtpToEmail (String email) async {
    _inProgress = true;
    update();
    final ResponseData response = await NetworkCaller().getRequest(Urls.sendEmailOtp(email));
    _inProgress = false;
    update();
    if(response.isSuccess){
      return true;
    }else{
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}