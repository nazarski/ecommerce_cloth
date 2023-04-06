import 'package:ecommerce_cloth/presentation/pages/widgets/shimmer_widget.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_reviews_state/product_reviews_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'review_item.dart';

class ReviewsList extends ConsumerWidget {
  const ReviewsList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviews = ref.watch(productReviewsProvider);
    return SliverPadding(
      padding: const EdgeInsets.only(right: 32, left: 16),
      sliver: reviews.when(
        data: (data) => SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: data.length,
                (context, i) {
              return ReviewItem(
                review: data[i],
              );
            },
          ),
        ),
        error: (error, stackTrace) {
          return SliverToBoxAdapter(
            child: Text(error.toString()),
          );
        },
        loading: () {
          return SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (context, i) {
                return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: const ShimmerWidget());
              },
              childCount: 10,
            ),
            itemExtent: 300,
          );
        },
      ),
    );
  }
}
