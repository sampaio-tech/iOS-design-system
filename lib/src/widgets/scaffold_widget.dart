import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../ios_design_system.dart';

class ScaffoldWidget extends StatelessWidget {
  const ScaffoldWidget({
    required this.navigationBar,
    required this.toolBar,
    required this.child,
    super.key,
  });
  final CupertinoNavigatorBarWidget? navigationBar;
  final ToolBarWidget? toolBar;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    final scaffoldBackgroundColor = switch (theme) {
      IosLightThemeData() =>
        theme.defaultSystemGroupedBackgroundsColors.primaryLight,
      IosDarkThemeData() =>
        theme.defaultSystemBackgroundsColors.primaryDarkBase,
    };
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: switch (theme) {
        IosLightThemeData() => SystemUiOverlayStyle.light,
        IosDarkThemeData() => SystemUiOverlayStyle.dark,
      },
      child: Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        appBar: navigationBar,
        extendBodyBehindAppBar:
            navigationBar?.imageFilter == NavigatorBarImageFilter.enabled,
        extendBody: toolBar?.imageFilter == ToolBarImageFilter.enabled,
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: child,
        ),
        bottomNavigationBar: switch (toolBar) {
          null => null,
          final toolBar => GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: toolBar,
            ),
        },
      ),
    );
  }
}
