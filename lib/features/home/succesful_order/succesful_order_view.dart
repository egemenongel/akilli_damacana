import 'package:akilli_damacana/core/constants/gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/components/blue_elevated_button.dart';
import '../../../core/extension/context_extension.dart';

class SuccesfulOrder extends StatelessWidget {
  const SuccesfulOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: context.paddingHigh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 8,
              child: Row(
                children: [
                  Expanded(
                    child: buildSuccesfulIcon(context),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: buildGoToProfileButton(context),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
        decoration: BoxDecoration(
          gradient: mainGradient,
        ),
      ),
    );
  }

  Container buildSuccesfulIcon(BuildContext context) {
    return Container(
      padding: context.paddingMedium,
      decoration: BoxDecoration(
        color: context.colors.primary,
        borderRadius: BorderRadius.all(context.lowRadius),
        gradient: succesfulOrderGradient,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              padding: context.paddingNormal,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 5,
                  color: context.colors.secondary,
                ),
              ),
              child: SvgPicture.asset(
                "assets/icons/shop.svg",
                height: context.screenHeight,
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 2,
            child: Text(
              "Sipari??iniz\n Yola ????kt??!",
              style: context.textTheme.headline5!.copyWith(
                color: context.colors.secondary,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildGoToProfileButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: BlueElevatedButton(
          child: Text(
            "Profile Git",
            style: context.textTheme.headline5!.copyWith(
              color: context.colors.primary,
              fontWeight: FontWeight.w900,
            ),
          ),
          onPressed: () {},
        ))
      ],
    );
  }
}
