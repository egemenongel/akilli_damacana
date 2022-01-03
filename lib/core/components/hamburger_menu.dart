import 'package:akilli_damacana/core/extension/context_extension.dart';
import 'package:akilli_damacana/features/_product/constants/company_logos.dart';
import 'package:flutter/material.dart';

class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({
    Key? key,
  }) : super(key: key);

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
                          onPressed: () {}, icon: const Icon(Icons.clear)),
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
                          selected: true,
                          title: Padding(
                            padding: context.paddingNormalHorizontal,
                            child: const Text(
                              "Profilim",
                            ),
                          ),
                          onTap: () {
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
                    dense: true,
                    title: Padding(
                      padding: context.paddingNormalHorizontal,
                      child: const Text(
                        "Sipariş Et",
                      ),
                    ),
                    onTap: () {
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
