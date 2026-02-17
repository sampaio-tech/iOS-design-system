import 'package:flutter/cupertino.dart';
import 'package:ios_design_system/ios_design_system.dart';

import 'documentation_footer.dart';
import 'documentation_header.dart';
import 'navigation_sidebar.dart';

/// Shell component that wraps all documentation pages
/// Provides consistent header, sidebar, and footer across the app
class DocumentationShell extends StatelessWidget {
  final Widget child;
  final String? currentPath;

  const DocumentationShell({
    required this.child,
    this.currentPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);

    return CupertinoPageScaffold(
      backgroundColor: theme.defaultSystemBackgroundsColors.primaryLight,
      child: SafeArea(
        child: Row(
          children: [
            // Sidebar
            NavigationSidebar(currentPath: currentPath),

            // Main content
            Expanded(
              child: Column(
                children: [
                  // Header
                  const DocumentationHeader(),

                  // Content
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: 1200,
                        ),
                        padding: const EdgeInsets.all(40),
                        child: child,
                      ),
                    ),
                  ),

                  // Footer
                  const DocumentationFooter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
