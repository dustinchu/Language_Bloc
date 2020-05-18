import 'dart:ui';

import 'package:equatable/equatable.dart';

abstract class PreferencesEvent extends Equatable {}

class ChangeLocale extends PreferencesEvent {
  final Locale locale;

  ChangeLocale(this.locale);

  @override
  List<Object> get props => [locale];
}
