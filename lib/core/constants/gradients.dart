import 'package:flutter/cupertino.dart';

LinearGradient get mainGradient => const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xff118BBF), Color(0xff05B4FF)],
    stops: [0, 0.6325]);

LinearGradient get secondaryGradient => const LinearGradient(
      colors: [Color(0xffA1D2F1), Color(0xffE2F2FC), Color(0xff9FD1F1)],
      stops: [0, 0.3167, 1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

LinearGradient get succesfulOrderGradient => const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xffE2F2FC),
        Color(0xffA1D2F1),
      ],
    );

RadialGradient get productGradient => const RadialGradient(
      stops: [0, 1],
      colors: [Color(0xffffffff), Color(0xffD6EBF4)],
    );
