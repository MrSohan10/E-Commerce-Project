import 'package:crafty_bay/view_model/product/product_list_view_model.dart';
import 'package:crafty_bay/reusable/loading/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../reusable/widgets/product_card.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, this.title, this.id});

  final String? title;
  final int? id;
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.id != null) {
      Get.find<ProductListViewModel>().getProductList(id: widget.id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? 'All Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: GetBuilder<ProductListViewModel>(builder: (controller) {
          return Visibility(
            visible: controller.inProgress == false,
            replacement: const CenterCircularProgressIndication(),
            child: Visibility(
              visible:
                  controller.productListModel.productList?.isNotEmpty ?? false,
              replacement: const Center(child: Text('Product Not Available')),
              child: GridView.builder(
                itemCount: controller.productListModel.productList?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return FittedBox(
                    child: ProductCard(
                      productModel:
                          controller.productListModel.productList![index],
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
}
