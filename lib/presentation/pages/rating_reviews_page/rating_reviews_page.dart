import 'package:ecommerce_cloth/domain/entities/rating_entity/rating_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/build_show_modal_bottom_sheet.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/transforming_app_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/rating_summary_sliver.dart';
import 'widgets/review_pictures_list_view.dart';
import 'widgets/review_summary.dart';
import 'widgets/reviews_list.dart';
import 'widgets/star_review_selection.dart';

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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const StarReviewSelection(),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Please share your opinion about the product',
                      style: Theme.of(context).textTheme.displaySmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20)
                      ]),
                      child: const TextField(
                        maxLines: 6,
                      ),
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    const ReviewPicturesListView()
                  ],
                ),
              ),
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




