import 'package:crafty_bay/view_model/review/review_list_view_model.dart';
import 'package:crafty_bay/view/review/pages/create_review_screen.dart';
import 'package:crafty_bay/reusable/loading/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../view_model/auth/auth_view_model.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/reviews_card.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ReviewListViewModel>().getReviewList(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: GetBuilder<ReviewListViewModel>(builder: (controller) {
        if (controller.inProgress) {
          return const CenterCircularProgressIndication();
        }
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 4, right: 4, top: 4),
                child: Visibility(
                  visible: controller.reviewListModel.reviewList?.isNotEmpty ??
                      false,
                  replacement: const Center(
                    child: Text('Reviews not available'),
                  ),
                  child: ListView.builder(
                    itemCount:
                        controller.reviewListModel.reviewList?.length ?? 0,
                    itemBuilder: (context, index) {
                      return ReviewsCard(
                        reviewData:
                            controller.reviewListModel.reviewList![index],
                      );
                    },
                  ),
                ),
              ),
            ),
            totalAndCreateReviewsSection(
                controller.reviewListModel.reviewList?.length??0),
          ],
        );
      }),
    );
  }

  Container totalAndCreateReviewsSection(int totalReviews) {
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
          Text(
            'Reviews (${totalReviews.toString()})',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
              ),
              onPressed: () {
                if (Get.find<AuthViewModel>().isTokenNotNull == false) {
                  AuthViewModel.goToLogin();
                  return;
                }
                Get.to(() => CreateReviewScreen(
                      productId: widget.productId,
                    ));
              },
              child: const Icon(
                Icons.add,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
