import 'package:akilli_damacana/core/extension/context_extension.dart';
import 'package:akilli_damacana/features/_product/widgets/blue_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: context.paddingLowHorizontal,
            color: context.colors.secondary,
            child: Row(
              children: [
                const Spacer(),
                Text(
                  "SEPETİM",
                  style: context.textTheme.headline6!.copyWith(
                    color: context.colors.onBackground,
                  ),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/icons/shop.svg",
                      color: context.colors.onBackground,
                    )),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xff118BBF),
                  Color(0xff05B4FF),
                ],
                    stops: [
                  0,
                  0.6325,
                ])),
            child: Padding(
              padding: context.paddingMedium,
              child: Column(
                children: [
                  Expanded(
                    flex: 40,
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 150,
                          width: 150,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                    child: ClipRRect(
                                      child: Image.asset(
                                        "assets/icons/companies/hayat.png",
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        context.lowValue,
                                      ),
                                      gradient: const RadialGradient(
                                        stops: [0, 1],
                                        colors: [
                                          Color(0xffffffff),
                                          Color(0xffD6EBF4)
                                        ],
                                      ),
                                      border: Border.all(
                                        width: 1,
                                        color: const Color(0xff94C11F),
                                      ),
                                    )),
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: context.paddingNormal,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Text(
                                          "19 Lt Hayat Damacana Su",
                                          style: context.textTheme.bodyText1!
                                              .copyWith(
                                                  color:
                                                      context.colors.primary),
                                        ),
                                      ),
                                      const Spacer(),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          "19.90 Tl",
                                          style: context.textTheme.bodyText2!
                                              .copyWith(
                                                  color:
                                                      context.colors.primary),
                                        ),
                                      ),
                                      const Spacer(
                                        flex: 10,
                                      ),
                                      Expanded(
                                        flex: 8,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: SizedBox(
                                                height: 50,
                                                child: Card(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                    bottomLeft: Radius.circular(
                                                        context.lowValue),
                                                    topLeft: Radius.circular(
                                                        context.lowValue),
                                                  )),
                                                  margin: EdgeInsets.zero,
                                                  child: InkWell(
                                                    onTap: () {},
                                                    child: Icon(
                                                      Icons.remove,
                                                      color: context
                                                          .colors.secondary,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                height: 40,
                                                child: Center(
                                                  child: Text(
                                                    "1",
                                                    style: context
                                                        .textTheme.headline6!
                                                        .copyWith(
                                                      color: context
                                                          .colors.primary,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                color: context
                                                    .colors.primaryVariant,
                                              ),
                                            ),
                                            Expanded(
                                              child: SizedBox(
                                                height: 40,
                                                child: Card(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(
                                                            context.lowValue),
                                                    topRight: Radius.circular(
                                                        context.lowValue),
                                                  )),
                                                  margin: EdgeInsets.zero,
                                                  child: InkWell(
                                                    onTap: () {},
                                                    child: Icon(
                                                      Icons.add,
                                                      color: context
                                                          .colors.secondary,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.colors.primary,
                        borderRadius: BorderRadius.circular(context.lowValue),
                      ),
                      child: Center(
                          child: Text(
                        "TOPLAM TUTAR:",
                        style: context.textTheme.bodyText1!
                            .copyWith(color: context.colors.primaryVariant),
                      )),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(
                      flex: 6,
                      child: Row(
                        children: [
                          Expanded(
                            child: BlueElevatedButton(
                                child: Text(
                                  "SİPARİŞİ ONAYLA",
                                  style: context.textTheme.headline6!
                                      .copyWith(color: context.colors.primary),
                                ),
                                onPressed: () {}),
                          ),
                        ],
                      )),
                  const Spacer(
                    flex: 6,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
