import 'package:flutter/material.dart';

import 'review_pictures_list_view.dart';
import 'star_review_selection.dart';

class AddReviewSheet extends StatelessWidget {
  const AddReviewSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const StarReviewSelection(),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Please share your opinion about the product',
            style: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          DecoratedBox(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20)
            ]),
            child: const TextField(
              maxLines: 6,
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          const ReviewPicturesListView()
        ],
      ),
    );
  }
}