import 'package:crafty_bay/data/models/product_model.dart';
import 'package:crafty_bay/presentation/state_holder/add_to_wishlist_controller.dart';
import 'package:crafty_bay/presentation/ui/screen/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/app_colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(ProductDetailsScreen(
          productId: productModel.id!,
        ));
      },
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 185,
        width: 150,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  productModel.image ?? '',
                  width: 150,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productModel.title ?? '',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '\$${productModel.price}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 14,
                            ),
                            Text(
                              productModel.star.toString(),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () async {
                            bool response =
                                await Get.find<AddToWishListController>()
                                    .addToWishList(productModel.id!);
                            if (response) {
                              Get.showSnackbar(const GetSnackBar(
                                title: 'Success',
                                message: 'This product has been added to cart',
                                duration: Duration(seconds: 2),
                                isDismissible: true,
                              ));
                            } else {
                              Get.showSnackbar(GetSnackBar(
                                title: 'Add to wishList failed',
                                message: Get.find<AddToWishListController>()
                                    .errorMessage,
                                duration: const Duration(seconds: 2),
                                isDismissible: true,
                                backgroundColor: Colors.red,
                              ));
                            }
                          },
                          borderRadius: BorderRadius.circular(4),
                          child: Card(
                            color: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.favorite_border_outlined,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
