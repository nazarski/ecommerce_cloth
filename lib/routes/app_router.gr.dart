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
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:ecommerce_cloth/presentation/pages/auth_pages/login_page/login_page.dart'
    as _i3;
import 'package:ecommerce_cloth/presentation/pages/auth_pages/recovery_page/recovery_page.dart'
    as _i4;
import 'package:ecommerce_cloth/presentation/pages/auth_pages/registration_page/registration_page.dart'
    as _i2;
import 'package:ecommerce_cloth/presentation/pages/bag_page/bag_page.dart'
    as _i8;
import 'package:ecommerce_cloth/presentation/pages/favourites_page/favourites_page.dart'
    as _i9;
import 'package:ecommerce_cloth/presentation/pages/home_page/home_page.dart'
    as _i6;
import 'package:ecommerce_cloth/presentation/pages/main_page.dart' as _i5;
import 'package:ecommerce_cloth/presentation/pages/profile_page/profile_page.dart'
    as _i10;
import 'package:ecommerce_cloth/presentation/pages/shop_pages/categories_page.dart'
    as _i7;
import 'package:ecommerce_cloth/presentation/pages/splash_screen/splash_screen.dart'
    as _i1;
import 'package:flutter/material.dart' as _i12;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    RegistrationRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child:  _i2.RegistrationPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child:  _i3.LoginPage(),
      );
    },
    RecoveryRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child:  _i4.RecoveryPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.MainPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomePage(),
      );
    },
    ShopRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.CategoriesPage(),
      );
    },
    BagRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.BagPage(),
      );
    },
    FavouritesRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.FavouritesPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.ProfilePage(),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          SplashScreen.name,
          path: '/',
        ),
        _i11.RouteConfig(
          RegistrationRoute.name,
          path: '/registration-page',
        ),
        _i11.RouteConfig(
          LoginRoute.name,
          path: '/login-page',
        ),
        _i11.RouteConfig(
          RecoveryRoute.name,
          path: '/recovery-page',
        ),
        _i11.RouteConfig(
          MainRoute.name,
          path: '/main-page',
          children: [
            _i11.RouteConfig(
              HomeRoute.name,
              path: 'home-page',
              parent: MainRoute.name,
            ),
            _i11.RouteConfig(
              ShopRoute.name,
              path: 'shop-page',
              parent: MainRoute.name,
            ),
            _i11.RouteConfig(
              BagRoute.name,
              path: 'bag-page',
              parent: MainRoute.name,
            ),
            _i11.RouteConfig(
              FavouritesRoute.name,
              path: 'favourites-page',
              parent: MainRoute.name,
            ),
            _i11.RouteConfig(
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
class SplashScreen extends _i11.PageRouteInfo<void> {
  const SplashScreen()
      : super(
          SplashScreen.name,
          path: '/',
        );

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.RegistrationPage]
class RegistrationRoute extends _i11.PageRouteInfo<void> {
  const RegistrationRoute()
      : super(
          RegistrationRoute.name,
          path: '/registration-page',
        );

  static const String name = 'RegistrationRoute';
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login-page',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.RecoveryPage]
class RecoveryRoute extends _i11.PageRouteInfo<void> {
  const RecoveryRoute()
      : super(
          RecoveryRoute.name,
          path: '/recovery-page',
        );

  static const String name = 'RecoveryRoute';
}

/// generated route for
/// [_i5.MainPage]
class MainRoute extends _i11.PageRouteInfo<void> {
  const MainRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/main-page',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i7.CategoriesPage]
class ShopRoute extends _i11.PageRouteInfo<void> {
  const ShopRoute()
      : super(
          ShopRoute.name,
          path: 'shop-page',
        );

  static const String name = 'ShopRoute';
}

/// generated route for
/// [_i8.BagPage]
class BagRoute extends _i11.PageRouteInfo<void> {
  const BagRoute()
      : super(
          BagRoute.name,
          path: 'bag-page',
        );

  static const String name = 'BagRoute';
}

/// generated route for
/// [_i9.FavouritesPage]
class FavouritesRoute extends _i11.PageRouteInfo<void> {
  const FavouritesRoute()
      : super(
          FavouritesRoute.name,
          path: 'favourites-page',
        );

  static const String name = 'FavouritesRoute';
}

/// generated route for
/// [_i10.ProfilePage]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile-page',
        );

  static const String name = 'ProfileRoute';
}
