import 'theme_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  static const String _localeTheme = "localeTheme";

  @override
  Future<bool>  darkTheme() async {
 
    final prefs = await SharedPreferences.getInstance();
    
      final localeTheme = prefs.getBool(_localeTheme);
      if (localeTheme == null) {
        return true;
      }
      return localeTheme;
   
  }

  @override
  Future<void> saveTheme(bool darkTheme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_localeTheme, darkTheme);
  }
}
