import 'package:ecommerce_cloth/presentation/pages/profile_pages/profile_card_page/profile_card_page.dart';
import 'package:ecommerce_cloth/routes/app_router.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const routeName = 'profile-page';
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return !await _navigatorKey.currentState!.maybePop();
      },
      child: Scaffold(
        body: Navigator(
          key: _navigatorKey,
          initialRoute: ProfileCardPage.routeName,
          onGenerateRoute: AppRouter.generateProfilePageNestedRoutes,
        ),
      ),
    );
  }
}
