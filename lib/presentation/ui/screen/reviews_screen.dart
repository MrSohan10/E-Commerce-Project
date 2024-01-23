import 'package:crafty_bay/presentation/ui/screen/create_review_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utility/app_colors.dart';
import '../widgets/reviews/reviews_card.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const ReviewsCard();
                },
              ),
            ),
          ),
          totalAndCreateReviewsSection
        ],
      ),
    );
  }

  Container get totalAndCreateReviewsSection {
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
            'Reviews (1000)',
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
                Get.to(() => const CreateReviewScreen());
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
