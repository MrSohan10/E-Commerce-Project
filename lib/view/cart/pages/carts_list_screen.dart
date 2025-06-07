import 'package:crafty_bay/view_model/cart/cart_list_view_model.dart';
import 'package:crafty_bay/view/check_out/pages/checkout_screen.dart';
import 'package:crafty_bay/core/theme/app_colors.dart';
import 'package:crafty_bay/reusable/loading/center_circular_progress_indicator.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_model/main/main_bottom_nav_view_model.dart';
import '../widgets/card_product_item.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CartListViewModel>().getCartList();
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
        body: GetBuilder<CartListViewModel>(builder: (controller) {
          if (controller.inProgress) {
            return const CenterCircularProgressIndication();
          }
          return Visibility(
            visible: controller.cartListModel.cartItemList?.isNotEmpty ?? false,
            replacement: const Center(
              child: Text('Empty Cart List'),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4, top: 4),
                    child: ListView.builder(
                        itemCount:
                            controller.cartListModel.cartItemList?.length ?? 0,
                        itemBuilder: (context, index) {
                          return CardProductItem(
                            cartItemData:
                                controller.cartListModel.cartItemList![index],
                          );
                        }),
                  ),
                ),
                totalPriceCheckoutSection(controller.totalPrice)
              ],
            ),
          );
        }),
      ),
    );
  }

  Container totalPriceCheckoutSection(RxDouble totalPrice) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.15),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Price',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700,
                ),
              ),
              Obx(() {
                return Text(
                  '৳$totalPrice',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                );
              }),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {
                Get.to(()=> const CheckoutScreen());
              },
              child: const Text('Checkout'),
            ),
          ),
        ],
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
      title: const Text('Cart'),
    );
  }
}
