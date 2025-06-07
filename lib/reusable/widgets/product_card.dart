import 'package:crafty_bay/model/product/product_model.dart';
import 'package:crafty_bay/view_model/wish_list/add_to_wishlist_view_model.dart';
import 'package:crafty_bay/view_model/wish_list/wish_list_view_model.dart';
import 'package:crafty_bay/view/product/pages/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_model/wish_list/remove_wish_list_view_model.dart';
import '../../core/theme/app_colors.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.productModel,
    this.addToWishList = true,
  });

  final bool addToWishList;
  final ProductModel productModel;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(ProductDetailsScreen(
          productId: widget.productModel.id!,
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
                  widget.productModel.image ?? '',
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
                      widget.productModel.title ?? '',
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
                          '৳${widget.productModel.price}',
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
                              widget.productModel.star.toString(),
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
                            if (widget.addToWishList) {
                              bool response =
                                  await Get.find<AddToWishListViewModel>()
                                      .addToWishList(widget.productModel.id!);
                              if (response) {
                                Get.showSnackbar(const GetSnackBar(
                                  title: 'Success',
                                  message:
                                      'This product has been added to wishList',
                                  duration: Duration(seconds: 2),
                                  isDismissible: true,
                                ));
                              } else {
                                Get.showSnackbar(GetSnackBar(
                                  title: 'Add to wishList failed',
                                  message: Get.find<AddToWishListViewModel>()
                                      .errorMessage,
                                  duration: const Duration(seconds: 2),
                                  isDismissible: true,
                                  backgroundColor: Colors.red,
                                ));
                              }
                            }
                            if (widget.addToWishList == false) {
                              // ignore: use_build_context_synchronously
                              showDialog(
                                  // ignore: use_build_context_synchronously
                                  context: context,
                                  builder: (BuildContext context) {
                                    return removeAlertDialog;
                                  });
                            }
                          },
                          borderRadius: BorderRadius.circular(4),
                          child: Card(
                            color: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(
                                widget.addToWishList == false
                                    ? Icons.delete_forever
                                    : Icons.favorite_border_outlined,
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

  AlertDialog get removeAlertDialog {
    return AlertDialog(
      title: const Text('Remove'),
      content: const Text('Do you want to remove this item?'),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('No')),
        TextButton(
            onPressed: () async {
              Get.find<RemoveWishListViewModel>()
                  .removeWishListItem(widget.productModel.id!);
              Get.find<WishListViewModel>()
                  .wishListModel
                  .wishItemList!
                  .clear();
              Get.find<WishListViewModel>().getWishList();
              Get.back();
            },
            child: const Text('Yes')),
      ],
    );
  }
}

class Class extends StatelessWidget {
  const Class({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        children: [
          Container(),
          const SizedBox(),
          const Text('Crafty bar'),
          Image.network('sfowenoer'),
        ],
      ),
    );
  }
}
