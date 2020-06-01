import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'fonts.dart';

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: kGrey900);
}

const ColorScheme kColorScheme = ColorScheme(
  primary: kTeal100,
  primaryVariant: kGrey900,
  secondary: kTeal50,
  secondaryVariant: kGrey900,
  surface: kSurfaceWhite,
  background: kBackgroundWhite,
  error: kErrorRed,
  onPrimary: kDarkBG,
  onSecondary: kGrey900,
  onSurface: kGrey900,
  onBackground: kGrey900,
  onError: kSurfaceWhite,
  brightness: Brightness.light,
);

// ThemeData buildLightTheme() {
//   final ThemeData base = ThemeData.light();
//   return base.copyWith(
//     //  primaryColor:
//     colorScheme: kColorScheme,
//     buttonColor: kTeal400,
//     cardColor: Colors.white,
//     textSelectionColor: kTeal100,
//     errorColor: kErrorRed,
//     buttonTheme: const ButtonThemeData(
//         colorScheme: kColorScheme,
//         textTheme: ButtonTextTheme.normal,
//         buttonColor: kDarkBG),
//     primaryColorLight: kLightBG,
//     primaryIconTheme: _customIconTheme(base.iconTheme),
//     iconTheme: _customIconTheme(base.iconTheme),
//     hintColor: Colors.black26,
//     backgroundColor: Colors.white,
//     primaryColor: kLightPrimary,
//     accentColor: kLightAccent,
//     cursorColor: kLightAccent,
//     scaffoldBackgroundColor: kLightBG,
//     appBarTheme: AppBarTheme(
//       elevation: 0,
//       textTheme: TextTheme(
//         title: TextStyle(
//           color: kDarkBG,
//           fontSize: 18.0,
//           fontWeight: FontWeight.w800,
//         ),
//       ),
//       iconTheme: IconThemeData(
//         color: kLightAccent,
//       ),
//     ),
//   );
// }


ThemeData buildLightTheme() {
   return ThemeData.light().copyWith(
      textTheme: GoogleFonts.openSansTextTheme(),
   );
  // return ThemeData(
  //   primarySwatch: Colors.orange,
  //   accentColor: Coolors.secondaryColor,
  //     textTheme: GoogleFonts.openSansTextTheme(),
  //   // textTheme: GoogleFonts.poppinsTextTheme(),
  //   visualDensity: VisualDensity.adaptivePlatformDensity,
  // );
}


ThemeData buildDarkTheme() {
   return ThemeData.dark().copyWith(
              scaffoldBackgroundColor: Colors.black,
              backgroundColor: Colors.black,
              bottomAppBarColor: Colors.black,
              primaryColorDark: Colors.black,
              accentColor:Colors.greenAccent[300],
                textTheme: GoogleFonts.openSansTextTheme(),
            );
}
