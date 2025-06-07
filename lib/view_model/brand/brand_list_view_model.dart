import 'package:crafty_bay/models/brand_list_model.dart';
import 'package:get/get.dart';

import '../../data/network/network_caller.dart';
import '../../data/api/api_urls.dart';

class BrandListViewModel extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  BrandListModel _brandListModel = BrandListModel();

  BrandListModel get brandListModel => _brandListModel;

  Future<bool> getBrandList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.brandyList);
    _inProgress = false;
    if (response.isSuccess) {
      _brandListModel = BrandListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
