import 'package:akilli_damacana/core/components/blue_elevated_button.dart';
import 'package:akilli_damacana/features/home/cart/viewmodel/cart_viewmodel.dart';
import 'package:akilli_damacana/core/extension/context_extension.dart';
import 'package:akilli_damacana/services/rest_api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  CartView({Key? key}) : super(key: key);
  final apiService = RestApiService();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: buildTopBar(context),
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
                    child: buildCart(),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  Expanded(
                    flex: 6,
                    child: buildTotal(context),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(flex: 6, child: buildOrderButton(context)),
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

  Container buildTopBar(BuildContext context) {
    return Container(
      padding: context.paddingLowHorizontal,
      color: context.colors.secondary,
      child: Row(
        children: [
          const Spacer(),
          Text(
            "SEPETİM",
            style: context.textTheme.headline6!.copyWith(
              color: context.colors.onBackground,
              fontWeight: FontWeight.w900,
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
    );
  }

  Consumer<CartViewModel> buildCart() {
    return Consumer<CartViewModel>(builder: (_, _cartViewModel, __) {
      return ListView.builder(
        itemCount: _cartViewModel.cart.length,
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
                          "${_cartViewModel.cart[index].photoUrl}",
                        ),
                      ),
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
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: context.paddingNormal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            "19 Lt ${_cartViewModel.cart[index].brand} Damacana Su",
                            style: context.textTheme.bodyText1!.copyWith(
                              color: context.colors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 3,
                          child: Text(
                            "${_cartViewModel.cart[index].price} Tl",
                            style: context.textTheme.caption!
                                .copyWith(color: context.colors.primary),
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
                                        borderRadius: BorderRadius.only(
                                      bottomLeft:
                                          Radius.circular(context.lowValue),
                                      topLeft:
                                          Radius.circular(context.lowValue),
                                    )),
                                    margin: EdgeInsets.zero,
                                    child: InkWell(
                                      onTap: () {
                                        context.read<CartViewModel>().decrement(
                                            _cartViewModel.cart[index]);
                                      },
                                      child: Icon(
                                        Icons.remove,
                                        color: context.colors.secondary,
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
                                      "${_cartViewModel.cart[index].count}",
                                      style:
                                          context.textTheme.bodyText1!.copyWith(
                                        color: context.colors.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  color: context.colors.primaryVariant,
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 40,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(context.lowValue),
                                      topRight:
                                          Radius.circular(context.lowValue),
                                    )),
                                    margin: EdgeInsets.zero,
                                    child: InkWell(
                                      onTap: () {
                                        context.read<CartViewModel>().increment(
                                            _cartViewModel.cart[index]);
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: context.colors.secondary,
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
      );
    });
  }

  Container buildTotal(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.primary,
        borderRadius: BorderRadius.all(
          context.lowRadius,
        ),
      ),
      child: Center(
          child: Consumer<CartViewModel>(builder: (_, _cartViewModel, __) {
        return Text(
          "TOPLAM TUTAR: ${_cartViewModel.total}",
          style: context.textTheme.subtitle1!.copyWith(
            color: context.colors.primaryVariant,
            fontWeight: FontWeight.bold,
          ),
        );
      })),
    );
  }

  Row buildOrderButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Consumer<CartViewModel>(builder: (_, _cartViewModel, __) {
            return BlueElevatedButton(
                child: Text(
                  "SİPARİŞİ ONAYLA",
                  style: context.textTheme.headline6!.copyWith(
                    color: context.colors.primary,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                onPressed: () {
                  apiService.createOrder(_cartViewModel.order());
                });
          }),
        ),
      ],
    );
  }
}
