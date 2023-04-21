
import 'package:ecommerce_cloth/presentation/pages/profile_pages/my_reviews_page/my_reviews_page.dart';
import 'package:ecommerce_cloth/routes/app_router.dart';
import 'package:flutter/material.dart';

class MyReviewsNestPage extends StatelessWidget {
  const MyReviewsNestPage({Key? key}) : super(key: key);
  static const routeName = 'my-reviews-nest-page';
  static final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return !await _navigatorKey.currentState!.maybePop();
      },
      child: Scaffold(
        body: Navigator(
          key: _navigatorKey,
          initialRoute: MyReviewsPage.routeName,
          onGenerateRoute: AppRouter.generateMyReviewsNestedRoutes,
          // AppRouter.generateProfilePageNestedRoutes,
        ),
      ),
    );
  }
}
