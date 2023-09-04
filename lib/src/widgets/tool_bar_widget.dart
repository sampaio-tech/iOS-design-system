import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../../ios_design_system.dart';

class ToolBarWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final ToolBarImageFilter imageFilter;
  const ToolBarWidget({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
    this.imageFilter = ToolBarImageFilter.disabled,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = CupertinoTheme.brightnessOf(context);
    return AnimatedContainer(
      duration: kAnimationInDuration,
      decoration: BoxDecoration(
        color: imageFilter.backgroundColor(brightness: brightness),
      ),
      child: switch (imageFilter) {
        ToolBarImageFilter.enabled => ClipRect(
            child: BackdropFilter(
              filter: kImageFilterBlur,
              child: _ToolBarWidget(padding: padding, child: child),
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
  final Widget child;
  final EdgeInsets padding;
  const _ToolBarWidget({
    Key? key,
    required this.child,
    required this.padding,
  }) : super(key: key);

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
          Padding(padding: padding, child: child),
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
    required Brightness brightness,
  }) =>
      switch (brightness) {
        Brightness.light => DefaultSystemBackgroundsColors.primaryLight,
        Brightness.dark => DefaultSystemBackgroundsColors.primaryDarkElevated,
      }
          .withOpacity(backgroundOpacity);
}
