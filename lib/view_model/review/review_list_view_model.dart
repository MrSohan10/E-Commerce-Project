import 'dart:developer';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../model/review/review_list_model.dart';
import '../../data/network/network_caller.dart';
import '../../data/api/api_urls.dart';
import '../auth/auth_view_model.dart';

class ReviewListViewModel extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  ReviewListModel _reviewListModel = ReviewListModel();

  ReviewListModel get reviewListModel => _reviewListModel;

  Future<bool> getReviewList(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response =
        await NetworkCaller().getRequest(Urls.listReviewByProduct(productId));
    log(AuthViewModel.token.toString());
    _inProgress = false;
    if (response.isSuccess) {
      _reviewListModel = ReviewListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }

}
