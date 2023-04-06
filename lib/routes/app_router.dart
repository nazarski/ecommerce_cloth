import 'dart:developer';

import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/domain/entities/rating_entity/rating_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/address_pages/address_nest_page.dart';
import 'package:ecommerce_cloth/presentation/pages/address_pages/addresses_page/addresses_page.dart';
import 'package:ecommerce_cloth/presentation/pages/address_pages/create_address_page/create_address_page.dart';
import 'package:ecommerce_cloth/presentation/pages/auth_pages/login_page/login_page.dart';
import 'package:ecommerce_cloth/presentation/pages/auth_pages/registration_page/registration_page.dart';
import 'package:ecommerce_cloth/presentation/pages/bag_page/bag_page.dart';
import 'package:ecommerce_cloth/presentation/pages/favourites_page/favourites_page.dart';
import 'package:ecommerce_cloth/presentation/pages/filter_pages/brands_page/brands_list_page.dart';
import 'package:ecommerce_cloth/presentation/pages/filter_pages/filter_nest_page.dart';
import 'package:ecommerce_cloth/presentation/pages/filter_pages/filter_page/filter_page.dart';
import 'package:ecommerce_cloth/presentation/pages/home_page/home_page.dart';
import 'package:ecommerce_cloth/presentation/pages/main_page.dart';
import 'package:ecommerce_cloth/presentation/pages/product_page/product_page.dart';
import 'package:ecommerce_cloth/presentation/pages/profile_pages/order_page/order_page.dart';
import 'package:ecommerce_cloth/presentation/pages/profile_pages/profile_card_page/profile_card_page.dart';
import 'package:ecommerce_cloth/presentation/pages/rating_reviews_page/gallery_page/gallery_page.dart';
import 'package:ecommerce_cloth/presentation/pages/rating_reviews_page/rating_reviews_page.dart';
import 'package:ecommerce_cloth/presentation/pages/profile_pages/profile_nest_page.dart';
import 'package:ecommerce_cloth/presentation/pages/profile_pages/setting_page/setting_nest_page.dart';
import 'package:ecommerce_cloth/presentation/pages/shop_pages/categories_page/categories_page.dart';
import 'package:ecommerce_cloth/presentation/pages/shop_pages/product_groups_page/product_groups_page.dart';
import 'package:ecommerce_cloth/presentation/pages/shop_pages/product_list_page/product_list_page.dart';
import 'package:ecommerce_cloth/presentation/pages/shop_pages/shop_page.dart';
import 'package:ecommerce_cloth/presentation/pages/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../presentation/pages/profile_pages/setting_page/setting_page.dart';

class AppRouter {
  const AppRouter._();

  // main routes
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    log('⤴️ ${settings.name.toString()}');
    switch (settings.name) {
      case SplashScreen.routeName:
        return PageTransition(
          child: const SplashScreen(),
          type: PageTransitionType.fade,
        );
      case LoginPage.routeName:
        return PageTransition(
          child: const LoginPage(),
          type: PageTransitionType.fade,
        );
      case RegistrationPage.routeName:
        return PageTransition(
          child: const RegistrationPage(),
          type: PageTransitionType.fade,
        );
      case MainPage.routeName:
        return PageTransition(
          child: const MainPage(),
          type: PageTransitionType.fade,
        );
      case FilterNestPage.routeName:
        return PageTransition(
          child: const FilterNestPage(),
          type: PageTransitionType.rightToLeft,
        );
      case AddressNestPage.routeName:
        return PageTransition(
          child: const AddressNestPage(),
          type: PageTransitionType.rightToLeft,
        );
      case SettingNestPage.routeName:
        return PageTransition(
          child: const SettingNestPage(),
          type: PageTransitionType.rightToLeft,
        );
      case ProductPage.routeName:
        return PageTransition(
          settings: settings,
          child:
              ProductPage(selectedProduct: settings.arguments as ProductEntity),
          type: PageTransitionType.rightToLeft,
        );
      case RatingReviewPage.routeName:
        return PageTransition(
          settings: settings,
          child: RatingReviewPage(rating: settings.arguments as RatingEntity),
          type: PageTransitionType.rightToLeft,
        );
      default:
        throw Exception('Invalid route: ${settings.name}');
    }
  }

  // Main page nested routes
  static Route<dynamic> generateHomePageNestedRoutes(RouteSettings settings) {
    final arguments = settings.arguments;
    log('⤴️ ${settings.name.toString()}');
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
    log('⤴️ ${settings.name.toString()}');
    switch (settings.name) {
      case CategoriesPage.routeName:
        return PageTransition(
            child: const CategoriesPage(), type: PageTransitionType.fade);
      case ProductGroupPage.routeName:
        return PageTransition(
          type: PageTransitionType.fade,
          // settings: settings,
          child: const ProductGroupPage(),
        );
      case ProductListPage.routeName:
        return PageTransition(
          settings: settings,
          child: ProductListPage(
            title: arguments as String,
          ),
          type: PageTransitionType.fade,
        );
      default:
        throw Exception('Invalid route: ${settings.name}');
    }
  }

  // Filter page nested routes
  static Route<dynamic> generateFilterPageNestedRoutes(RouteSettings settings) {
    final arguments = settings.arguments;
    log(settings.name.toString());
    switch (settings.name) {
      case FiltersPage.routeName:
        return PageTransition(
          child: const FiltersPage(),
          type: PageTransitionType.rightToLeft,
        );
      case BrandsListPage.routeName:
        return PageTransition(
          settings: settings,
          type: PageTransitionType.rightToLeft,
          child: const BrandsListPage(),
        );
      default:
        throw Exception('Invalid route: ${settings.name}');
    }
  }
  static Route<dynamic> generateProfilePageNestedRoutes(RouteSettings settings) {
    final arguments = settings.arguments;
    log('⤴️ ${settings.name.toString()}');
    WidgetBuilder builder;
    switch (settings.name) {
      case ProfileCardPage.routeName:
        return PageTransition(
          type: PageTransitionType.fade,
          // settings: settings,
          child: const ProfileCardPage(),
        );
      case OrderPage.routeName:
        return PageTransition(
          type: PageTransitionType.fade,
          // settings: settings,
          child: const OrderPage(),
        );
      default:
        throw Exception('Invalid route: ${settings.name}');
    }
  }
  // Filter page nested routes
  static Route<dynamic> generateAddressesPageNestedRoutes(RouteSettings settings) {
    final arguments = settings.arguments;
    log('⤴️ ${settings.name.toString()}');
    WidgetBuilder builder;
    switch (settings.name) {
      case AddressesPage.routeName:
        return PageTransition(
          child: const AddressesPage(),
          type: PageTransitionType.rightToLeft,
        );
      case CreateAddressPage.routeName:
        return PageTransition(
          settings: settings,
          child:  const CreateAddressPage(),
          type: PageTransitionType.rightToLeft,
        );
      default:
        throw Exception('Invalid route: ${settings.name}');
    }
  }
  static Route<dynamic> generateSettingPageNestedRoutes(RouteSettings settings) {
    final arguments = settings.arguments;
    log(settings.name.toString());
    WidgetBuilder builder;
    switch (settings.name) {
      case SettingPage.routeName:
        return PageTransition(
          child:  const SettingPage(),
          type: PageTransitionType.rightToLeft,
        );

      default:
        throw Exception('Invalid route: ${settings.name}');
    }
  }
}
