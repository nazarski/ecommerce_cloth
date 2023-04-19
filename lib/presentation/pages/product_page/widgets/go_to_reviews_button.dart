import 'package:ecommerce_cloth/domain/entities/rating_entity/rating_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/rating_reviews_page/rating_reviews_page.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/star_view_widget.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_reviews_state/product_reviews_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoToReviewsButton extends ConsumerWidget {
  const GoToReviewsButton({
    super.key,
    required this.systemId,
    required this.rating,
    required this.productId,
  });

  final RatingEntity rating;
  final String productId;
  final int systemId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.watch(productReviewsProvider.notifier).getReviewsFromProductId(
              productId,
              systemId,
            );
        Navigator.of(context, rootNavigator: true).pushNamed(
          RatingReviewPage.routeName,
          arguments: rating,
        );
      },
      child: StarsViewWidget(
        rating: rating.averageRating,
        reviews: rating.totalReviews,
      ),
    );
  }
}
