import 'package:akilli_damacana/core/theme/app_theme.dart';
import 'package:akilli_damacana/features/home/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Akıllı Damacana',
      theme: appTheme,
      home: const HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}