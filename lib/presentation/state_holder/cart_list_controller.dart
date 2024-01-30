import 'dart:developer';

import 'package:crafty_bay/data/models/cart_list_model.dart';
import 'package:crafty_bay/presentation/state_holder/auth_controller.dart';
import 'package:get/get.dart';

import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class CartListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  CartListModel _cartListModel = CartListModel();

  CartListModel get cartListModel => _cartListModel;

  Future<bool> getCartList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.cartList);
    log(AuthController.token.toString());
    _inProgress = false;
    if (response.isSuccess) {
      _cartListModel = CartListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
