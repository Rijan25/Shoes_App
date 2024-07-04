import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoesapp/core/configs/exportconfig.dart';
import 'package:shoesapp/core/services/get.dart';

////////////////////////App Themes////////////////////////////////
abstract final class AppThemes {
  static ThemeData get darkTheme => ThemeData(
      brightness: Brightness.dark,
      disabledColor: AppColors.white,
      unselectedWidgetColor: AppColors.unselcetedlight,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: GoogleFonts.urbanist().fontFamily,
      primaryIconTheme: Icontheme.darkIconTheme,
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.dark(
          error: AppColors.red,
          brightness: Brightness.dark,
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          background: AppColors.black),
      scaffoldBackgroundColor: AppColors.black,
      textTheme: TextThemes.darkTextTheme,
      iconTheme: Icontheme.darkIconTheme,
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
              iconColor:
                  MaterialStateColor.resolveWith((states) => AppColors.red))),
      cardColor: AppColors.black,
      useMaterial3: false,
      appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppColors.black,
          iconTheme: IconThemeData(size: 23.sp, color: AppColors.primary),
          actionsIconTheme:
              IconThemeData(color: AppColors.primary, size: 15.sp),
          titleTextStyle: TextThemes.darkTextTheme.bodyMedium!.px19));

  static ThemeData get lightTheme => ThemeData(
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      disabledColor: AppColors.black,
      fontFamily: GoogleFonts.urbanist().fontFamily,
      unselectedWidgetColor: AppColors.unselcetedlight,
      primaryIconTheme: Icontheme.lightIconTheme,
      textTheme: TextThemes.primaryTextTheme,
      primaryColor: AppColors.primary,
      cardColor: AppColors.white,
      useMaterial3: false,
      colorScheme: const ColorScheme.light(
          brightness: Brightness.light,
          primary: AppColors.primary,
          secondary: AppColors.pink,
          background: AppColors.white),
      scaffoldBackgroundColor: AppColors.white,
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
              iconColor: MaterialStateColor.resolveWith(
                  (states) => AppColors.primary))),
      appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextThemes.primaryTextTheme.bodyMedium!.px19,
          backgroundColor: AppColors.white,
          actionsIconTheme:
              IconThemeData(color: AppColors.primary, size: 15.sp),
          iconTheme: IconThemeData(size: 23.sp, color: AppColors.primary)));

  static CupertinoThemeData get iosdarkTheme => MaterialBasedCupertinoThemeData(
      materialTheme: AppThemes.darkTheme.copyWith(
          cupertinoOverrideTheme: CupertinoThemeData(
              primaryContrastingColor: AppColors.primary,
              scaffoldBackgroundColor: CupertinoColors.darkBackgroundGray,
              barBackgroundColor: CupertinoColors.darkBackgroundGray,
              applyThemeToAll: true,
              textTheme: CupertinoTextThemeData(
                  primaryColor: AppColors.primary,
                  textStyle: TextThemes.darkTextTheme.bodyMedium!.px19),
              primaryColor: AppColors.primary,
              brightness: Brightness.dark)));

  static CupertinoThemeData get ioslightTheme =>
      MaterialBasedCupertinoThemeData(
          materialTheme: AppThemes.lightTheme.copyWith(
              cupertinoOverrideTheme: CupertinoThemeData(
                  primaryContrastingColor: AppColors.primary,
                  scaffoldBackgroundColor:
                      CupertinoColors.extraLightBackgroundGray,
                  barBackgroundColor: CupertinoColors.extraLightBackgroundGray,
                  primaryColor: AppColors.primary,
                  applyThemeToAll: true,
                  textTheme: CupertinoTextThemeData(
                      primaryColor: AppColors.primary,
                      textStyle: TextThemes.primaryTextTheme.bodyMedium!.px19),
                  brightness: Brightness.light)));
}

////////////////////////Text Theme////////////////////////////////
abstract final class TextThemes {
  static TextTheme get textTheme {
    return TextTheme(
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        titleMedium: AppTextStyles.titleMedium,
        titleSmall: AppTextStyles.titleSmall,
        displayLarge: AppTextStyles.displayLarge,
        displayMedium: AppTextStyles.displayMedium,
        displaySmall: AppTextStyles.displaySmall,
        headlineMedium: AppTextStyles.headlineMedium,
        headlineLarge: AppTextStyles.headlineLarge);
  }

  static TextTheme get darkTextTheme {
    Color textColor = AppColors.white;
    return TextTheme(
        bodyLarge: AppTextStyles.bodyLarge.copyWith(color: textColor),
        bodyMedium: AppTextStyles.bodyMedium.copyWith(color: textColor),
        titleMedium: AppTextStyles.titleMedium.copyWith(color: textColor),
        titleSmall: AppTextStyles.titleSmall.copyWith(color: textColor),
        displayLarge: AppTextStyles.displayLarge.copyWith(color: textColor),
        displayMedium: AppTextStyles.displayMedium.copyWith(color: textColor),
        displaySmall: AppTextStyles.displaySmall.copyWith(color: textColor),
        headlineMedium: AppTextStyles.headlineMedium.copyWith(color: textColor),
        headlineLarge: AppTextStyles.headlineLarge.copyWith(color: textColor));
  }

  static TextTheme get primaryTextTheme {
    Color textColor = AppColors.black;
    return TextTheme(
        bodyLarge: AppTextStyles.bodyLarge.copyWith(color: textColor),
        bodyMedium: AppTextStyles.bodyMedium.copyWith(color: textColor),
        titleMedium: AppTextStyles.titleMedium.copyWith(color: textColor),
        titleSmall: AppTextStyles.titleSmall.copyWith(color: textColor),
        displayLarge: AppTextStyles.displayLarge.copyWith(color: textColor),
        displayMedium: AppTextStyles.displayMedium.copyWith(color: textColor),
        displaySmall: AppTextStyles.displaySmall.copyWith(color: textColor),
        headlineMedium: AppTextStyles.headlineMedium.copyWith(color: textColor),
        headlineLarge: AppTextStyles.headlineLarge.copyWith(color: textColor));
  }
}

////////////////////////Icon Theme////////////////////////////////
abstract final class Icontheme {
  static IconThemeData get lightIconTheme =>
      IconThemeData(size: 23.sp, color: AppColors.black);
  static IconThemeData get darkIconTheme =>
      IconThemeData(size: 23.sp, color: AppColors.white);
}
