import 'package:akilli_damacana/core/constants/gradients.dart';
import 'package:flutter/material.dart';

import '../../services/shared_preferences.dart';
import '../constants/company_logos.dart';
import '../extension/context_extension.dart';

class HamburgerMenu extends StatelessWidget {
  HamburgerMenu({
    Key? key,
    required this.setIndex,
    required this.selectedIndex,
  }) : super(key: key);
  final shared = SharedPreferencesService();
  final Function(int) setIndex;
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.725,
      child: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(),
              Expanded(
                flex: 5,
                child: buildTopBar(context),
              ),
              const Spacer(
                flex: 2,
              ),
              Expanded(
                flex: 4,
                child: buildProfileTile(context),
              ),
              Expanded(
                flex: 4,
                child: buildOrderTile(context),
              ),
              Expanded(
                flex: 4,
                child: buildSettingsTile(context),
              ),
              const Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 5,
                child: buildSuggestionText(context),
              ),
              const Spacer(
                flex: 2,
              ),
              Expanded(
                flex: 24,
                child: buildSuggestedProductsGrid(context),
              ),
              const Spacer(
                flex: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildTopBar(BuildContext context) {
    return Padding(
      padding: context.paddingNormalHorizontal,
      child: Container(
        child: ListTile(
          title: const Text(
            "MENU",
          ),
          trailing: IconButton(
              onPressed: () {
                shared.deleteToken();
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              icon: const Icon(Icons.clear)),
        ),
        decoration: BoxDecoration(
          color: context.colors.secondary,
          borderRadius: BorderRadius.all(
            context.lowRadius,
          ),
        ),
      ),
    );
  }

  Row buildProfileTile(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: ListTile(
              dense: true,
              selected: selectedIndex == 2 ? true : false,
              title: Padding(
                padding: context.paddingNormalHorizontal,
                child: const Text(
                  "Profilim",
                ),
              ),
              onTap: () {
                setIndex(2);
                Navigator.pop(context);
              }),
        ),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }

  ListTile buildOrderTile(BuildContext context) {
    return ListTile(
        selected: selectedIndex == 0 ? true : false,
        dense: true,
        title: Padding(
          padding: context.paddingNormalHorizontal,
          child: const Text(
            "Sipariş Et",
          ),
        ),
        onTap: () {
          setIndex(0);
          Navigator.pop(context);
        });
  }

  ListTile buildSettingsTile(BuildContext context) {
    return ListTile(
        dense: true,
        title: Padding(
          padding: context.paddingNormalHorizontal,
          child: const Text(
            "Ayarlar",
          ),
        ),
        onTap: () {
          setIndex(2);
          Navigator.pop(context);
        });
  }

  Padding buildSuggestionText(BuildContext context) {
    return Padding(
      padding: context.paddingNormalHorizontal,
      child: Container(
        child: const ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            "Önerilen Su Markaları",
            textAlign: TextAlign.center,
          ),
        ),
        decoration: BoxDecoration(
          color: context.colors.secondary,
          borderRadius: BorderRadius.all(
            context.lowRadius,
          ),
        ),
      ),
    );
  }

  GridView buildSuggestedProductsGrid(BuildContext context) {
    return GridView.builder(
      padding: context.paddingNormalHorizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            padding: context.paddingLow,
            child: Image.asset(ImagePaths.companyLogos[index]),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                context.lowRadius,
              ),
              gradient: productGradient,
              border: Border.all(
                width: 1,
                color: const Color(0xff94C11F),
              ),
            ));
      },
    );
  }
}
