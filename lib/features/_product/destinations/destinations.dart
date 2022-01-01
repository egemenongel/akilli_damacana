import 'package:akilli_damacana/features/_product/destinations/destination_model.dart';
import 'package:akilli_damacana/features/home/cart/cart_view.dart';
import 'package:akilli_damacana/features/home/home_view/home_view.dart';
import 'package:akilli_damacana/features/home/settings/settings_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<Destination> destinations = <Destination>[
  Destination(
    const CartView(),
    SvgPicture.asset("assets/icons/shop.svg"),
  ),
  Destination(
    const HomeView(),
    SvgPicture.asset("assets/icons/home.svg"),
  ),
  Destination(
    const SettingsView(),
    SvgPicture.asset("assets/icons/settings.svg"),
  ),
];
