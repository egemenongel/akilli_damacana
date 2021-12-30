import 'package:akilli_damacana/features/_product/widgets/custom_app_bar.dart';
import 'package:akilli_damacana/features/home/home_view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgets = [
    Center(
      child: Text("Cart"),
    ),
    HomeView(),
    Center(
      child: Text("Settings"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HamburgerMenu(),
      body: _widgets.elementAt(_selectedIndex),
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
        onTap: _onItemTapped,
      ),
    );
  }
}
