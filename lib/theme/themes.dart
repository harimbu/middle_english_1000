import 'package:flutter/material.dart';

class Themes {
  static Color accent = Color(0xFF2475EE);
  static Color primary = Color(0xFF111111);
  static Color secondry = Color(0xFF242424);
  static Color third = Color.fromARGB(255, 90, 90, 90);
  static Color bg1 = Color(0xFFF2F6FF);
  static Color bg2 = Color(0xFFE8EEFF);
  static Color bg3 = Color(0xFFBED8FF);

  static Color darkPrimary = Color(0xFFE7E7E7);
  static Color darkSecondry = Color(0xFFBABABA);
  static Color darkThird = Color(0xFF979797);
  static Color darkBg1 = Color(0xFF181818);
  static Color darkBg2 = Color(0xFF1D1D1D);
  static Color darkBg3 = Color(0xFF666666);

  static Color white = Color(0xFFFFFFFF);
  static Color black = Color(0xFF000000);

  static final light = ThemeData.light().copyWith(
    // brightness: Brightness.light,
    // primaryColor: primary,
    scaffoldBackgroundColor: bg1,
    appBarTheme: AppBarTheme(
      toolbarHeight: 80,
      elevation: 0,
      foregroundColor: primary,
      backgroundColor: bg1,
      iconTheme: IconThemeData(
        color: primary,
      ),
    ),

    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 40,
        color: black,
      ),
      bodyLarge: TextStyle(
        color: primary,
        fontSize: 18.0,
        // fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: third,
        fontSize: 14.0,
      ),
      bodySmall: TextStyle(
        color: secondry,
        fontSize: 14.0,
      ),
    ),
  );

  static final dark = ThemeData.dark().copyWith(
    // brightness: Brightness.dark,
    // primaryColor: darkPrimary,
    scaffoldBackgroundColor: darkBg1,
    appBarTheme: AppBarTheme(
      toolbarHeight: 80,
      elevation: 0,
      foregroundColor: darkPrimary,
      backgroundColor: darkBg1,
      iconTheme: IconThemeData(
        color: darkPrimary,
      ),
    ),

    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 40,
        color: white,
      ),
      bodyLarge: TextStyle(
        color: darkPrimary,
        fontSize: 18.0,
        // fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: darkThird,
        fontSize: 14.0,
      ),
      bodySmall: TextStyle(
        color: darkSecondry,
        fontSize: 14.0,
      ),
    ),
  );
}
