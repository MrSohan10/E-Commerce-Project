import 'dart:math';

import 'package:crafty_bay/data/models/product_details_data.dart';
import 'package:crafty_bay/presentation/state_holder/addToCartController.dart';
import 'package:crafty_bay/presentation/state_holder/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holder/product_details_controller.dart';
import 'package:crafty_bay/presentation/ui/screen/auth/verify_email_screen.dart';
import 'package:crafty_bay/presentation/ui/screen/reviews_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/product_image_carousel.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/size_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../utility/app_colors.dart';
import '../widgets/product_details/color_selector.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ValueNotifier<int> noOfItem = ValueNotifier(1);
  String? _selectedColor;
  String? _selectedSize;

  @override
  void initState() {
    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: GetBuilder<ProductDetailsController>(builder: (controller) {
        return Visibility(
          visible: controller.inProgress == false,
          replacement: const CenterCircularProgressIndication(),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductImageCarousel(
                        imgUrls: [
                          controller.productDetails.img1 ?? '',
                          controller.productDetails.img2 ?? '',
                          controller.productDetails.img3 ?? '',
                          controller.productDetails.img4 ?? '',
                        ],
                      ),
                      const SizedBox(height: 1),
                      productDetailsBody(controller.productDetails),
                    ],
                  ),
                ),
              ),
              priceAndAddToCartSection,
            ],
          ),
        );
      }),
    );
  }

  Padding productDetailsBody(ProductDetailsData productDetails) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      productDetails.product?.title ?? '',
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  ValueListenableBuilder(
                      valueListenable: noOfItem,
                      builder: (context, value, _) {
                        return ItemCount(
                          initialValue: value,
                          minValue: 1,
                          maxValue: 20,
                          decimalPlaces: 0,
                          color: AppColors.primaryColor,
                          onChanged: (v) {
                            noOfItem.value = v.toInt();
                          },
                        );
                      })
                ],
              ),
              const SizedBox(height: 2),
              reviewAndRatingRow(productDetails.product?.star ?? 0),
              const SizedBox(height: 4),
              Text(
                'Color',
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              ColorSelector(
                colors: productDetails.color
                        ?.split(',')
                        .map((e) => getColorFromString(e))
                        .toList() ??
                    [],
                onChange: (selectedColor) {
                  _selectedColor = selectedColor.toString();
                },
              ),
              const SizedBox(height: 4),
              Text(
                'Size',
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              SizeSelector(
                  sizes: productDetails.size?.split(',') ?? [],
                  onChange: (selectedSize) {
                    _selectedSize = selectedSize;
                  }),
              const SizedBox(height: 14),
              Text(
                'Description',
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                productDetails.des ?? '',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 14,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Row reviewAndRatingRow(double rating) {
    return Row(
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 20,
            ),
            Text(
              rating.toStringAsPrecision(2),
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(width: 16),
        InkWell(
          onTap: () {
            Get.to(() => const ReviewsScreen());
          },
          borderRadius: BorderRadius.circular(4),
          child: const Text(
            'Reviews',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Card(
          color: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              Icons.favorite_border_outlined,
              size: 18,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Container get priceAndAddToCartSection {
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
                'Price',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700,
                ),
              ),
              const Text(
                '\$1000',
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
            child: GetBuilder<AddToCartController>(builder: (controller) {
              return ElevatedButton(
                onPressed: () async {
                  if (_selectedColor != null && _selectedSize != null) {
                    if (Get.find<AuthController>().isTokenNotNull) {
                      _selectedColor = (colorToHashColorCode(_selectedColor!));
                      print(_selectedColor);
                      print(_selectedSize);
                      final response = await controller.addToCart(
                          widget.productId, _selectedColor!, _selectedSize!);
                      if (response) {
                        Get.showSnackbar(const GetSnackBar(
                          title: 'Success',
                          message: 'This product has been added to cart',
                          duration: Duration(seconds: 2),
                          isDismissible: true,
                        ));
                      } else {
                        Get.showSnackbar(GetSnackBar(
                          title: 'Add to cart failed',
                          message: controller.errorMessage,
                          duration: const Duration(seconds: 2),
                          isDismissible: true,
                          backgroundColor: Colors.red,
                        ));
                      }
                    } else {
                      Get.to(() => const VerifyEmailScreen());
                    }
                  } else {
                    Get.showSnackbar(const GetSnackBar(
                      title: 'Add to cart failed',
                      message: 'Please select color and size',
                      duration: Duration(seconds: 2),
                      isDismissible: true,
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                child: const Text('Add To Cart'),
              );
            }),
          ),
        ],
      ),
    );
  }

  Color getColorFromString(String colorCode) {
    String code = colorCode.replaceAll('#', '');
    String hexCode = 'FF$code';
    return Color(int.parse('0x$hexCode'));
  }

  String colorToHashColorCode(String colorCode) {
    return colorCode
        .toString()
        .replaceAll('0xff', '#')
        .replaceAll('Color(', '')
        .replaceAll(')', '');
  }
}
