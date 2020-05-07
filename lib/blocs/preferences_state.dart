
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PreferencesState extends Equatable {
  final Locale locale;

  PreferencesState({@required this.locale});

  @override
  List<Object> get props => [locale];
}
