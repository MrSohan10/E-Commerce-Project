import 'package:crafty_bay/presentation/ui/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holder/main_bottom_nav_controller.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_){
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: appBar,
        body: Padding(
          padding: const EdgeInsets.only(left: 14,right: 14),
          child: GridView.builder(
            itemCount: 100,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 5,
              mainAxisSpacing: 12,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, index) {
              return const FittedBox(
                child: CategoryItem(),
              );
            },
          ),
        ),
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Get.find<MainBottomNavController>().backToHome();
        },
      ),
      title: const Text('Category'),
    );
  }
}
