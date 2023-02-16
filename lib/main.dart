import 'package:ecommerce_cloth/firebase_options.dart';
import 'package:ecommerce_cloth/presentation/pages/splash_screen/splash_screen.dart';
import 'package:ecommerce_cloth/resources/app_themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      themeMode: ThemeMode.system,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: SplashScreen(),
    ),
  );
}
