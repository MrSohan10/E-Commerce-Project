import 'package:get/get.dart';

import '../../data/network/network_caller.dart';
import '../../data/api/api_urls.dart';

class AddReviewViewModel extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  Future<bool> addReview(int productId, int rating, String description) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    Map<String, dynamic> inputParams = {
      "description": description,
      "product_id": productId,
      "rating": rating
    };
    final response = await NetworkCaller().postRequest(
      Urls.addReview,
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
