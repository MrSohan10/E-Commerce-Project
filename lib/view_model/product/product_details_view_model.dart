import 'package:crafty_bay/model/product/product_details_data.dart';
import 'package:crafty_bay/model/product/product_details_model.dart';
import 'package:get/get.dart';

import '../../data/network/network_caller.dart';
import '../../data/api/api_urls.dart';

class ProductDetailsViewModel extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  ProductDetailsModel _productDetailsModel = ProductDetailsModel();

  ProductDetailsData get productDetails =>
      _productDetailsModel.productDetailsDataList!.first;

  Future<bool> getProductDetails(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response =
        await NetworkCaller().getRequest(Urls.productDetails(productId));
    _inProgress = false;
    if (response.isSuccess) {
      _productDetailsModel =
          ProductDetailsModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
