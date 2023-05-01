import 'package:ecommerce_cloth/presentation/pages/profile_pages/my_reviews_page/widgets/reviews_user_list.dart';
import 'package:ecommerce_cloth/presentation/pages/profile_pages/my_reviews_page/widgets/user_count_review.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/transforming_app_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyReviewsPage extends ConsumerWidget {
  const MyReviewsPage({Key? key}) : super(key: key);
  static const routeName = 'my-reviews-page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: TransformingAppBar(
                expandedHeight: height * .16,
                title: 'My Reviews',
                ifPop: true,
              ),
            ),
            const UserCountReviews(),
            const ReviewsUserList(),
          ],
        ),
      ),
    );
  }
}
