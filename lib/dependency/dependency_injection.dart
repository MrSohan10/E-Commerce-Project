import 'package:crafty_bay/view_model/review/add_review_view_model.dart';
import 'package:crafty_bay/view_model/cart/add_to_cart_view_model.dart';
import 'package:crafty_bay/view_model/wish_list/add_to_wishlist_view_model.dart';
import 'package:crafty_bay/view_model/auth/auth_view_model.dart';
import 'package:crafty_bay/view_model/brand/brand_list_view_model.dart';
import 'package:crafty_bay/view_model/cart/cart_list_view_model.dart';
import 'package:crafty_bay/view_model/categorie/category_list_view_model.dart';
import 'package:crafty_bay/view_model/profile/complete_profile_view_model.dart';
import 'package:crafty_bay/view_model/invoice/create_invoice_view_model.dart';
import 'package:crafty_bay/view_model/cart/delete_cart_list_view_model.dart';
import 'package:crafty_bay/view_model/home/home_banner_slider_view_model.dart';
import 'package:crafty_bay/view_model/main/main_bottom_nav_view_model.dart';
import 'package:crafty_bay/view_model/product/new_product_list_view_model.dart';
import 'package:crafty_bay/view_model/auth/otp_time_decrease_view_model.dart';
import 'package:crafty_bay/view_model/product/popular_product_list_view_model.dart';
import 'package:crafty_bay/view_model/product/product_details_view_model.dart';
import 'package:crafty_bay/view_model/product/product_list_view_model.dart';
import 'package:crafty_bay/view_model/profile/read_profile_data_view_model.dart';
import 'package:crafty_bay/view_model/wish_list/remove_wish_list_view_model.dart';
import 'package:crafty_bay/view_model/review/review_list_view_model.dart';
import 'package:crafty_bay/view_model/auth/send_otp_to_email_view_model.dart';
import 'package:crafty_bay/view_model/product/special_product_list_view_model.dart';
import 'package:crafty_bay/view_model/auth/verify_otp_view_model.dart';
import 'package:crafty_bay/view_model/wish_list/wish_list_view_model.dart';
import 'package:get/get.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.put(OtpTimeDecreaseViewModel());
    Get.put(MainBottomNavViewModel());
    Get.put(SendOtpToEmailViewModel());
    Get.put(VerifyOtpViewModel());
    Get.put(ReadProfileDataViewModel());
    Get.put(AuthViewModel());
    Get.put(CompleteProfileViewModel());
    Get.put(HomeBannerSliderViewModel());
    Get.put(CategoryListViewModel());
    Get.put(PopularProductListViewModel());
    Get.put(SpecialProductListViewModel());
    Get.put(NewProductListViewModel());
    Get.put(ProductListViewModel());
    Get.put(ProductDetailsViewModel());
    Get.put(AddToCartViewModel());
    Get.put(CartListViewModel());
    Get.put(DeleteCartListViewModel());
    Get.put(AddToWishListViewModel());
    Get.put(WishListViewModel());
    Get.put(RemoveWishListViewModel());
    Get.put(ReviewListViewModel());
    Get.put(AddReviewViewModel());
    Get.put(CreateInvoiceViewModel());
    Get.put(BrandListViewModel());
  }
}
