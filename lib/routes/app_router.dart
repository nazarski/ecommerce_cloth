import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_cloth/presentation/pages/home_page/home_page.dart';
import 'package:ecommerce_cloth/presentation/pages/splash_screen/splash_screen.dart';


@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
        page: SplashScreen, initial: true),
    AutoRoute(
        page: HomePage),
  ],
)
class $AppRouter {}