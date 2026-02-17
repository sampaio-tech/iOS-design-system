import 'package:flutter/cupertino.dart';
import 'package:ios_design_system/ios_design_system.dart';

/// Provider for managing the documentation app's theme state
class DocumentationThemeProvider extends ChangeNotifier {
  IosThemeData _currentTheme = IosLightThemeData();
  Brightness _brightness = Brightness.light;

  IosThemeData get currentTheme => _currentTheme;
  Brightness get brightness => _brightness;
  bool get isDark => _brightness == Brightness.dark;

  /// Toggles between light and dark theme
  void toggleTheme() {
    if (_brightness == Brightness.light) {
      _brightness = Brightness.dark;
      _currentTheme = IosDarkThemeData();
    } else {
      _brightness = Brightness.light;
      _currentTheme = IosLightThemeData();
    }
    notifyListeners();
  }

  /// Sets the theme explicitly
  void setTheme(Brightness brightness) {
    if (_brightness == brightness) return;

    _brightness = brightness;
    _currentTheme = brightness == Brightness.light
        ? IosLightThemeData()
        : IosDarkThemeData();
    notifyListeners();
  }
}
