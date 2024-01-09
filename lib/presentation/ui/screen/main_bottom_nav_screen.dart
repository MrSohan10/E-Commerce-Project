import 'package:crafty_bay/presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/screen/carts_screen.dart';
import 'package:crafty_bay/presentation/ui/screen/category_screen.dart';
import 'package:crafty_bay/presentation/ui/screen/home_screen.dart';
import 'package:crafty_bay/presentation/ui/screen/wishlist_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

   final List<Widget> _screen = const [
     HomeScreen(),
     CategoryScreen(),
     CartScreen(),
     WishlistScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (controller) {
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
              BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard), label: "Categories"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "Carts"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Wishlist"),
            ],
          ),
        );
      }
    );
  }
}
