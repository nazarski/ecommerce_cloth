// import 'package:ecommerce_cloth/presentation/pages/home_page/home_page.dart';
// import 'package:ecommerce_cloth/presentation/pages/main_page.dart';
// import 'package:ecommerce_cloth/presentation/pages/splash_screen/splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';
//
// class AppRoutes {
//   const AppRoutes._();
//
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     final arguments = settings.arguments;
//     print(arguments);
//     WidgetBuilder builder;
//     switch (settings.name) {
//       case SplashScreen.routeName:
//         return PageTransition(
//             child: const SplashScreen(), type: PageTransitionType.fade);
//       case MainPage.routeName:
//         return PageTransition(
//             child: const MainPage(), type: PageTransitionType.fade);
//       case HomePage.routeName:
//         return PageTransition(
//             child: const HomePage(), type: PageTransitionType.fade);
//
//       default:
//         throw Exception('Invalid route: ${settings.name}');
//     }
//   }
// }
