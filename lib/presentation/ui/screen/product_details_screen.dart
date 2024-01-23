import 'package:crafty_bay/presentation/ui/screen/reviews_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/product_image_carousel.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/size_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../utility/app_colors.dart';
import '../widgets/product_details/color_selector.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ValueNotifier<int> noOfItem = ValueNotifier(1);
  List<Color> colors = [
    Colors.purple,
    Colors.green,
    Colors.amber,
    Colors.cyanAccent,
    Colors.grey,
  ];
  List<String> sizes = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
    'XXXL',
  ];
  Color _selectedColor = Colors.purple;
  String _selectedSize = 'S';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ProductImageCarousel(),
                  const SizedBox(height: 1),
                  productDetailsBody,
                ],
              ),
            ),
          ),
          priceAndAddToCartSection,
        ],
      ),
    );
  }

  Padding get productDetailsBody {
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
                      'Nike Sport Shoe 2023 Edition ED23R - Save 30%',
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
              reviewAndRatingRow,
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
                colors: colors,
                onChange: (selectedColor) {
                  _selectedColor = selectedColor;
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
                  sizes: sizes,
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
                '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
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

  Row get reviewAndRatingRow {
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
              '4.4',
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
          onTap: (){
            Get.to(()=> const ReviewsScreen());
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
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Add To Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
