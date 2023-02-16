import 'package:ecommerce_cloth/resources/app_themes.dart';
import 'package:ecommerce_cloth/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      themeMode: ThemeMode.system,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: MainPage(),
    ),
  );
}
