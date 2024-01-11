import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holder/main_bottom_nav_controller.dart';
import '../widgets/carts/card_product_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: appBar,
        body: Column(
          children: [
             Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const CardProductItem();
                  }
                ),
              ),
            ),
            totalPriceCheckoutSection
          ],
        ),
      ),
    );
  }

  Container get totalPriceCheckoutSection {
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
              const Text(
                '\$1079357',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              )
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {},
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
          Get.find<MainBottomNavController>().backToHome();
        },
      ),
      title: const Text('Cart'),
    );
  }
}
