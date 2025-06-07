import 'package:crafty_bay/view_model/categorie/category_list_view_model.dart';
import 'package:crafty_bay/reusable/widgets/category_brand_item.dart';
import 'package:crafty_bay/reusable/loading/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_model/main/main_bottom_nav_view_model.dart';

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
      onPopInvoked: (_) {
        Get.find<MainBottomNavViewModel>().backToHome();
      },
      child: Scaffold(
        appBar: appBar,
        body: Padding(
          padding: const EdgeInsets.only(left: 14, right: 14),
          child: GetBuilder<CategoryListViewModel>(builder: (controller) {
            return Visibility(
              visible: controller.inProgress == false,
              replacement: const CenterCircularProgressIndication(),
              child: GridView.builder(
                itemCount:
                    controller.categoryListModel.categoryDataList?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  return FittedBox(
                    child: CategoryBrandItem(
                      categoryData:
                          controller.categoryListModel.categoryDataList![index],
                    ),
                  );
                },
              ),
            );
          }),
        ),
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Get.find<MainBottomNavViewModel>().backToHome();
        },
      ),
      title: const Text('Category'),
    );
  }
}
