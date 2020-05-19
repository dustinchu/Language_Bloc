import 'package:flutter/material.dart';
import 'package:flutter_form_validation/blocs/theme/theme_bloc.dart';
import 'HomePage.dart';
import 'style/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/preferences/preferences.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, localState) {
        return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
          ThemeData themeData;
          if (state is ThemeLoad) {
            themeData = state.themeState ? buildDarkTheme() : buildLightTheme();
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeData,
            home: HomePage(),
            title: 'Flutter Intl Example',
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              S.delegate,
              LocaleNamesLocalizationsDelegate(),
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: localState.locale,
          );
        });
      },
    );
  }
}
