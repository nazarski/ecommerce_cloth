import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_cloth/presentation/pages/auth_pages/login_page/login_page.dart';
import 'package:ecommerce_cloth/presentation/pages/auth_pages/recovery_page/recovery_page.dart';
import 'package:ecommerce_cloth/presentation/pages/auth_pages/registration_page/registration_page.dart';
import 'package:ecommerce_cloth/presentation/pages/bag_page/bag_page.dart';
import 'package:ecommerce_cloth/presentation/pages/favourites_page/favourites_page.dart';
import 'package:ecommerce_cloth/presentation/pages/home_page/home_page.dart';
import 'package:ecommerce_cloth/presentation/pages/main_page.dart';
import 'package:ecommerce_cloth/presentation/pages/profile_page/profile_page.dart';
import 'package:ecommerce_cloth/presentation/pages/shop_page/shop_page.dart';
import 'package:ecommerce_cloth/presentation/pages/splash_screen/splash_screen.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashScreen,
      initial: true,
    ),

    AutoRoute(
      page: RegistrationPage,
    ),
    AutoRoute(
      page: LoginPage,
    ),
    AutoRoute(
      page: RecoveryPage,
    ),
    AutoRoute(
      page: MainPage,
      children: [
        AutoRoute(
          page: HomePage,
        ),
        AutoRoute(
          page: ShopPage,
        ),
        AutoRoute(
          page: BagPage,
        ),
        AutoRoute(
          page: FavouritesPage,
        ),
        AutoRoute(
          page: ProfilePage,
        ),
      ],
    ),
  ],
)
class $AppRouter {}
