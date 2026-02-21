import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter_test/flutter_test.dart';
import 'package:ios_design_system/ios_design_system.dart';
import 'package:ios_design_system_docs/core/theme/documentation_theme_provider.dart';
import 'package:ios_design_system_docs/shared/components/theme_toggle_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ThemeToggleButton', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    Widget buildTestWidget(DocumentationThemeProvider provider) {
      return ChangeNotifierProvider.value(
        value: provider,
        child: CupertinoApp(
          home: IosAnimatedTheme(
            data: provider.currentTheme,
            child: const CupertinoPageScaffold(
              child: Center(
                child: ThemeToggleButton(),
              ),
            ),
          ),
        ),
      );
    }

    testWidgets('displays moon icon in light mode', (tester) async {
      final provider = DocumentationThemeProvider();
      await Future.delayed(const Duration(milliseconds: 100));
      await provider.setThemeMode(ThemeMode.light);

      await tester.pumpWidget(buildTestWidget(provider));
      await tester.pumpAndSettle();

      expect(find.byIcon(CupertinoIcons.moon_fill), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.sun_max_fill), findsNothing);
    });

    testWidgets('displays sun icon in dark mode', (tester) async {
      final provider = DocumentationThemeProvider();
      await Future.delayed(const Duration(milliseconds: 100));
      await provider.setThemeMode(ThemeMode.dark);

      await tester.pumpWidget(buildTestWidget(provider));
      await tester.pumpAndSettle();

      expect(find.byIcon(CupertinoIcons.sun_max_fill), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.moon_fill), findsNothing);
    });

    testWidgets('toggles theme when tapped', (tester) async {
      final provider = DocumentationThemeProvider();
      await Future.delayed(const Duration(milliseconds: 100));
      await provider.setThemeMode(ThemeMode.light);

      await tester.pumpWidget(buildTestWidget(provider));
      await tester.pumpAndSettle();

      // Verify light mode
      expect(provider.brightness, Brightness.light);
      expect(find.byIcon(CupertinoIcons.moon_fill), findsOneWidget);

      // Tap to toggle
      await tester.tap(find.byType(ThemeToggleButton));
      await tester.pumpAndSettle();

      // Verify dark mode
      expect(provider.brightness, Brightness.dark);
      expect(find.byIcon(CupertinoIcons.sun_max_fill), findsOneWidget);

      // Tap again to toggle back
      await tester.tap(find.byType(ThemeToggleButton));
      await tester.pumpAndSettle();

      // Verify light mode again
      expect(provider.brightness, Brightness.light);
      expect(find.byIcon(CupertinoIcons.moon_fill), findsOneWidget);
    });

    testWidgets('is a tappable button', (tester) async {
      final provider = DocumentationThemeProvider();
      await Future.delayed(const Duration(milliseconds: 100));

      await tester.pumpWidget(buildTestWidget(provider));
      await tester.pumpAndSettle();

      expect(find.byType(CupertinoButton), findsOneWidget);
    });
  });
}
