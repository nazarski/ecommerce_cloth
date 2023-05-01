import 'package:ecommerce_cloth/presentation/riverpod/manage_reviews_state/product_reviews_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewSummary extends ConsumerWidget {
  const ReviewSummary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviews = ref.watch(productReviewsProvider);
    final checkboxValue =
        ref.read(productReviewsProvider.notifier).withPhotoOnly;
    return SliverPadding(
      padding: const EdgeInsets.only(right: 32, left: 16),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: reviews.when(
            data: (data) => [
              Text(
                '${data.length} reviews',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Row(
                children: [
                  Checkbox(
                      value: checkboxValue,
                      onChanged: (value) {
                        ref
                            .read(productReviewsProvider.notifier)
                            .getReviewsWithPhotos(value!);
                      }),
                  Text(
                    'With photo',
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ],
            error: (error, stackTrace) => [
              Text(
                error.toString(),
                style: Theme.of(context).textTheme.displayMedium,
              )
            ],
            loading: () => [
              Text(
                'reviews',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Row(
                children: [
                  const Checkbox(value: false, onChanged: null),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    'With photo',
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
