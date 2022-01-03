import 'dart:async';
import 'package:akilli_damacana/core/extension/context_extension.dart';
import 'package:akilli_damacana/features/auth/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  double percent = 0.0;
  @override
  void initState() {
    super.initState();
    Timer? timer;
    timer = Timer.periodic(const Duration(milliseconds: 30), (_) {
      setState(() {
        percent += 1;
        if (percent >= 100) {
          timer!.cancel();
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (c, a1, a2) => LoginView(),
              transitionsBuilder: (c, anim, a2, child) =>
                  FadeTransition(opacity: anim, child: child),
              transitionDuration: const Duration(milliseconds: 1500),
            ),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: context.paddingHighHorizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 12,
                child: Image.asset(
                  "assets/images/girislogosu.png",
                )),
            const Spacer(
              flex: 6,
            ),
            Expanded(
              flex: 1,
              child: LiquidLinearProgressIndicator(
                value: percent / 100,
                valueColor:
                    AlwaysStoppedAnimation(context.colors.primaryVariant),
                backgroundColor: Colors.white,
                borderColor: const Color(0xff46D8FD),
                borderWidth: 4.0,
                borderRadius: context.normalValue,
                direction: Axis.horizontal,
                center: Text(
                  "LOADING",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                    color: context.colors.primary,
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffA1D2F1),
                Color(0xffE2F2FC),
                Color(0xff9FD1F1),
              ],
              stops: [
                0,
                0.3167,
                1,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            image: DecorationImage(
                alignment: Alignment(0, 5),
                image: AssetImage("assets/images/girissonrasi.png"))),
      ),
    );
  }
}
