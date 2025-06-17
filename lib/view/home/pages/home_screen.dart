import 'package:crafty_bay/view/home/widgets/home_app_bar.dart';
import 'package:crafty_bay/view_model/categorie/category_list_view_model.dart';
import 'package:crafty_bay/view_model/home/home_banner_slider_view_model.dart';
import 'package:crafty_bay/view_model/main/main_bottom_nav_view_model.dart';
import 'package:crafty_bay/view_model/product/popular_product_list_view_model.dart';
import 'package:crafty_bay/view_model/product/special_product_list_view_model.dart';
import 'package:crafty_bay/view/product/pages/product_list_screen.dart';
import 'package:crafty_bay/core/theme/app_colors.dart';
import 'package:crafty_bay/reusable/loading/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/product/product_model.dart';
import '../../../view_model/brand/brand_list_view_model.dart';
import '../../../view_model/product/new_product_list_view_model.dart';
import '../../../reusable/widgets/category_brand_item.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/section_title.dart';
import '../../../reusable/widgets/product_card.dart';
import '../../brand/pages/brand_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const SizedBox(height: 4),
              searchTextFormField,
              const SizedBox(height: 12),
              SizedBox(
                  height: 202,
                  child: GetBuilder<HomeBannerSliderViewModel>(
                      builder: (controller) {
                    return Visibility(
                      visible: controller.inProgress == false,
                      replacement: const CenterCircularProgressIndication(),
                      child: BannerCarousel(
                        sliderData:
                            controller.homeSliderModel.data?.sliderData ?? [],
                      ),
                    );
                  })),
              const SizedBox(height: 8),
              SectionTitle(
                title: 'All Categories',
                onTapSeeAll: () {
                  Get.find<MainBottomNavViewModel>().changeIndex(1);
                },
              ),
              categoryList,
              const SizedBox(height: 8),
              SectionTitle(
                title: 'All Brand',
                onTapSeeAll: () {
                  Get.to(const BrandScreen());
                },
              ),
              brandList,
              const SizedBox(height: 8),
              SectionTitle(
                title: 'Popular',
                onTapSeeAll: () {
                  Get.to(const ProductListScreen());
                },
              ),
              GetBuilder<PopularProductListViewModel>(
                builder: (controller) {
                  return Visibility(
                    visible: controller.inProgress == false,
                    replacement: const CenterCircularProgressIndication(),
                    child: productList(
                        controller.productListModel.productList ?? []),
                  );
                },
              ),
              const SizedBox(height: 8),
              SectionTitle(
                title: 'Special',
                onTapSeeAll: () {
                  Get.to(const ProductListScreen());
                },
              ),
              GetBuilder<SpecialProductListViewModel>(
                builder: (controller) {
                  return Visibility(
                    visible: controller.inProgress == false,
                    replacement: const CenterCircularProgressIndication(),
                    child: productList(
                        controller.productListModel.productList ?? []),
                  );
                },
              ),
              const SizedBox(height: 8),
              SectionTitle(
                title: 'New',
                onTapSeeAll: () {
                  Get.to(const ProductListScreen());
                },
              ),
              GetBuilder<NewProductListViewModel>(
                builder: (controller) {
                  return Visibility(
                    visible: controller.inProgress == false,
                    replacement: const CenterCircularProgressIndication(),
                    child: productList(
                        controller.productListModel.productList ?? []),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox get categoryList {
    return SizedBox(
      height: 100,
      child: GetBuilder<CategoryListViewModel>(builder: (controller) {
        return Visibility(
          visible: controller.inProgress == false,
          replacement: const CenterCircularProgressIndication(),
          child: ListView.separated(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount:
                controller.categoriesModel.data?.categorieData?.length ?? 0,
            itemBuilder: (context, index) {
              return CategoryBrandItem(
                categoryData:
                    controller.categoriesModel.data?.categorieData?[index],
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                width: 12,
              );
            },
          ),
        );
      }),
    );
  }

  SizedBox get brandList {
    return SizedBox(
      height: 100,
      child: GetBuilder<BrandListViewModel>(builder: (controller) {
        return Visibility(
          visible: controller.inProgress == false,
          replacement: const CenterCircularProgressIndication(),
          child: ListView.separated(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.brandListModel.brandDataList?.length ?? 0,
            itemBuilder: (context, index) {
              return CategoryBrandItem(
                brandData: controller.brandListModel.brandDataList![index],
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                width: 12,
              );
            },
          ),
        );
      }),
    );
  }

  SizedBox productList(List<ProductModel> productList) {
    return SizedBox(
      height: 185,
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return ProductCard(
            productModel: productList[index],
          );
        },
        separatorBuilder: (_, __) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }

  TextFormField get searchTextFormField {
    return TextFormField(
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey.shade500,
        ),
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
