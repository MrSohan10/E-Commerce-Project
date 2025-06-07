import 'package:crafty_bay/model/cart/cart_item_data.dart';
import 'package:crafty_bay/view_model/cart/cart_list_view_model.dart';
import 'package:crafty_bay/view_model/cart/delete_cart_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../../../core/theme/app_colors.dart';

class CardProductItem extends StatefulWidget {
  const CardProductItem({
    super.key,
    required this.cartItemData,
  });

  final CartItemData cartItemData;

  @override
  State<CardProductItem> createState() => _CardProductItemState();
}

class _CardProductItemState extends State<CardProductItem> {
  late ValueNotifier<int> noOfItem =
      ValueNotifier(int.parse(widget.cartItemData.qty!));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0.7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            child: Image.network(
              widget.cartItemData.product?.image ?? '',
              width: 120,
              height: 104,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.cartItemData.product?.title ?? '',
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis),
                          ),
                          Row(
                            children: [
                              Text('Colors: ${widget.cartItemData.color}'),
                              const SizedBox(width: 8),
                              Text('Size: ${widget.cartItemData.size}'),
                            ],
                          )
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return deleteAlertDialog;
                            });
                      },
                      icon: Icon(
                        Icons.delete_forever,
                        color: Colors.grey.shade600,
                        size: 28,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '৳${widget.cartItemData.product?.price ?? 0}',
                      style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
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
                              Get.find<CartListViewModel>().updateQuantity(
                                  widget.cartItemData.id!, noOfItem.value);
                            },
                          );
                        })
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  AlertDialog get deleteAlertDialog {
    return AlertDialog(
      title: const Text('Delete'),
      content: const Text('Do you want to delete this item?'),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('No')),
        TextButton(
            onPressed: () async {
              Get.find<DeleteCartListViewModel>()
                  .deleteCartListItem(widget.cartItemData.productId!);
              Get.find<CartListViewModel>()
                  .cartListModel
                  .cartItemList!
                  .clear();
              Get.find<CartListViewModel>().getCartList();
              Get.back();
            },
            child: const Text('Yes')),
      ],
    );
  }
}
