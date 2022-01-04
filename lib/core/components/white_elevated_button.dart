import 'package:flutter/material.dart';
import '../extension/context_extension.dart';

class WhiteElevatedButton extends StatelessWidget {
  const WhiteElevatedButton(
      {Key? key,
      required this.child,
      required this.onPressed,
      required this.padding})
      : super(key: key);
  final Widget child;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          context.colors.primary,
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          context.colors.secondary,
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          padding,
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            context.lowRadius,
          ),
        )),
      ),
      child: child,
      onPressed: onPressed,
    );
  }
}
