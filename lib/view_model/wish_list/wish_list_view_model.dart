import 'dart:developer';

import 'package:crafty_bay/model/wish_list/wish_list_model.dart';
import 'package:crafty_bay/view_model/auth/auth_view_model.dart';
import 'package:get/get.dart';

import '../../data/network/network_caller.dart';
import '../../data/api/api_urls.dart';

class WishListViewModel extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  WishListModel _wishListModel = WishListModel();

  WishListModel get wishListModel => _wishListModel;

  Future<bool> getWishList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.wishList);
    log(AuthViewModel.token.toString());
    _inProgress = false;
    if (response.isSuccess) {
      _wishListModel = WishListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
