import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData.from(
  colorScheme: ThemeData().colorScheme.copyWith(
        primary: Colors.white,
        onPrimary: const Color(0xff1D91D2),
        brightness: Brightness.light,
      ),
).copyWith(
    appBarTheme: const AppBarTheme(),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff0F608E),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color(0xff0F608E),
    ));
