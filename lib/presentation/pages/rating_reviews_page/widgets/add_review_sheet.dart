import 'package:ecommerce_cloth/domain/entities/rating_entity/rating_entity.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_reviews_state/create_review_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/snack_bars.dart';
import 'review_pictures_list_view.dart';
import 'star_review_selection.dart';

class AddReviewSheet extends StatefulWidget {
  const AddReviewSheet({
    super.key,
    required this.ratingEntity,
  });
  final RatingEntity ratingEntity;
  @override
  State<AddReviewSheet> createState() => _AddReviewSheetState();
}

class _AddReviewSheetState extends State<AddReviewSheet> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: StarReviewSelection(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Please share your opinion about the product',
              style: Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)
            ]),
            child: TextField(
              controller: _controller,
              maxLines: 8,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const ReviewPicturesListView(),
          const SizedBox(
            height: 24,
          ),
          Consumer(builder: (context, ref, _) {
            final active = ref.watch(createReviewProvider).rating != 0;
            return ElevatedButton(
              onPressed: active
                  ? () {
                      ref
                          .read(createReviewProvider.notifier)
                          .createReview(_controller.text, widget.ratingEntity);
                      Navigator.pop(context);
                      topSnackBar(context: context, label: 'Your review has been sent for moderation');
                    }
                  : null,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'send review'.toUpperCase(),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
