import 'package:ecommerce_cloth/presentation/riverpod/manage_reviews_state/create_review_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StarReviewSelection extends ConsumerWidget {
  const StarReviewSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stars = ref.watch(createReviewProvider).rating;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            ref.read(createReviewProvider.notifier).setRating(index + 1);
          },
          child: stars >= index + 1
              ? const Icon(
            Icons.star_rounded,
            color: Color(0xffFFBA49),
            size: 48,
          )
              : Icon(
            Icons.star_border_rounded,
            color: Theme.of(context).colorScheme.surface,
            size: 48,
          ),
        );
      }),
    );
  }
}