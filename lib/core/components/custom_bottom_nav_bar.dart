import 'custom_app_bar.dart';
import 'hamburger_menu.dart';
import '../../features/_product/destinations/destination_model.dart';
import '../../features/_product/destinations/destinations.dart';

import '../../features/_product/destinations/routes.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar>
    with TickerProviderStateMixin<CustomBottomNavBar> {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: IndexedStack(
        index: _selectedIndex,
        children: destinations.map<Widget>((Destination destination) {
          return Routes(
            destination: destination,
          );
        }).toList(),
      ),
      endDrawer: HamburgerMenu(
        setIndex: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: destinations.map((Destination destination) {
          return BottomNavigationBarItem(
            icon: destination.icon,
            label: "",
          );
        }).toList(),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: _onItemTapped,
      ),
      extendBody: true,
      resizeToAvoidBottomInset: false,
    );
  }
}
