
import 'package:ecommerce_cloth/core/resources/app_images.dart';
import 'package:ecommerce_cloth/presentation/pages/auth_pages/registration_page/registration_page.dart';
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
        () => Navigator.of(context).pushNamedAndRemoveUntil(
            RegistrationPage.routeName, (route) => false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
