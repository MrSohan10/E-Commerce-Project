import 'package:crafty_bay/model/brand/brand_data.dart';
import 'package:crafty_bay/model/categorie/categorie_model.dart';

import 'package:crafty_bay/view/product/pages/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';

class CategoryBrandItem extends StatelessWidget {
  const CategoryBrandItem({
    super.key,
    this.categoryData,
    this.brandData,
  });

  final CategoryData? categoryData;
  final BrandData? brandData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProductListScreen(
          title: categoryData?.title ?? brandData?.brandName ?? '',
          id: categoryData?.sId ??
          brandData?.id.toString(),
        ));
      },
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: AppColors.primaryColor.withOpacity(0.1),
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.network(
                  categoryData?.icon ?? brandData?.brandImg ?? '',
                  width: 50,
                  height: 50,
                )),
          ),
          Text(
            categoryData?.title ?? brandData?.brandName ?? '',
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
