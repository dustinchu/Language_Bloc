
abstract class ThemeRepository {
  Future<void> saveTheme(bool darkTheme);

  Future<bool>  darkTheme();
}
