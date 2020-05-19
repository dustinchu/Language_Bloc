import 'package:flutter/material.dart';
import 'package:flutter_form_validation/blocs/theme/theme_bloc.dart';
import 'app.dart';
import 'bloc_Message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/preferences/preferences.dart';
import 'repositories/preferences/preferences_repository_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = BlocMessage();
  final preferencesRepository = PreferencesRepositoryImpl();
  var initLocale = await preferencesRepository.locale;
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (context) => PreferencesBloc(
                preferencesRepository: preferencesRepository,
                initialLocale: initLocale,
              )),
      BlocProvider(create: (context) => ThemeBloc()..add(ThemeLoaded())),
    ],
    child: App(),
  ));
}
