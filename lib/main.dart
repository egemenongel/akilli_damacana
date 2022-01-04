import 'core/components/custom_bottom_nav_bar.dart';
import 'features/auth/splash/splash_view.dart';
import 'features/home/cart/viewmodel/cart_viewmodel.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CartViewModel()),
    ],
    child: const MyApp(),
  ));
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
        "/": (context) => const SplashView(),
        "/login": (context) => LoginView(),
        "/home": (context) => const CustomBottomNavBar(),
      },
    );
  }
}
