import 'theme_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  static const String _localeTheme = "localeTheme";

  @override
  Future<bool>  darkTheme() async {
    final _prefs = await SharedPreferences.getInstance();
      final localeTheme = _prefs.getBool(_localeTheme);
      if (localeTheme == null) {
        return true;
      }
      return localeTheme;
  }

  @override
  Future<void> saveTheme(bool darkTheme) async {
    final _prefs = await SharedPreferences.getInstance();
    await _prefs.setBool(_localeTheme, darkTheme);
  }
}
