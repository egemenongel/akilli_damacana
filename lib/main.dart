import 'package:akilli_damacana/core/components/custom_bottom_nav_bar.dart';
import 'package:akilli_damacana/core/theme/app_theme.dart';
import 'package:akilli_damacana/features/auth/login/view/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Akıllı Damacana',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => LoginView(),
        "/home": (context) => const CustomBottomNavBar(),
      },
    );
  }
}
