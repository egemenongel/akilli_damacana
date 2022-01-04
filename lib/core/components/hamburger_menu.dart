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
                child: Padding(
                  padding: context.paddingNormalHorizontal,
                  child: Container(
                    child: ListTile(
                      title: const Text(
                        "MENU",
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            shared.deleteToken();
                            Navigator.popUntil(
                                context, (route) => route.isFirst);
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
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Expanded(
                flex: 4,
                child: Row(
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
                ),
              ),
              Expanded(
                flex: 4,
                child: ListTile(
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
                    }),
              ),
              Expanded(
                flex: 4,
                child: ListTile(
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
                    }),
              ),
              const Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 5,
                child: Padding(
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
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Expanded(
                flex: 24,
                child: GridView.builder(
                  padding: context.paddingNormalHorizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
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
                        ));
                  },
                ),
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
}
