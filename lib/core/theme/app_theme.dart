import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData.from(
  colorScheme: ThemeData().colorScheme.copyWith(
        primary: const Color(0xffffffff),
        primaryVariant: const Color(0xff0F608E),
        secondary: const Color(0xff1D91D2),
        onPrimary: const Color(0xff0F608E),
        onSecondary: const Color(0xffffffff),
        brightness: Brightness.light,
        onBackground: const Color(0xffffffff),
      ),
).copyWith(
    appBarTheme: const AppBarTheme(),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff0F608E),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color(0xff0F608E),
    ));
