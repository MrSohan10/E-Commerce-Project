import 'package:crafty_bay/models/category_list_model.dart';
import 'package:get/get.dart';

import '../../data/network/network_caller.dart';
import '../../data/api/api_urls.dart';

class CategoryListViewModel extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  CategoryListModel _categoryListModel = CategoryListModel();

  CategoryListModel get categoryListModel => _categoryListModel;

  Future<bool> getCategoryList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.categoryList);
    _inProgress = false;
    if (response.isSuccess) {
      _categoryListModel = CategoryListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
