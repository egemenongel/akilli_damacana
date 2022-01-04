import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../extension/context_extension.dart';

class BorderedFormField extends StatelessWidget {
  const BorderedFormField(
      {Key? key,
      required this.keyboardType,
      required this.labelText,
      required this.assetPath,
      required this.textInputAction,
      this.textEditingController,
      this.isObscured,
      this.validator})
      : super(key: key);
  final TextInputType keyboardType;
  final String labelText;
  final String assetPath;
  final TextInputAction textInputAction;
  final TextEditingController? textEditingController;
  final bool? isObscured;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            context.lowRadius,
          ),
          borderSide: BorderSide(
            color: context.colors.primary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            context.lowRadius,
          ),
          borderSide: BorderSide(
            color: context.colors.primary,
          ),
        ),
        errorStyle: const TextStyle(
          fontSize: 8,
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: context.colors.onSecondary,
          fontSize: context.textTheme.subtitle1!.fontSize,
        ),
        prefixIcon: Padding(
          padding: context.paddingNormalHorizontal,
          child: SvgPicture.asset(
            assetPath,
          ),
        ),
      ),
      controller: textEditingController,
      validator: validator,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      style: context.textTheme.headline6!.copyWith(
        color: context.colors.onSecondary,
      ),
      obscureText: isObscured ?? false,
    );
  }
}
