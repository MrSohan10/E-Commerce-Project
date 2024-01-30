import 'package:crafty_bay/data/models/category_list_model.dart';
import 'package:crafty_bay/data/models/product_details_data.dart';
import 'package:crafty_bay/data/models/product_details_model.dart';
import 'package:get/get.dart';

import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class AddToCartController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  Future<bool> addToCart(int productId, String color, String size) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    Map<String, dynamic> inputParams = {
      "product_id": productId,
      "color": color,
      "size": size
    };
    final response = await NetworkCaller().postRequest(
      Urls.addToCart,
      body: inputParams,
    );
    _inProgress = false;
    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
