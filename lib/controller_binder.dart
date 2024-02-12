import 'package:crafty_bay/presentation/state_holder/add_review_controller.dart';
import 'package:crafty_bay/presentation/state_holder/add_to_cart_controller.dart';
import 'package:crafty_bay/presentation/state_holder/add_to_wishlist_controller.dart';
import 'package:crafty_bay/presentation/state_holder/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holder/brand_list_controller.dart';
import 'package:crafty_bay/presentation/state_holder/cart_list_controller.dart';
import 'package:crafty_bay/presentation/state_holder/category_list_controller.dart';
import 'package:crafty_bay/presentation/state_holder/complete_profile_controller.dart';
import 'package:crafty_bay/presentation/state_holder/create_invoice_controller.dart';
import 'package:crafty_bay/presentation/state_holder/delete_cart_list_controller.dart';
import 'package:crafty_bay/presentation/state_holder/home_banner_slider_controller.dart';
import 'package:crafty_bay/presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/state_holder/new_product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holder/otp_time_decrease_controller.dart';
import 'package:crafty_bay/presentation/state_holder/popular_product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holder/product_details_controller.dart';
import 'package:crafty_bay/presentation/state_holder/product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holder/read_profile_data_controller.dart';
import 'package:crafty_bay/presentation/state_holder/remove_wish_list_controller.dart';
import 'package:crafty_bay/presentation/state_holder/review_list_controller.dart';
import 'package:crafty_bay/presentation/state_holder/send_otp_to_email_controller.dart';
import 'package:crafty_bay/presentation/state_holder/special_product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holder/verify_otp_controller.dart';
import 'package:crafty_bay/presentation/state_holder/wish_list_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(OtpTimeDecreaseController());
    Get.put(MainBottomNavController());
    Get.put(SendOtpToEmailController());
    Get.put(VerifyOtpController());
    Get.put(ReadProfileDataController());
    Get.put(AuthController());
    Get.put(CompleteProfileController());
    Get.put(HomeBannerSliderController());
    Get.put(CategoryListController());
    Get.put(PopularProductListController());
    Get.put(SpecialProductListController());
    Get.put(NewProductListController());
    Get.put(ProductListController());
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());
    Get.put(CartListController());
    Get.put(DeleteCartListController());
    Get.put(AddToWishListController());
    Get.put(WishListController());
    Get.put(RemoveWishListController());
    Get.put(ReviewListController());
    Get.put(AddReviewController());
    Get.put(CreateInvoiceController());
    Get.put(BrandListController());
  }
}
