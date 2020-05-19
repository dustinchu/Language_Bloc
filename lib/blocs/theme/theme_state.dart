part of 'theme_bloc.dart';

@immutable
abstract class ThemeState extends Equatable {
  const ThemeState();
  @override
  List<Object> get props => [];
}

class ThemeInitial extends ThemeState {}

class ThemeLoad extends ThemeState {
  final bool themeState;
  const ThemeLoad({
    this.themeState,
  });
  @override
  List<Object> get props => [themeState];

  @override
  String toString() => 'PostLoaded {hasReachedMax: $themeState }';
}
