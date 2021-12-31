import 'package:flutter/material.dart';
import 'package:akilli_damacana/core/extension/context_extension.dart';

class BlueElevatedButton extends StatelessWidget {
  const BlueElevatedButton(
      {Key? key, required this.child, required this.onPressed})
      : super(key: key);
  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          context.colors.primaryVariant,
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          context.colors.onSecondary,
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          context.paddingNormal,
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            context.lowRadius,
          ),
        )),
      ),
      child: child,
      onPressed: () {},
    );
  }
}
