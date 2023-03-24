import 'package:ecommerce_cloth/domain/entities/rating_entity/rating_entity.dart';
import 'package:ecommerce_cloth/domain/entities/review_entity/review_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/star_view_widget.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/transforming_app_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/review_count_indicator.dart';
import 'widgets/stars_row.dart';

class RatingReviewPage extends StatelessWidget {
  const RatingReviewPage({Key? key, required this.rating}) : super(key: key);
  static const routeName = 'rating-review-page';
  final RatingEntity rating;

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

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    double _countWidth(int count) {
      if (count == 0) {
        return 8;
      }
      return width * 0.4 * count / rating.totalReviews;
    }

    return SafeArea(
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
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          rating.averageRating.toString(),
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
                                    _initializeReviewCount(5 - index)));
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
            ),
            SliverPadding(
              padding: const EdgeInsets.only(right: 32, left: 16),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                (context, i) {
                  return ReviewItem(
                    review: ReviewEntity(
                        rating: 4,
                        reviewId: 'id-1',
                        helpful: 0,
                        productId: 'product-1',
                        publicationDate: DateTime(2022, 11, 21),
                        userId: 'user-1',
                        review: '''
The hoodie itself is made of a high-quality material that feels soft and comfortable against the skin. I love the design - it's simple yet stylish, and the color is even better in person than in the pictures online. The fit is true to size, and the length is perfect - not too short or too long.
The only reason I'm not giving this hoodie 5 stars is because I did notice some minor pilling after a few wears and washes. However, this is a common issue with most clothing made of this type of material, so it's not a dealbreaker for me.
Overall, I'm really happy with my purchase and would definitely recommend this hoodie to anyone looking for a comfortable and stylish option for their casual wardrobe.
                        ''',
                        reviewPictures: [],
                        userAvatar:
                            'http://bugsmakersteam.pp.ua:1337/uploads/u_Y6_Bz1a_Yu_Mdac986t_I35_4_pokfc_eea41f56d0.jpg?updated_at=2023-03-24T17:51:05.857Z',
                        userName: 'Amanda Walles'),
                  );
                },
                childCount: 10,
              )),
            )
          ],
        ),
      ),
    );
  }
}

class ReviewItem extends StatelessWidget {
  const ReviewItem({Key? key, required this.review}) : super(key: key);
  final ReviewEntity review;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 16),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1), blurRadius: 20)
                ]),
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.userName,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 14,
                      ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StarsViewWidget(rating: review.rating),
                    Text(
                      '${review.publicationDate.year}-${review.publicationDate.month}- ${review.publicationDate.day}',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  review.review,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    crossAxisAlignment:CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Helpful',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      const SizedBox(width: 8,),
                      Icon(Icons.thumb_up_alt_rounded, size: 16,color:  Theme.of(context).colorScheme.surface,)

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image(
            width: 32,
            height: 32,
            alignment: Alignment.topCenter,
            fit: BoxFit.cover,
            image: NetworkImage(review.userAvatar),
          ),
        )
      ],
    );
  }
}
