import 'package:akilli_damacana/core/extension/context_extension.dart';
import 'package:akilli_damacana/features/_product/constants/company_logos.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.mediumValue,
        vertical: context.highValue,
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
                child: Image.asset(ImagePaths.companyLogos[index]),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    context.lowRadius,
                  ),
                  gradient: const RadialGradient(
                    stops: [0, 1],
                    colors: [Color(0xffffffff), Color(0xffD6EBF4)],
                  ),
                  border: Border.all(
                    width: 1,
                    color: const Color(0xff94C11F),
                  ),
                )),
          );
        },
      ),
    );
  }
}
