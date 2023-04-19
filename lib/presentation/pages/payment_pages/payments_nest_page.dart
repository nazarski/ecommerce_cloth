import 'package:ecommerce_cloth/presentation/pages/payment_pages/payments_methods_page/payments_method_page.dart';
import 'package:ecommerce_cloth/routes/app_router.dart';
import 'package:flutter/material.dart';

class PaymentsNestPage extends StatelessWidget {
  const PaymentsNestPage({Key? key}) : super(key: key);
  static const routeName = 'payments-nest-page';
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
          initialRoute: PaymentsMethodsPage.routeName,
          onGenerateRoute: AppRouter.generatePaymentsPageNestedRoutes,
        ),
      ),
    );
  }
}
