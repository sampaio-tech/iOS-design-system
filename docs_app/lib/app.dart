import 'package:flutter/cupertino.dart';
import 'package:ios_design_system/ios_design_system.dart';
import 'package:provider/provider.dart';

import 'core/theme/documentation_theme_provider.dart';
import 'pages/home/home_page.dart';
import 'shared/components/documentation_shell.dart';

/// Main documentation application widget
class DocumentationApp extends StatelessWidget {
  const DocumentationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DocumentationThemeProvider(),
      child: Consumer<DocumentationThemeProvider>(
        builder: (context, themeProvider, _) {
          return IosAnimatedTheme(
            data: themeProvider.currentTheme,
            child: CupertinoApp(
              title: 'iOS Design System Documentation',
              theme: CupertinoThemeData(
                brightness: themeProvider.brightness,
              ),
              debugShowCheckedModeBanner: false,
              home: const DocumentationShell(
                currentPath: '/',
                child: HomePage(),
              ),
            ),
          );
        },
      ),
    );
  }
}
