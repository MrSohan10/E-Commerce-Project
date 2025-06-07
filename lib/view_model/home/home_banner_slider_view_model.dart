
import 'package:crafty_bay/model/home/home_slider_model.dart';
import 'package:get/get.dart';

import '../../data/network/network_caller.dart';
import '../../data/api/api_urls.dart';

class HomeBannerSliderViewModel extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  HomeSliderModel _homeSliderModel = HomeSliderModel();

  HomeSliderModel get homeSliderModel => _homeSliderModel;

  Future<bool> getHomeBannerList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.homeBannerSlider);
    _inProgress = false;
    if (response.isSuccess) {
      _homeSliderModel =
          HomeSliderModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
