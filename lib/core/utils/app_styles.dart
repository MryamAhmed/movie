import 'package:flutter/material.dart';

abstract class AppStyles {
  // text styles
  static const TextStyle font24CairoW700 = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle font20 =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white);

  static const TextStyle font10 =
      TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white);
}
