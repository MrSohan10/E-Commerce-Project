import 'package:crafty_bay/view_model/auth/auth_view_model.dart';
import 'package:get/get.dart';

class MainBottomNavViewModel extends GetxController {
  int _selectedIndex = 0;
  int get currentIndex => _selectedIndex;

  void changeIndex(int index) {
    if (_selectedIndex == index) {
      return;
    }
    if (index == 2 || index == 3) {
      if (Get.find<AuthViewModel>().isTokenNotNull == false) {
        AuthViewModel.goToLogin();
        return;
      }
    }
    _selectedIndex = index;
    update();
  }

  void backToHome() {
    changeIndex(0);
  }
}
