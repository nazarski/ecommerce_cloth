import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColorsLight.primary,
        // primary red
        onPrimary: AppColorsLight.white,
        // element background white

        secondary: AppColorsLight.black,
        // black text
        onSecondary: AppColorsLight.white,
        // filler

        error: AppColorsLight.error,
        // error red
        onError: AppColorsLight.success,
        // green success

        background: AppColorsLight.background,
        // background
        onBackground: AppColorsLight.white,
        // common white

        surface: AppColorsLight.grey,
        // grey
        onSurface: AppColorsLight.saleHot,
        // sale hot

        surfaceTint: AppColorsDark.white,
        // chip foreground
        onSurfaceVariant: AppColorsDark.background
        // chip background

        ),
    fontFamily: 'Metropolis',
    scaffoldBackgroundColor: AppColorsLight.background,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColorsLight.white,
      elevation: 0,
      showUnselectedLabels: true,
      selectedIconTheme: IconThemeData(color: AppColorsLight.primary),
      unselectedIconTheme: IconThemeData(color: AppColorsLight.grey),
      selectedLabelStyle: TextStyle(
          color: AppColorsLight.primary,
          fontSize: 10,
          fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(color: AppColorsLight.grey, fontSize: 10),
    ),
    textTheme: const TextTheme(
      //Error text
      titleSmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: AppColorsLight.error),
      // Headline
      displayLarge: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w700,
        color: AppColorsLight.black,
      ),

      // Headline 2
      displayMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColorsLight.black,
      ),

      // Headline 3
      displaySmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColorsLight.black,
      ),

      // Subheads
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColorsLight.black,
      ),

      // Text
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColorsLight.black,
      ),

      // Descriptive items
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColorsLight.black,
      ),

      // Description text
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColorsLight.black,
      ),

      // Helper text
      labelMedium: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: AppColorsLight.grey,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: AppColorsLight.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.error)) {
          return AppColorsLight.error;
        }
        return AppColorsLight.success;
      }),
      filled: true,
      fillColor: AppColorsLight.white,
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      labelStyle: const TextStyle(
        color: AppColorsLight.grey,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      floatingLabelStyle: MaterialStateTextStyle.resolveWith((states) {
        if (states.contains(MaterialState.error)) {
          return const TextStyle(
            color: AppColorsLight.error,
            fontSize: 11,
            fontWeight: FontWeight.w400,
          );
        }
        return const TextStyle(
          color: AppColorsLight.grey,
          fontSize: 11,
          fontWeight: FontWeight.w400,
        );
      }),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        // minimumSize: MaterialStatePropertyAll(
        //   Size.fromWidth(
        //     double.infinity,
        //   ),
        // ),
        backgroundColor: MaterialStatePropertyAll(
          AppColorsLight.primary,
        ),
        elevation: MaterialStatePropertyAll(4),
        shadowColor: MaterialStatePropertyAll(AppColorsLight.primary),
        foregroundColor: MaterialStatePropertyAll(AppColorsLight.white),
        textStyle: MaterialStatePropertyAll(
          TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        iconColor: MaterialStatePropertyAll(AppColorsLight.white),
        iconSize: MaterialStatePropertyAll(24),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                50,
              ),
            ),
          ),
        ),
      ),
    ),
    outlinedButtonTheme: const OutlinedButtonThemeData(
      style: ButtonStyle(
        minimumSize: MaterialStatePropertyAll(
          Size.fromWidth(
            double.infinity,
          ),
        ),
        padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
        foregroundColor: MaterialStatePropertyAll(AppColorsLight.black),
        textStyle: MaterialStatePropertyAll(
          TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide(color: AppColorsLight.black),
            borderRadius: BorderRadius.all(
              Radius.circular(
                50,
              ),
            ),
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      textStyle: const MaterialStatePropertyAll(
        TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
      ),
      overlayColor:
          MaterialStatePropertyAll(AppColorsLight.black.withOpacity(0.2)),
      foregroundColor: const MaterialStatePropertyAll(AppColorsLight.black),
    )),
    checkboxTheme: const CheckboxThemeData(
      fillColor: MaterialStatePropertyAll(
        AppColorsDark.primary,
      ),
      checkColor: MaterialStatePropertyAll(
        AppColorsDark.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            4,
          ),
        ),
      ),
      side: BorderSide(
        color: AppColorsDark.grey,
        width: 2,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorsLight.background,
      elevation: 8,
      shadowColor: Colors.black.withOpacity(0.2),
      foregroundColor: AppColorsLight.black,
      titleTextStyle: const TextStyle(
        color: AppColorsLight.black,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: AppColorsLight.black,
      labelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16),
      unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16),
      unselectedLabelColor: AppColorsLight.black,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColorsDark.primary,
        // primary red
        onPrimary: AppColorsDark.dark,
        // element background dark

        secondary: AppColorsDark.white,
        // white text
        onSecondary: AppColorsDark.dark,
        // filler

        error: AppColorsDark.error,
        // error red
        onError: AppColorsDark.success,
        // green success

        background: AppColorsDark.background,
        // background
        onBackground: AppColorsDark.white,
        // common white

        surface: AppColorsDark.grey,
        // grey
        onSurface: AppColorsDark.saleHot,
        // sale hot

        surfaceTint: AppColorsDark.white,
        // chip foreground
        onSurfaceVariant: AppColorsDark.background // chip background

        ),
    fontFamily: 'Metropolis',
    scaffoldBackgroundColor: AppColorsDark.background,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColorsDark.background,
      elevation: 4,
      selectedIconTheme: IconThemeData(color: AppColorsDark.primary),
      unselectedIconTheme: IconThemeData(color: AppColorsDark.grey),
      selectedLabelStyle: TextStyle(
          color: AppColorsDark.primary,
          fontSize: 10,
          fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(color: AppColorsDark.grey, fontSize: 10),
    ),
    textTheme: const TextTheme(
      //Error text
      titleSmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: AppColorsDark.error),
      // Headline
      displayLarge: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w700,
        color: AppColorsDark.white,
      ),

      // Headline 2
      displayMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColorsDark.white,
      ),

      // Headline 3
      displaySmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColorsDark.white,
      ),

      // Subheads
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColorsDark.white,
      ),

      // Text
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColorsDark.white,
      ),

      // Descriptive items
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColorsDark.white,
      ),

      // Description text
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColorsDark.white,
      ),

      // Helper text
      labelMedium: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: AppColorsDark.grey,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: AppColorsDark.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.error)) {
          return AppColorsDark.error;
        }
        return AppColorsDark.success;
      }),
      filled: true,
      fillColor: AppColorsDark.dark,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(4),
      ),
      labelStyle: const TextStyle(
        color: AppColorsDark.grey,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      floatingLabelStyle: MaterialStateTextStyle.resolveWith((states) {
        if (states.contains(MaterialState.error)) {
          return const TextStyle(
            color: AppColorsDark.error,
            fontSize: 11,
            fontWeight: FontWeight.w400,
          );
        }
        return const TextStyle(
          color: AppColorsDark.grey,
          fontSize: 11,
          fontWeight: FontWeight.w400,
        );
      }),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: MaterialStatePropertyAll(
          Size.fromWidth(
            double.infinity,
          ),
        ),
        backgroundColor: MaterialStatePropertyAll(
          AppColorsDark.primary,
        ),
        elevation: MaterialStatePropertyAll(4),
        shadowColor: MaterialStatePropertyAll(AppColorsDark.primary),
        foregroundColor: MaterialStatePropertyAll(AppColorsDark.white),
        textStyle: MaterialStatePropertyAll(
          TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        iconColor: MaterialStatePropertyAll(AppColorsDark.white),
        iconSize: MaterialStatePropertyAll(24),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                50,
              ),
            ),
          ),
        ),
      ),
    ),
    outlinedButtonTheme: const OutlinedButtonThemeData(
      style: ButtonStyle(
        minimumSize: MaterialStatePropertyAll(
          Size.fromWidth(
            double.infinity,
          ),
        ),
        padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
        foregroundColor: MaterialStatePropertyAll(AppColorsDark.white),
        textStyle: MaterialStatePropertyAll(
          TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide(color: AppColorsDark.white),
            borderRadius: BorderRadius.all(
              Radius.circular(
                50,
              ),
            ),
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      textStyle: const MaterialStatePropertyAll(
        TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
      ),
      overlayColor:
          MaterialStatePropertyAll(AppColorsDark.white.withOpacity(0.2)),
      foregroundColor: const MaterialStatePropertyAll(AppColorsDark.white),
    )),
    checkboxTheme: const CheckboxThemeData(
      fillColor: MaterialStatePropertyAll(
        AppColorsDark.primary,
      ),
      checkColor: MaterialStatePropertyAll(
        AppColorsDark.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            4,
          ),
        ),
      ),
      side: BorderSide(
        color: AppColorsDark.grey,
        width: 2,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColorsDark.background,
      elevation: 8,
      foregroundColor: AppColorsDark.white,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w600,
        color: AppColorsDark.dark,
        fontSize: 18,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: AppColorsDark.white,
      labelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16),
      unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16),
      unselectedLabelColor: AppColorsLight.white,
    ),
  );
}
