import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../repositories/theme/theme_repository_impl.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeRepositoryImpl _themeRepositoryImpl;
  @override
  ThemeState get initialState => ThemeInitial();

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ThemeChange) {
      try {
        final themeState = state;
        if (themeState is ThemeLoad) {
          await _themeRepositoryImpl.saveTheme(!themeState.themeState);
          yield ThemeLoad(themeState: !themeState.themeState);
        }
      } catch (_) {
        print("ERROR${_}");
        yield ThemeLoad(themeState: true);
      }
    }
    if (event is ThemeLoaded) {
      try {
        final state = await _themeRepositoryImpl.darkTheme();
        yield ThemeLoad(themeState: state);
      } catch (_) {
        yield ThemeLoad(themeState: false);
      }
    }
  }
}
