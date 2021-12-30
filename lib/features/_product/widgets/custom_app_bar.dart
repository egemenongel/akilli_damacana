import 'package:akilli_damacana/features/_product/widgets/hamburger_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:akilli_damacana/core/extension/context_extension.dart';

class HamburgerMenu extends StatefulWidget implements PreferredSizeWidget {
  const HamburgerMenu({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight * 1.2),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _HamburgerMenuState createState() => _HamburgerMenuState();
}

class _HamburgerMenuState extends State<HamburgerMenu> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: context.paddingLow,
        child: SvgPicture.asset("assets/icons/logo.svg"),
      ),
      actions: [
        Padding(
          padding: context.paddingNormalHorizontal,
          child: const CustomDrawer(),
        ),
      ],
      elevation: 0,
    );
  }
}
