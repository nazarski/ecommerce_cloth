import 'package:ecommerce_cloth/domain/entities/rating_entity/rating_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/build_show_modal_bottom_sheet.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/transforming_app_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/add_review_sheet.dart';
import 'widgets/rating_summary_sliver.dart';
import 'widgets/review_summary.dart';
import 'widgets/reviews_list.dart';

class RatingReviewPage extends StatelessWidget {
  const RatingReviewPage({Key? key, required this.rating}) : super(key: key);
  static const routeName = 'rating-review-page';
  final RatingEntity rating;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      bottom: false,
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            buildShowModalBottomSheet(
              context: context,
              header: 'What is your rate?',
              child: AddReviewSheet(ratingEntity: rating,),
            );
          },
          label: const Text('Write a review'),
          icon: const Icon(Icons.edit),
        ),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: TransformingAppBar(
                ifPop: true,
                expandedHeight: height * .16,
                title: 'Rating&Reviews',
              ),
            ),
            RatingSummarySliver(
              rating: rating,
              width: width,
            ),
            const ReviewSummary(),
            const ReviewsList()
          ],
        ),
      ),
    );
  }
}





