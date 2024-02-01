import 'package:crafty_bay/data/models/cart_item_data.dart';
import 'package:crafty_bay/presentation/state_holder/cart_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../../utility/app_colors.dart';

class CardProductItem extends StatefulWidget {
  const CardProductItem({
    super.key, required this.cartItemData,
  });

  final CartItemData cartItemData;

  @override
  State<CardProductItem> createState() => _CardProductItemState();
}

class _CardProductItemState extends State<CardProductItem> {

  ValueNotifier<int> noOfItem = ValueNotifier(1);


  @override
  void initState() {
    super.initState();
    noOfItem.value = int.parse(widget.cartItemData.qty!);
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
                      onPressed: () {},
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
                              Get.find<CartListController>().updateQuantity(
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
}
