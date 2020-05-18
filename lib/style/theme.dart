import 'package:flutter/material.dart';

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

TextTheme _buildTextTheme(TextTheme base) {
  return kTextTheme(base )
      .copyWith(
        headline: base.headline
            .copyWith(fontWeight: FontWeight.w500, color: Colors.red),
        title: base.title.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        body2: base.body2.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
        ),
        button: base.button.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      )
      .apply(
        displayColor: kGrey900,
        bodyColor: kGrey900,
      )
      .copyWith(headline: kHeadlineTheme(base).headline.copyWith());
}



ThemeData buildLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    //  primaryColor:
    colorScheme: kColorScheme,
    buttonColor: kTeal400,
    cardColor: Colors.white,
    textSelectionColor: kTeal100,
    errorColor: kErrorRed,
    buttonTheme: const ButtonThemeData(
        colorScheme: kColorScheme,
        textTheme: ButtonTextTheme.normal,
        buttonColor: kDarkBG),
    primaryColorLight: kLightBG,
    primaryIconTheme: _customIconTheme(base.iconTheme),
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
    hintColor: Colors.black26,
    backgroundColor: Colors.white,
    primaryColor: kLightPrimary,
    accentColor: kLightAccent,
    cursorColor: kLightAccent,
    scaffoldBackgroundColor: kLightBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        title: TextStyle(
          color: kDarkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
      iconTheme: IconThemeData(
        color: kLightAccent,
      ),
    ),
  );
}

ThemeData buildDarkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme).apply(
      displayColor: kLightBG,
      bodyColor: kLightBG,
    ),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme).apply(
      displayColor: kLightBG,
      bodyColor: kLightBG,
    ),
    accentTextTheme: _buildTextTheme(base.accentTextTheme).apply(
      displayColor: kLightBG,
      bodyColor: kLightBG,
    ),
    cardColor: kDarkBgLight,
    brightness: Brightness.dark,
    backgroundColor: kDarkBG,
    primaryColor: kDarkBG,
    primaryColorLight: kDarkBgLight,
    accentColor: kDarkAccent,
    scaffoldBackgroundColor: kDarkBG,
    cursorColor: kDarkAccent,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        title: TextStyle(
          color: kDarkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
      iconTheme: IconThemeData(
        color: kDarkAccent,
      ),
    ),
    buttonTheme: ButtonThemeData(
        colorScheme: kColorScheme.copyWith(onPrimary: kLightBG)),
  );
}
