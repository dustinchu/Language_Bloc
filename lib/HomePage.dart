import 'package:flutter/material.dart';
import 'package:flutter_form_validation/blocs/theme/theme_bloc.dart';
import 'widgets/widgets.dart';
import 'generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/preferences/preferences.dart';
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
    return HomeScaffold(
      cards: <Widget>[
         RaisedButton(
            child: Text("theme"),
            onPressed: () => context.bloc<ThemeBloc>()
                .add(ThemeChange())),
        RaisedButton(
            child: Text("en"),
            onPressed: () => context.bloc<PreferencesBloc>()
                .add(ChangeLocale(Locale.fromSubtags(languageCode: 'en')))),
        RaisedButton(
            child: Text("es"),
            onPressed: () => context.bloc<PreferencesBloc>()
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
