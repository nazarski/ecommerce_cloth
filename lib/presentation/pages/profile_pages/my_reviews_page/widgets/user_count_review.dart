import 'package:ecommerce_cloth/presentation/riverpod/manage_reviews_state/product_reviews_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserCountReviews extends ConsumerWidget {
  const UserCountReviews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviews = ref.watch(userReviewsProvider);
    return SliverPadding(
      padding: const EdgeInsets.only(right: 32, left: 16),
      sliver: SliverToBoxAdapter(
        child: Container(
          child: reviews.when(
            data: (data) =>
              Text(
                '${data.length} reviews',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            error: (error, stackTrace) =>
              Text(
                error.toString(),
                style: Theme.of(context).textTheme.displayMedium,
              )
            ,
            loading: () =>
              Text(
                'reviews',
                style: Theme.of(context).textTheme.displayMedium,
              ),

          ),
        ),
      ),
    );
  }
}
