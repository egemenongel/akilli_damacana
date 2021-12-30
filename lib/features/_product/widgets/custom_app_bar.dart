import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:akilli_damacana/core/extension/context_extension.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight * 1.2),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
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
          child: IconButton(
            icon: SvgPicture.asset("assets/icons/menu.svg"),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ),
      ],
      elevation: 0,
    );
  }
}
