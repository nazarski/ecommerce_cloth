import 'package:ecommerce_cloth/presentation/pages/auth_pages/login_page/login_page.dart';
import 'package:ecommerce_cloth/presentation/pages/auth_pages/recovery_page/recovery_page.dart';
import 'package:ecommerce_cloth/presentation/pages/auth_pages/registration_page/registration_page.dart';
import 'package:ecommerce_cloth/presentation/pages/bag_page/bag_page.dart';
import 'package:ecommerce_cloth/presentation/pages/favourites_page/favourites_page.dart';
import 'package:ecommerce_cloth/presentation/pages/home_page/home_page.dart';
import 'package:ecommerce_cloth/presentation/pages/main_page.dart';
import 'package:ecommerce_cloth/presentation/pages/profile_page/profile_page.dart';
import 'package:ecommerce_cloth/presentation/pages/shop_pages/categories_page/categories_page.dart';
import 'package:ecommerce_cloth/presentation/pages/shop_pages/product_groups_page/product_groups_page.dart';
import 'package:ecommerce_cloth/presentation/pages/shop_pages/product_list_page/product_list_page.dart';
import 'package:ecommerce_cloth/presentation/pages/shop_pages/shop_page.dart';
import 'package:ecommerce_cloth/presentation/pages/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {
  const AppRouter._();

  // main routes
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    print(settings.name);
    WidgetBuilder builder;
    switch (settings.name) {
      case SplashScreen.routeName:
        return PageTransition(
            child: const SplashScreen(), type: PageTransitionType.fade);
      case RecoveryPage.routeName:
        return PageTransition(
            child: const RecoveryPage(), type: PageTransitionType.fade);
      case LoginPage.routeName:
        return PageTransition(
            child: const LoginPage(), type: PageTransitionType.fade);
      case RegistrationPage.routeName:
        return PageTransition(
            child: const RegistrationPage(), type: PageTransitionType.fade);
      case MainPage.routeName:
        return PageTransition(
            child: const MainPage(), type: PageTransitionType.fade);
      default:
        throw Exception('Invalid route: ${settings.name}');
    }
  }

  // Main page nested routes
  static Route<dynamic> generateHomePageNestedRoutes(RouteSettings settings) {
    final arguments = settings.arguments;
    print(settings.name);
    WidgetBuilder builder;
    switch (settings.name) {
      case HomePage.routeName:
        return PageTransition(
            child: const HomePage(), type: PageTransitionType.fade);
      case ShopPage.routeName:
        return PageTransition(
            child: const ShopPage(), type: PageTransitionType.fade);
      case BagPage.routeName:
        return PageTransition(
            child: const BagPage(), type: PageTransitionType.fade);
      case FavouritesPage.routeName:
        return PageTransition(
            child: const FavouritesPage(), type: PageTransitionType.fade);
      case ProfilePage.routeName:
        return PageTransition(
            child: const ProfilePage(), type: PageTransitionType.fade);
      default:
        throw Exception('Invalid route: ${settings.name}');
    }
  }

  // Shop page nested routes
  static Route<dynamic> generateShopPageNestedRoutes(RouteSettings settings) {
    final arguments = settings.arguments;
    print(settings.name);
    WidgetBuilder builder;
    switch (settings.name) {
      case CategoriesPage.routeName:
        return PageTransition(
            child: const CategoriesPage(), type: PageTransitionType.fade);
      case ProductGroupPage.routeName:
        return PageTransition(
            child: const ProductGroupPage(), type: PageTransitionType.fade);
      case ProductListPage.routeName:
        return PageTransition(
            child: const ProductListPage(), type: PageTransitionType.fade);
      default:
        throw Exception('Invalid route: ${settings.name}');
    }
  }
}
