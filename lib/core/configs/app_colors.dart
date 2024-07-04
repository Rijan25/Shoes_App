import 'package:flutter/material.dart';

abstract final class AppColors {
  static const Color primary = indigoAccent;

  static const Color secondary = Color(0xff008080);

  static const Color transparent = Color.fromARGB(0, 0, 0, 0);

  static const Color black = Color(0xff0D0D0D);

  static const Color blackBackground = Color(0xFF171717);

  static const Color cardBgWhite = Color(0xffF5F5F5);

  static const Color cardBgBlack = Color(0xff1B1B1B);

  static const Color white = Color(0xffffffff);

  static const Color whiteBackground = Color(0xFFEFEFF4);

  static const Color yellow = Color(0xffFFc107);

  static const Color purple = Color(0xff4B0082);

  static const Color teal = Color(0xff008080);

  static const Color pink = Color.fromARGB(255, 238, 107, 129);

  static const Color green = Color(0xff4CAF50);

  static const Color red = Color(0xfff44336);

  static const Color grey = Color(0xff808080);

  static const Color blue = Color(0xff2196f3);

  static const Color badge = Color(0xff1D9BF0);

  static const Color indigo = Color(0xff3f51b5);

  static const Color indigoAccent = Color(0xff3D5AFE);

  static const Color cyan = Color(0xff00bcd4);

  static const Color unselcetedlight = Color(0xffC9D7EE);

  static const Color unselceteddark = Color(0xffF2F2F2);

  static Color getShade(Color color, {bool darker = false, double value = .1}) {
    assert(value >= 0 && value <= 1, 'shade values must be between 0 and 1');

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness(
      (darker ? (hsl.lightness - value) : (hsl.lightness + value))
          .clamp(0.0, 1.0),
    );

    return hslDark.toColor();
  }

  static MaterialColor getMaterialColorFromColor(Color color) {
    final colorShades = <int, Color>{
      50: getShade(color, value: 0.5),
      100: getShade(color, value: 0.4),
      200: getShade(color, value: 0.3),
      300: getShade(color, value: 0.2),
      400: getShade(color, value: 0.1),
      500: color,
      600: getShade(color, value: 0.1, darker: true),
      700: getShade(color, value: 0.15, darker: true),
      800: getShade(color, value: 0.2, darker: true),
      900: getShade(color, value: 0.25, darker: true),
    };
    return MaterialColor(color.value, colorShades);
  }
}
