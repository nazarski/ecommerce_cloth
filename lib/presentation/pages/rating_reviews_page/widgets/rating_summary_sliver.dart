import 'package:ecommerce_cloth/domain/entities/rating_entity/rating_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/rating_reviews_page/widgets/review_count_indicator.dart';
import 'package:ecommerce_cloth/presentation/pages/rating_reviews_page/widgets/stars_row.dart';
import 'package:flutter/material.dart';


class RatingSummarySliver extends StatelessWidget {
  const RatingSummarySliver({Key? key, required this.rating, required this.width}) : super(key: key);
  final RatingEntity rating;
  final double width;
  int _initializeReviewCount(int stars) {
    return {
      "5_star": rating.fiveStar,
      "4_star": rating.fourStar,
      "3_star": rating.threeStar,
      "2_star": rating.twoStar,
      "1_star": rating.oneStar,
    }['${stars}_star'] ??
        0;
  }
  double _countWidth(int count) {
    if (count == 0) {
      return 8;
    }
    return width * 0.4 * count / rating.totalReviews;
  }
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${rating.averageRating.roundToDouble()}',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 44),
                ),
                Text(
                  '${rating.totalReviews} ratings',
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(
                    5,
                        (index) {
                      return StarsRow(numberOfStars: 5 - index);
                    },
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(5, (index) {
                    return ReviewsCountIndicator(
                        width: _countWidth(
                            _initializeReviewCount(5 - index),),);
                  }),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(5, (index) {
                return Text(
                  _initializeReviewCount(5 - index).toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}