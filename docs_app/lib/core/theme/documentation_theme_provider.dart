import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter/scheduler.dart';
import 'package:ios_design_system/ios_design_system.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Provider for managing the documentation app's theme state with persistence
class DocumentationThemeProvider extends ChangeNotifier {
  static const String _themeKey = 'theme_mode';

  ThemeMode _themeMode = ThemeMode.system;
  SharedPreferences? _prefs;
  bool _isInitialized = false;

  DocumentationThemeProvider() {
    _loadTheme();
  }

  ThemeMode get themeMode => _themeMode;
  bool get isInitialized => _isInitialized;

  /// Get current brightness based on theme mode
  Brightness get brightness {
    if (_themeMode == ThemeMode.system) {
      return SchedulerBinding.instance.platformDispatcher.platformBrightness;
    }
    return _themeMode == ThemeMode.light ? Brightness.light : Brightness.dark;
  }

  /// Get current theme data based on brightness
  IosThemeData get currentTheme {
    return brightness == Brightness.light
        ? IosLightThemeData()
        : IosDarkThemeData();
  }

  bool get isDark => brightness == Brightness.dark;

  /// Load theme from persistent storage
  Future<void> _loadTheme() async {
    _prefs = await SharedPreferences.getInstance();
    final savedTheme = _prefs?.getString(_themeKey);

    if (savedTheme != null) {
      _themeMode = ThemeMode.values.firstWhere(
        (e) => e.toString() == savedTheme,
        orElse: () => ThemeMode.system,
      );
    }

    _isInitialized = true;
    notifyListeners();
  }

  /// Set theme mode and persist it
  Future<void> setThemeMode(ThemeMode mode) async {
    if (_themeMode == mode) return;

    _themeMode = mode;
    await _prefs?.setString(_themeKey, mode.toString());
    notifyListeners();
  }

  /// Toggle between light and dark theme
  void toggleTheme() {
    final newMode = brightness == Brightness.light
        ? ThemeMode.dark
        : ThemeMode.light;
    setThemeMode(newMode);
  }

  /// Set theme explicitly by brightness
  void setTheme(Brightness brightness) {
    final newMode = brightness == Brightness.light
        ? ThemeMode.light
        : ThemeMode.dark;
    setThemeMode(newMode);
  }
}
