import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/model/home/home_slider_model.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({
    super.key,
    this.height,
    required this.sliderData,
  });

  final List<SliderData> sliderData;

  final double? height;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: widget.height ?? 180.0,
              viewportFraction: 1,
              enableInfiniteScroll: true,
              autoPlay: true,
              onPageChanged: (index, reason) {
                _currentIndex.value = index;
              }),
          items: widget.sliderData.map((banner) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 0.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          banner.photoUrl ?? '',
                          height: 180,
                          fit: BoxFit.fill,
                        ),
                      ),
                      // Positioned(
                      //   top: 20,
                      //   left: 10,
                      //   child: SizedBox(
                      //     height: 180,
                      //     width: 190,
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      // Text(
                      //   banner.description ?? '',
                      //   maxLines: 4,
                      //   style: TextStyle(
                      //       fontSize: 20,
                      //       fontWeight: FontWeight.w700,
                      //       color: Colors.grey.shade800,
                      //       overflow: TextOverflow.ellipsis),
                      // ),
                      // SizedBox(
                      //   height: 30,
                      //   width: 100,
                      //   child: ElevatedButton(
                      //     onPressed: () {
                      //       Get.to(() => ProductDetailsScreen(
                      //           productId: banner.sId as int));
                      //     },
                      //     style: ElevatedButton.styleFrom(
                      //         padding: const EdgeInsets.all(0)),
                      //     child: const Text(
                      //       'Buy Now',
                      //       style:
                      //           TextStyle(fontWeight: FontWeight.w700),
                      //     ),
                      //   ),
                      // )
                      //       ],
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 6),
        ValueListenableBuilder(
          valueListenable: _currentIndex,
          builder: (context, index, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < widget.sliderData.length; i++)
                  Container(
                    height: 12,
                    width: 12,
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: i == index
                            ? AppColors.primaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color:
                              i == index ? AppColors.primaryColor : Colors.grey,
                        )),
                  )
              ],
            );
          },
        )
      ],
    );
  }
}
