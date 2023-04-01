import 'package:ecommerce_cloth/presentation/riverpod/manage_reviews_state/create_review_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'add_picture_button.dart';

class ReviewPicturesListView extends ConsumerWidget {
  const ReviewPicturesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pictureList = ref.watch(createReviewProvider).reviewPictures;
    return SizedBox(
      height: 104,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          if (i == pictureList.length && pictureList.length <= 5) {
            return const AddPictureButton();
          }
          return Container(
            height: 104,
            width: 104,
            color: Colors.red,
          );
        },
        separatorBuilder: (_, __) => const SizedBox(
          width: 16,
        ),
        itemCount: pictureList.length <= 5
            ? pictureList.length + 1
            : pictureList.length,
      ),
    );
  }
}
