import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoesapp/core/services/get.dart';

final class AppTextStyles {
  /// Text style for heading 1 text
  static final TextStyle displayLarge =
      GoogleFonts.urbanist(fontWeight: FontWeight.w700).px28;

  /// Text style for heading 2 text
  static final TextStyle displayMedium =
      GoogleFonts.urbanist(fontWeight: FontWeight.w600).px17;

  /// Text style for heading 3 text
  static final TextStyle displaySmall =
      GoogleFonts.urbanist(fontWeight: FontWeight.w500).px14;

  /// Text style for heading 4 text
  static final TextStyle headlineMedium =
      GoogleFonts.urbanist(fontWeight: FontWeight.w600).px15;

  /// Text style for large body text
  static final TextStyle bodyLarge =
      GoogleFonts.urbanist(fontWeight: FontWeight.w700).px22;

  //Text style for body text
  static final TextStyle bodyMedium =
      GoogleFonts.urbanist(fontWeight: FontWeight.w600).px16;

  //Text style for small body//subtitle 1
  static final TextStyle titleMedium =
      GoogleFonts.urbanist(fontWeight: FontWeight.w500).px16;

  static final TextStyle titleLarge =
      GoogleFonts.urbanist(fontWeight: FontWeight.w700).px30;

//Text style for extrasmall body//subtitle 2
  static final TextStyle titleSmall =
      GoogleFonts.urbanist(fontWeight: FontWeight.w600).px12;

  static final TextStyle headlineLarge =
      GoogleFonts.urbanist(fontWeight: FontWeight.w600).px20;
}
