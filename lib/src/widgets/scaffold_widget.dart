import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ios_design_system.dart';

class ScaffoldWidget extends StatelessWidget {
  final CupertinoNavigatorBarWidget? navigationBar;
  final ToolBarWidget? toolBar;
  final Widget child;

  const ScaffoldWidget({
    super.key,
    required this.navigationBar,
    required this.toolBar,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = CupertinoTheme.brightnessOf(context);
    final scaffoldBackgroundColor = switch (brightness) {
      Brightness.light => DefaultSystemGroupedBackgroundsColors.primaryLight,
      Brightness.dark => DefaultSystemBackgroundsColors.primaryDarkBase,
    };
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: navigationBar,
      extendBodyBehindAppBar:
          navigationBar?.imageFilter == NavigatorBarImageFilter.enabled,
      extendBody: toolBar?.imageFilter == ToolBarImageFilter.enabled,
      body: child,
      bottomNavigationBar: toolBar,
    );
  }
}
