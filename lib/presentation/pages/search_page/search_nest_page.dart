import 'package:ecommerce_cloth/presentation/pages/search_page/main_search_page/main_search_page.dart';
import 'package:ecommerce_cloth/routes/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchNestPage extends StatelessWidget {
  const SearchNestPage({Key? key}) : super(key: key);
  static const routeName = 'search-nest-page';
  static final GlobalKey<NavigatorState> _navigatorKey =
  GlobalKey<NavigatorState>();


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return !await _navigatorKey.currentState!.maybePop();
      },
      child: Navigator(
          key: _navigatorKey,
          initialRoute: MainSearchPage.routeName,
          onGenerateRoute: AppRouter.generateSearchPageNestedRoutes,
        ),

    );
  }
}
