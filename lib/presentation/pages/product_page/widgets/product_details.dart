import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/domain/entities/rating_entity/rating_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/rating_reviews_page/rating_reviews_page.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/heart_favourite.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/star_view_widget.dart';
import 'package:ecommerce_cloth/presentation/riverpod/product_reviews_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'product_dropdown.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.selectedProduct,
  });

  final ProductEntity selectedProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 12,
        bottom: 28,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ProductDropdown(
                listOfValues: selectedProduct.availableQuantity.keys
                    .toList(),
                valueType: 'Size',
              ),
              const SizedBox(
                width: 16,
              ),
              ProductDropdown(
                listOfValues: selectedProduct.colors,
                valueType: 'Color',
              ),
              const SizedBox(
                width: 16,
              ),
              const HeartFavourite(active: false),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedProduct.brand,
                style: Theme
                    .of(context)
                    .textTheme
                    .displayMedium,
              ),
              Text(
                '\$${selectedProduct.price}',
                style: Theme
                    .of(context)
                    .textTheme
                    .displayMedium,
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            '${selectedProduct.name} ${selectedProduct.colors.first[0]
                .toUpperCase() +
                selectedProduct.colors.first.substring(1)} ${selectedProduct
                .productType} ',
            style: Theme
                .of(context)
                .textTheme
                .labelMedium,
          ),
          const SizedBox(
            height: 4,
          ),
          GoToReviewsButton(
            rating: selectedProduct.rating, productId: selectedProduct.id,),
          const SizedBox(
            height: 16,
          ),
          Text(
            selectedProduct.description,
            style: Theme
                .of(context)
                .textTheme
                .bodySmall
                ?.copyWith(height: 1.5),
          )
        ],
      ),
    );
  }
}

class GoToReviewsButton extends ConsumerWidget {
  const GoToReviewsButton({
    super.key,
    required this.rating,
    required this.productId,
  });

  final RatingEntity rating;
  final String productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.watch(productReviewsProvider.notifier).getReviewsFromProductId(
            productId);
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