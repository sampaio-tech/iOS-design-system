import 'package:flutter/cupertino.dart';

import '../exports.dart';

class IconWidget extends StatelessWidget {
  const IconWidget._({
    required this.backgroundColorCallback,
    required this.iconCallback,
    required this.padding,
    required this.borderRadius,
    Key? key,
  }) : super(key: key);

  factory IconWidget.background({
    required IconData iconData,
    double iconSize = 20,
    Color Function(
      IosThemeData theme,
    )? backgroundColorCallback,
    Color Function(
      IosThemeData theme,
    )? iconColorCallback,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    Key? key,
  }) =>
      IconWidget._(
        iconCallback: (theme) => Builder(
          builder: (context) => Icon(
            iconData,
            size: MediaQuery.textScalerOf(context).scale(iconSize),
            color: iconColorCallback?.call(theme) ??
                theme.defaultColors.systemWhite,
          ),
        ),
        borderRadius: borderRadius ?? BorderRadius.circular(7),
        backgroundColorCallback: backgroundColorCallback ??
            (IosThemeData theme) => theme.defaultColors.systemBlue,
        padding: padding ?? const EdgeInsets.all(5),
        key: key,
      );

  factory IconWidget.transparentBackground({
    required IconData iconData,
    double iconSize = 26,
    Color Function(
      IosThemeData theme,
    )? iconColorCallback,
    EdgeInsetsGeometry? padding,
    Key? key,
  }) =>
      IconWidget._(
        iconCallback: (theme) => Builder(
          builder: (context) => Icon(
            iconData,
            size: MediaQuery.textScalerOf(context).scale(iconSize),
            color: iconColorCallback?.call(theme) ??
                theme.defaultColors.systemBlue,
          ),
        ),
        borderRadius: null,
        backgroundColorCallback: null,
        padding: padding ?? EdgeInsets.zero,
        key: key,
      );

  factory IconWidget.slideAction({
    required IconData iconData,
    double iconSize = 20,
    Color Function(
      IosThemeData theme,
    )? backgroundColorCallback,
    Color Function(
      IosThemeData theme,
    )? iconColorCallback,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    Key? key,
  }) =>
      IconWidget._(
        iconCallback: (theme) => Builder(
          builder: (context) => Icon(
            iconData,
            size: MediaQuery.textScalerOf(context).scale(iconSize),
            color: iconColorCallback?.call(theme) ??
                theme.defaultColors.systemWhite,
          ),
        ),
        borderRadius: borderRadius,
        backgroundColorCallback: backgroundColorCallback ??
            (IosThemeData theme) => theme.defaultColors.systemGray01,
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: 26,
              vertical: 12,
            ),
        key: key,
      );

  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry? borderRadius;
  final Color Function(
    IosThemeData theme,
  )? backgroundColorCallback;
  final Widget? Function(
    IosThemeData theme,
  )? iconCallback;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColorCallback?.call(theme),
        borderRadius: borderRadius,
      ),
      child: iconCallback?.call(theme),
    );
  }
}
