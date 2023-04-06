import 'package:ecommerce_cloth/core/resources/app_icons.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_reviews_state/create_review_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StarReviewSelection extends ConsumerWidget {
  const StarReviewSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stars = ref.watch(createReviewProvider).rating;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            ref.read(createReviewProvider.notifier).setRating(index + 1);
          },
          child: stars >= index + 1
              ? SvgPicture.asset(
                  AppIcons.yellowStar,
                )
              : SvgPicture.asset(
                  AppIcons.hollowStar,
                ),
        );
      }),
    );
  }
}
