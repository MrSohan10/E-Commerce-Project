import 'package:crafty_bay/view_model/brand/brand_list_view_model.dart';
import 'package:crafty_bay/view_model/categorie/category_list_view_model.dart';
import 'package:crafty_bay/view_model/home/home_banner_slider_view_model.dart';
import 'package:crafty_bay/view_model/main/main_bottom_nav_view_model.dart';
import 'package:crafty_bay/view_model/product/popular_product_list_view_model.dart';
import 'package:crafty_bay/view/cart/pages/carts_list_screen.dart';
import 'package:crafty_bay/view/categories/pages/category_screen.dart';
import 'package:crafty_bay/view/home/pages/home_screen.dart';
import 'package:crafty_bay/view/wish_list/pages/wishlist_screen.dart';
import 'package:crafty_bay/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_model/product/new_product_list_view_model.dart';
import '../../../view_model/product/special_product_list_view_model.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List<Widget> _screen = const [
    HomeScreen(),
    CategoryScreen(),
    CartListScreen(),
    WishlistScreen(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<HomeBannerSliderViewModel>().getHomeBannerList();
      Get.find<CategoryListViewModel>().getCategoryList();
      Get.find<BrandListViewModel>().getBrandList();
      Get.find<PopularProductListViewModel>().getPopularProductList();
      Get.find<SpecialProductListViewModel>().getSpecialProductList();
      Get.find<NewProductListViewModel>().getNewProductList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavViewModel>(builder: (controller) {
      return Scaffold(
        body: _screen[controller.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: (index) {
            controller.changeIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Carts"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Wishlist"),
          ],
        ),
      );
    });
  }
}
