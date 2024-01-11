import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../../utility/app_colors.dart';
import '../../utility/assets_path.dart';

class CardProductItem extends StatefulWidget {
  const CardProductItem({
    super.key,
  });

  @override
  State<CardProductItem> createState() => _CardProductItemState();
}

class _CardProductItemState extends State<CardProductItem> {
  ValueNotifier<int> noOfItem = ValueNotifier(1);

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
            child: Image.asset(
              AssetsPath.shoeJpg,
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
                            "New Year Special Shoe llsdfdf",
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis),
                          ),
                          const Row(
                            children: [
                              Text('Colors: Red'),
                              SizedBox(width: 8),
                              Text('Size: XL'),
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
                    const Text(
                      '\$100',
                      style: TextStyle(
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
