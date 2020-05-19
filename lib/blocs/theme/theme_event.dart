part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent extends Equatable {
   @override
  List<Object> get props => [];
}

class ThemeLoaded extends ThemeEvent {}

class ThemeChange extends ThemeEvent{}