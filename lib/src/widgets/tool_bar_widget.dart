import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../../ios_design_system.dart';

class ToolBarWidget extends StatelessWidget {
  const ToolBarWidget({
    required this.child,
    super.key,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 5,
    ),
    this.imageFilter = ToolBarImageFilter.disabled,
  });
  final Widget child;
  final EdgeInsets padding;
  final ToolBarImageFilter imageFilter;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: imageFilter.backgroundColor(
          context: context,
        ),
      ),
      child: switch (imageFilter) {
        ToolBarImageFilter.enabled => ClipRect(
            child: BackdropFilter(
              filter: kImageFilterBlur,
              child: _ToolBarWidget(
                padding: padding,
                child: child,
              ),
            ),
          ),
        ToolBarImageFilter.disabled => _ToolBarWidget(
            padding: padding,
            child: child,
          ),
      },
    );
  }
}

class _ToolBarWidget extends StatelessWidget {
  const _ToolBarWidget({
    required this.child,
    required this.padding,
    Key? key,
  }) : super(key: key);
  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      maintainBottomViewPadding: true,
      minimum: kMinimumSafeAreaPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const DividerWidget(),
          Padding(
            padding: padding,
            child: child,
          ),
        ],
      ),
    );
  }
}

enum ToolBarImageFilter {
  enabled,
  disabled;

  const ToolBarImageFilter();

  ImageFilter? get imageFilter => switch (this) {
        ToolBarImageFilter.enabled => kImageFilterBlur,
        ToolBarImageFilter.disabled => null,
      };

  double get backgroundOpacity => switch (this) {
        ToolBarImageFilter.enabled => .8,
        ToolBarImageFilter.disabled => 1,
      };

  Color backgroundColor({
    required BuildContext context,
  }) {
    final theme = IosTheme.of(context);
    return switch (theme) {
      IosLightThemeData() => theme.defaultSystemBackgroundsColors.primaryLight,
      IosDarkThemeData() =>
        theme.defaultSystemBackgroundsColors.primaryDarkElevated,
    }
        .withValues(alpha: backgroundOpacity);
  }
}
