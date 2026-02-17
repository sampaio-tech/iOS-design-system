import 'package:flutter/cupertino.dart';
import 'package:ios_design_system/ios_design_system.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/theme/documentation_theme_provider.dart';

/// Header component for the documentation website
class DocumentationHeader extends StatelessWidget {
  const DocumentationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    final themeProvider = context.watch<DocumentationThemeProvider>();

    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: theme.defaultSystemBackgroundsColors.primaryLight,
        border: Border(
          bottom: BorderSide(
            color: theme.defaultSeparatorColors.opaque,
            width: 0.5,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            // Logo and title
            Row(
              children: [
                Icon(
                  CupertinoIcons.cube_box_fill,
                  size: 28,
                  color: theme.defaultColors.systemBlue,
                ),
                const SizedBox(width: 12),
                Text(
                  'iOS Design System',
                  style: theme.typography.title3Bold.copyWith(
                    color: theme.defaultLabelColors.primary,
                  ),
                ),
              ],
            ),

            const Spacer(),

            // Theme toggle button
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: themeProvider.toggleTheme,
              child: Icon(
                themeProvider.isDark
                    ? CupertinoIcons.sun_max_fill
                    : CupertinoIcons.moon_fill,
                size: 22,
                color: theme.defaultLabelColors.primary,
              ),
            ),

            const SizedBox(width: 8),

            // GitHub link
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                launchUrl(
                  Uri.parse(
                    'https://github.com/pedrohsampaioo/ios_design_system',
                  ),
                  mode: LaunchMode.externalApplication,
                );
              },
              child: Icon(
                CupertinoIcons.link,
                size: 22,
                color: theme.defaultLabelColors.primary,
              ),
            ),

            const SizedBox(width: 8),

            // Search button (placeholder)
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                // TODO: Implement search functionality
              },
              child: Icon(
                CupertinoIcons.search,
                size: 22,
                color: theme.defaultLabelColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
