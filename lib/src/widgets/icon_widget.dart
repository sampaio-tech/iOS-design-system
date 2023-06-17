import 'package:flutter/cupertino.dart';

import '../exports.dart';

class IconWidget extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry? borderRadius;
  final Color Function(Brightness)? backgroundColorCallback;
  final Widget? Function(Brightness)? iconCallback;

  const IconWidget._({
    Key? key,
    required this.backgroundColorCallback,
    required this.iconCallback,
    required this.padding,
    required this.borderRadius,
  }) : super(key: key);

  factory IconWidget.background({
    required IconData iconData,
    double iconSize = 20,
    Color Function(Brightness)? backgroundColorCallback,
    Color Function(Brightness)? iconColorCallback,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    Key? key,
  }) =>
      IconWidget._(
        iconCallback: (Brightness brightness) => Icon(
          iconData,
          size: iconSize,
          color: iconColorCallback?.call(brightness) ??
              switch (brightness) {
                Brightness.light => DefaultColors.systemWhiteLight,
                Brightness.dark => DefaultColors.systemWhiteDark,
              },
        ),
        borderRadius: borderRadius ?? BorderRadius.circular(7),
        backgroundColorCallback: backgroundColorCallback ??
            (Brightness brightness) => switch (brightness) {
                  Brightness.light => DefaultColors.systemBlueLight,
                  Brightness.dark => DefaultColors.systemBlueDark,
                },
        padding: padding ?? const EdgeInsets.all(5),
        key: key,
      );

  factory IconWidget.transparentBackground({
    required IconData iconData,
    double iconSize = 26,
    Color Function(Brightness)? iconColorCallback,
    EdgeInsetsGeometry? padding,
    Key? key,
  }) =>
      IconWidget._(
        iconCallback: (Brightness brightness) => Icon(
          iconData,
          size: iconSize,
          color: iconColorCallback?.call(brightness) ??
              switch (brightness) {
                Brightness.light => DefaultColors.systemBlueLight,
                Brightness.dark => DefaultColors.systemBlueDark,
              },
        ),
        borderRadius: null,
        backgroundColorCallback: null,
        padding: padding ?? EdgeInsets.zero,
        key: key,
      );

  factory IconWidget.slideAction({
    required IconData iconData,
    double iconSize = 20,
    Color Function(Brightness)? backgroundColorCallback,
    Color Function(Brightness)? iconColorCallback,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    Key? key,
  }) =>
      IconWidget._(
        iconCallback: (Brightness brightness) => Icon(
          iconData,
          size: iconSize,
          color: iconColorCallback?.call(brightness) ??
              switch (brightness) {
                Brightness.light => DefaultColors.systemWhiteLight,
                Brightness.dark => DefaultColors.systemWhiteDark,
              },
        ),
        borderRadius: borderRadius,
        backgroundColorCallback: backgroundColorCallback ??
            (Brightness brightness) => switch (brightness) {
                  Brightness.light => DefaultColors.systemGray01Light,
                  Brightness.dark => DefaultColors.systemGray01Dark,
                },
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: 26,
              vertical: 12,
            ),
        key: key,
      );

  @override
  Widget build(BuildContext context) {
    final brightness = CupertinoTheme.brightnessOf(context);
    return AnimatedContainer(
      duration: kAnimationInDuration,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColorCallback?.call(brightness),
        borderRadius: borderRadius,
      ),
      child: iconCallback?.call(brightness),
    );
  }
}
