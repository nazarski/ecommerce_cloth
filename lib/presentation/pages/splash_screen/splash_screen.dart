import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_cloth/core/resources/app_images.dart';
import 'package:ecommerce_cloth/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 1),
      () => context.router.replace(
        const RegistrationRoute(),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(
    //   const Duration(seconds: 2),
    //       () async {
    //     log('SPLASH SCREEN');
    //     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    //       return const RegistrationPage();
    //     }));
    //   },
    // );
    return Center(
      child: Image.asset(
        AppImages.splashScreen,
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
