import 'package:ecommerce_cloth/presentation/pages/profile_pages/setting_page/setting_page.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/navigation/app_bar_back_search.dart';
import 'package:ecommerce_cloth/routes/app_router.dart';
import 'package:flutter/material.dart';

class SettingNestPage extends StatelessWidget {
  const SettingNestPage({Key? key}) : super(key: key);
  static const routeName = 'setting-nest-page';
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return !await _navigatorKey.currentState!.maybePop();
      },
      child: Scaffold(
        appBar: const AppBarSearchBack(
          title: '',
          search: true,
          elevation: false,
          back: true,
          canPop: true,
        ),
        body: Navigator(
          key: _navigatorKey,
          initialRoute: SettingPage.routeName,
          onGenerateRoute: AppRouter.generateSettingPageNestedRoutes,
        ),
      ),
    );
  }
}
