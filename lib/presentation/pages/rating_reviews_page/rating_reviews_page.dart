import 'package:ecommerce_cloth/domain/entities/rating_entity/rating_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/transforming_app_bar.dart';
import 'package:flutter/material.dart';

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
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: TransformingAppBar(
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

