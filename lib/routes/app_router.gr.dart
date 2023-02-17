// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:ecommerce_cloth/presentation/pages/bag_page/bag_page.dart'
    as _i5;
import 'package:ecommerce_cloth/presentation/pages/favourites_page/favourites_page.dart'
    as _i6;
import 'package:ecommerce_cloth/presentation/pages/home_page/home_page.dart'
    as _i3;
import 'package:ecommerce_cloth/presentation/pages/main_page.dart' as _i2;
import 'package:ecommerce_cloth/presentation/pages/profile_page/profile_page.dart'
    as _i7;
import 'package:ecommerce_cloth/presentation/pages/shop_page/shop_page.dart'
    as _i4;
import 'package:ecommerce_cloth/presentation/pages/splash_screen/splash_screen.dart'
    as _i1;
import 'package:flutter/material.dart' as _i9;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.MainPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    ShopRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.ShopPage(),
      );
    },
    BagRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.BagPage(),
      );
    },
    FavouritesRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.FavouritesPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.ProfilePage(),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          SplashScreen.name,
          path: '/',
        ),
        _i8.RouteConfig(
          MainRoute.name,
          path: '/main-page',
          children: [
            _i8.RouteConfig(
              HomeRoute.name,
              path: 'home-page',
              parent: MainRoute.name,
            ),
            _i8.RouteConfig(
              ShopRoute.name,
              path: 'shop-page',
              parent: MainRoute.name,
            ),
            _i8.RouteConfig(
              BagRoute.name,
              path: 'bag-page',
              parent: MainRoute.name,
            ),
            _i8.RouteConfig(
              FavouritesRoute.name,
              path: 'favourites-page',
              parent: MainRoute.name,
            ),
            _i8.RouteConfig(
              ProfileRoute.name,
              path: 'profile-page',
              parent: MainRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i8.PageRouteInfo<void> {
  const SplashScreen()
      : super(
          SplashScreen.name,
          path: '/',
        );

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i8.PageRouteInfo<void> {
  const MainRoute({List<_i8.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/main-page',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.ShopPage]
class ShopRoute extends _i8.PageRouteInfo<void> {
  const ShopRoute()
      : super(
          ShopRoute.name,
          path: 'shop-page',
        );

  static const String name = 'ShopRoute';
}

/// generated route for
/// [_i5.BagPage]
class BagRoute extends _i8.PageRouteInfo<void> {
  const BagRoute()
      : super(
          BagRoute.name,
          path: 'bag-page',
        );

  static const String name = 'BagRoute';
}

/// generated route for
/// [_i6.FavouritesPage]
class FavouritesRoute extends _i8.PageRouteInfo<void> {
  const FavouritesRoute()
      : super(
          FavouritesRoute.name,
          path: 'favourites-page',
        );

  static const String name = 'FavouritesRoute';
}

/// generated route for
/// [_i7.ProfilePage]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile-page',
        );

  static const String name = 'ProfileRoute';
}
