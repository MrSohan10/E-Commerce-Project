import 'dart:developer';

import 'package:crafty_bay/model/cart/cart_item_data.dart';
import 'package:crafty_bay/model/cart/cart_list_model.dart';
import 'package:crafty_bay/view_model/auth/auth_view_model.dart';
import 'package:get/get.dart';

import '../../data/network/network_caller.dart';
import '../../data/api/api_urls.dart';

class CartListViewModel extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  CartListModel _cartListModel = CartListModel();

  CartListModel get cartListModel => _cartListModel;

  final RxDouble _totalPrice = 0.0.obs;
  RxDouble get totalPrice => _totalPrice;

  Future<bool> getCartList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.cartList);
    log(AuthViewModel.token.toString());
    _inProgress = false;
    if (response.isSuccess) {
      _cartListModel = CartListModel.fromJson(response.responseData);
      _totalPrice.value = _calculateTotalPrice;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }

  void updateQuantity(int id, int quantity) {
    _cartListModel.cartItemList?.firstWhere((element) => element.id == id).qty =
        quantity.toString();

    _totalPrice.value = _calculateTotalPrice;
  }

  double get _calculateTotalPrice {
    double total = 0;
    for (CartItemData item in _cartListModel.cartItemList ?? []) {
      total += (double.tryParse(item.product?.price ?? '0') ?? 0) *
          int.parse(item.qty!);
    }
    return total;
  }
}
