import 'package:ecommerce_cloth/presentation/pages/shop_pages/categories_page/categories_page.dart';
import 'package:ecommerce_cloth/routes/app_router.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);
  static const routeName = 'empty-shop-page';
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
        initialRoute: CategoriesPage.routeName,
        onGenerateRoute: AppRouter.generateShopPageNestedRoutes,
      ),
    );
  }
}
