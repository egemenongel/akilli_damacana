import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      endDrawer: const Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/shop.svg"),
              label: "Sepetim"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/home.svg"),
              label: "Ana Sayfa"),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/settings.svg"),
            label: "Ayarlar",
          ),
        ],
        showUnselectedLabels: false,
        showSelectedLabels: false,
      ),
    );
  }
}
