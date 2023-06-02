import 'package:ecommerce_cloth/presentation/pages/address_pages/addresses_page/addresses_page.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/navigation/app_bar_back_search.dart';
import 'package:ecommerce_cloth/routes/app_router.dart';
import 'package:flutter/material.dart';

class AddressNestPage extends StatelessWidget {
  const AddressNestPage({Key? key}) : super(key: key);
  static const routeName = 'address-nest-page';
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
          title: 'Shipping Addresses',
          search: false,
          elevation: true,
          back: true,
          canPop: true,
        ),
        body: Navigator(
          key: _navigatorKey,
          initialRoute: AddressesPage.routeName,
          onGenerateRoute: AppRouter.generateAddressesPageNestedRoutes,
        ),
      ),
    );
  }
}
