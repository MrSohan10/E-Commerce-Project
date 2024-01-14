import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../utility/app_colors.dart';

class ProductImageCarousel extends StatefulWidget {
  const ProductImageCarousel({
    super.key,
    this.height,
  });

  final double? height;

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: widget.height ?? 240.0,
              viewportFraction: 1,
              enableInfiniteScroll: true,
              autoPlay: true,
              onPageChanged: (index, reason) {
                _currentIndex.value = index;
              }),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    // margin: const EdgeInsets.symmetric(horizontal: 0.0),
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(00),
                        color: Colors.grey.shade400,),
                    alignment: Alignment.center,
                    child: Text(
                      'text $i',
                      style: const TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 6),

        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
            valueListenable: _currentIndex,
            builder: (context, index, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 5; i++)
                    Container(
                      height: 12,
                      width: 12,
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: i == index
                              ? AppColors.primaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: i == index
                                ? AppColors.primaryColor
                                : Colors.white,
                          )),
                    )
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
