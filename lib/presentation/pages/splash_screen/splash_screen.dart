import 'dart:developer';

import 'package:ecommerce_cloth/presentation/pages/auth_pages/registration_page/registration_page.dart';
import 'package:ecommerce_cloth/presentation/pages/main_page.dart';

import 'package:ecommerce_cloth/presentation/pages/splash_screen/widgets/splash_banner_widget.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/authentication_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  static const routeName = '/';

  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLoggedIn = ref.watch(userLoggedInProvider);
    print(userLoggedIn.value);
    return userLoggedIn.maybeWhen(
      data: (value) {
        Future.microtask(() async {
          if (value) {
            log('✅ This user is authorized');
            Navigator.of(context)
                .pushNamedAndRemoveUntil(MainPage.routeName, (route) => false);
          } else {
            log('🚫 This user is not register');
            Navigator.of(context).pushNamedAndRemoveUntil(
                RegistrationPage.routeName, (route) => false);
          }
        });
        return const SplashBannerWidget();
      },
      orElse: () {
        return const SplashBannerWidget();
      },
    );
  }
}
