import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../core/theme/documentation_theme_provider.dart';

/// Button to toggle between light and dark themes
class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DocumentationThemeProvider>(
      builder: (context, themeProvider, _) {
        final isLight = themeProvider.brightness == Brightness.light;

        return CupertinoButton(
          padding: const EdgeInsets.all(8),
          onPressed: () => themeProvider.toggleTheme(),
          child: Icon(
            isLight ? CupertinoIcons.moon_fill : CupertinoIcons.sun_max_fill,
            size: 24,
            color: isLight
                ? CupertinoColors.systemGrey
                : CupertinoColors.systemYellow,
          ),
        );
      },
    );
  }
}
