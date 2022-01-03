import 'package:akilli_damacana/features/_product/destinations/destination_model.dart';
import 'package:akilli_damacana/features/home/cart/view/cart_view.dart';
import 'package:akilli_damacana/features/home/home_view/view/home_view.dart';
import 'package:akilli_damacana/features/home/profile/view/profile_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<Destination> destinations = <Destination>[
  Destination(
    CartView(),
    SvgPicture.asset("assets/icons/shop.svg"),
  ),
  Destination(
    const HomeView(),
    SvgPicture.asset("assets/icons/home.svg"),
  ),
  Destination(
    const ProfileView(),
    SvgPicture.asset("assets/icons/settings.svg"),
  ),
];
