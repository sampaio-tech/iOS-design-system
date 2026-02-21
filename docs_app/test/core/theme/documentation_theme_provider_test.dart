import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter/scheduler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ios_design_system_docs/core/theme/documentation_theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('DocumentationThemeProvider', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    test('initializes with system theme mode by default', () async {
      final provider = DocumentationThemeProvider();

      // Wait for initialization
      await Future.delayed(const Duration(milliseconds: 100));

      expect(provider.themeMode, ThemeMode.system);
      expect(provider.isInitialized, true);
    });

    test('brightness follows system when theme mode is system', () {
      final provider = DocumentationThemeProvider();
      final systemBrightness =
          SchedulerBinding.instance.platformDispatcher.platformBrightness;

      expect(provider.brightness, systemBrightness);
    });

    test('brightness is light when theme mode is light', () async {
      final provider = DocumentationThemeProvider();
      await Future.delayed(const Duration(milliseconds: 100));

      await provider.setThemeMode(ThemeMode.light);

      expect(provider.brightness, Brightness.light);
      expect(provider.isDark, false);
    });

    test('brightness is dark when theme mode is dark', () async {
      final provider = DocumentationThemeProvider();
      await Future.delayed(const Duration(milliseconds: 100));

      await provider.setThemeMode(ThemeMode.dark);

      expect(provider.brightness, Brightness.dark);
      expect(provider.isDark, true);
    });

    test('toggleTheme switches between light and dark', () async {
      final provider = DocumentationThemeProvider();
      await Future.delayed(const Duration(milliseconds: 100));

      // Set to light explicitly
      await provider.setThemeMode(ThemeMode.light);
      expect(provider.brightness, Brightness.light);

      // Toggle to dark
      provider.toggleTheme();
      await Future.delayed(const Duration(milliseconds: 50));
      expect(provider.brightness, Brightness.dark);

      // Toggle back to light
      provider.toggleTheme();
      await Future.delayed(const Duration(milliseconds: 50));
      expect(provider.brightness, Brightness.light);
    });

    test('setTheme by brightness updates theme mode', () async {
      final provider = DocumentationThemeProvider();
      await Future.delayed(const Duration(milliseconds: 100));

      provider.setTheme(Brightness.dark);
      await Future.delayed(const Duration(milliseconds: 50));
      expect(provider.themeMode, ThemeMode.dark);

      provider.setTheme(Brightness.light);
      await Future.delayed(const Duration(milliseconds: 50));
      expect(provider.themeMode, ThemeMode.light);
    });

    test('theme persists using SharedPreferences', () async {
      // Set theme to dark
      final provider1 = DocumentationThemeProvider();
      await Future.delayed(const Duration(milliseconds: 100));
      await provider1.setThemeMode(ThemeMode.dark);

      // Create new provider instance
      final provider2 = DocumentationThemeProvider();
      await Future.delayed(const Duration(milliseconds: 100));

      // Should load dark theme from storage
      expect(provider2.themeMode, ThemeMode.dark);
    });

    test('currentTheme returns correct theme data', () async {
      final provider = DocumentationThemeProvider();
      await Future.delayed(const Duration(milliseconds: 100));

      // Set to light
      await provider.setThemeMode(ThemeMode.light);
      expect(provider.currentTheme.runtimeType.toString(), 'IosLightThemeData');

      // Set to dark
      await provider.setThemeMode(ThemeMode.dark);
      expect(provider.currentTheme.runtimeType.toString(), 'IosDarkThemeData');
    });

    test('notifies listeners when theme changes', () async {
      final provider = DocumentationThemeProvider();
      await Future.delayed(const Duration(milliseconds: 100));

      var notificationCount = 0;
      provider.addListener(() {
        notificationCount++;
      });

      await provider.setThemeMode(ThemeMode.dark);
      expect(notificationCount, 1);

      provider.toggleTheme();
      await Future.delayed(const Duration(milliseconds: 50));
      expect(notificationCount, 2);
    });

    test('setThemeMode does not notify if theme is same', () async {
      final provider = DocumentationThemeProvider();
      await Future.delayed(const Duration(milliseconds: 100));
      await provider.setThemeMode(ThemeMode.light);

      var notificationCount = 0;
      provider.addListener(() {
        notificationCount++;
      });

      // Set to same theme mode
      await provider.setThemeMode(ThemeMode.light);
      expect(notificationCount, 0);
    });
  });
}
