import 'package:crafty_bay/view_model/wish_list/wish_list_view_model.dart';
import 'package:crafty_bay/reusable/loading/center_circular_progress_indicator.dart';
import 'package:crafty_bay/reusable/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../view_model/main/main_bottom_nav_view_model.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<WishListViewModel>().getWishList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainBottomNavViewModel>().backToHome();
      },
      child: Scaffold(
        appBar: appBar,
        body: GetBuilder<WishListViewModel>(builder: (controller) {
          if (controller.inProgress) {
            return const CenterCircularProgressIndication();
          }
          return Visibility(
            visible: controller.wishListModel.wishItemList?.isNotEmpty ?? false,
            replacement: const Center(
              child: Text('Empty Wish List'),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 4),
              child: GridView.builder(
                itemCount: controller.wishListModel.wishItemList?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return FittedBox(
                    child: ProductCard(
                      productModel: controller
                          .wishListModel.wishItemList![index].product!,
                      addToWishList: false,
                    ),
                  );
                },
              ),
            ),
          );
        }),
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
      title: const Text('Wish List'),
    );
  }
}
