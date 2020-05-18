import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Google fonts constant setting: https://fonts.google.com/
TextTheme kTextTheme(theme) {
   return GoogleFonts.ralewayTextTheme(theme);
  // switch (language) {
  //   case 'vi':
  //     return GoogleFonts.montserratTextTheme(theme);
  //   case 'ar':
  //     return GoogleFonts.ralewayTextTheme(theme);
  //   default:
  //     return GoogleFonts.ralewayTextTheme(theme);
  // }
}

TextTheme kHeadlineTheme(theme) {
  return GoogleFonts.ralewayTextTheme(theme);
  // switch (language) {
  //   case 'vi':
  //     return GoogleFonts.montserratTextTheme(theme);
  //   case 'ar':
  //     return GoogleFonts.ralewayTextTheme(theme);
  //   default:
  //     return GoogleFonts.ralewayTextTheme(theme);
  // }
}
