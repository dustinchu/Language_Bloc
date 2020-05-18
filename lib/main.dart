import 'package:flutter/material.dart';
import 'package:flutter_form_validation/blocs/theme/theme_bloc.dart';
import 'bloc_Message.dart';
import 'common/tools.dart';
import 'style/theme.dart';
import 'widgets/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/preferences/preferences.dart';
import 'repositories/preferences/preferences_repository_impl.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = BlocMessage();
  final preferencesRepository = PreferencesRepositoryImpl();

  final preferencesBloc = PreferencesBloc(
    preferencesRepository: preferencesRepository,
    initialLocale: await preferencesRepository.locale,
  );
  final themeBolc = ThemeBloc();
  runApp(
      // BlocProvider(
      //   create: (context) => preferencesBloc,
      //   child: App(),
      // ),
      MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => preferencesBloc),
      BlocProvider(create: (context) => themeBolc..add(ThemeLoaded())),
    ],
    child: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, localState) {
        return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
           ThemeData themeData;
          if (state is ThemeLoad) {
             themeData =state.themeState
                  ? buildDarkTheme().copyWith(
                      primaryColor: HexColor("#3FC1BE"),
                    )
                  : buildLightTheme().copyWith(
                      primaryColor: HexColor(
                      "#3FC1BE",
                    ));
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

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _firstName = 'Giancarlo';

  String _lastName = 'Code';

  int _notifications = 0;

  _resetNotifications() => setState(() => _notifications = 0);

  _incrementNotifications() => setState(() => _notifications++);

  _decrementNotifications() => setState(() {
        if (_notifications > 0) _notifications--;
      });

  @override
  Widget build(BuildContext context) {
    final preferencesBloc = context.bloc<PreferencesBloc>();
    final themeBloc = context.bloc<ThemeBloc>();
    return HomeScaffold(
      cards: <Widget>[
         RaisedButton(
            child: Text("theme"),
            onPressed: () => themeBloc
                .add(ThemeChange())),
        RaisedButton(
            child: Text("en"),
            onPressed: () => preferencesBloc
                .add(ChangeLocale(Locale.fromSubtags(languageCode: 'en')))),
        RaisedButton(
            child: Text("es"),
            onPressed: () => preferencesBloc
                .add(ChangeLocale(Locale.fromSubtags(languageCode: 'es')))),
        TextCard(
          text: S.of(context).simpleText,
        ),
        TextCard(
          text: S.of(context).textWithPlaceholder(_firstName),
        ),
        TextCard(
          text: S.of(context).textWithPlaceholders(_firstName, _lastName),
        ),
        NotificationsCard(
          text: S.of(context).textWithPlural(_notifications),
          onReset: _resetNotifications,
          onDecrement: _decrementNotifications,
          onIncrement: _incrementNotifications,
        ),
      ],
    );
  }
}
