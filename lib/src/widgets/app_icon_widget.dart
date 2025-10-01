import 'package:flutter/material.dart';

import '../exports.dart';

class AppIconWidget extends StatelessWidget {
  const AppIconWidget._({
    required this.boxDecorationCallback,
    required this.iconCallback,
    required this.padding,
    required this.borderRadius,
    Key? key,
  }) : super(key: key);

  factory AppIconWidget.widget({
    required Widget child,
    BoxDecoration Function(IosThemeData theme) boxDecorationCallback =
        defaultBoxDecorationCallback,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    Key? key,
  }) => AppIconWidget._(
    iconCallback: (theme) => child,
    borderRadius: borderRadius ?? BorderRadius.circular(7),
    boxDecorationCallback: boxDecorationCallback,
    padding: padding ?? const EdgeInsets.all(5),
    key: key,
  );

  factory AppIconWidget.icon({
    required IconData iconData,
    double iconSize = 20,
    BoxDecoration Function(IosThemeData theme) boxDecorationCallback =
        defaultBoxDecorationCallback,
    Color Function(IosThemeData theme)? iconColorCallback,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    Key? key,
  }) => AppIconWidget._(
    iconCallback:
        (theme) => Builder(
          builder:
              (context) => Icon(
                iconData,
                size: MediaQuery.textScalerOf(context).scale(iconSize),
                color:
                    iconColorCallback?.call(theme) ??
                    switch (theme) {
                      IosLightThemeData() => theme.defaultColors.systemBlack,
                      IosDarkThemeData() => theme.defaultColors.systemWhite,
                    },
              ),
        ),
    borderRadius: borderRadius ?? BorderRadius.circular(7),
    boxDecorationCallback: boxDecorationCallback,
    padding: padding ?? const EdgeInsets.all(5),
    key: key,
  );

  factory AppIconWidget.iconBlue({
    required IconData iconData,
    double iconSize = 20,
    BoxDecoration Function(IosThemeData theme) boxDecorationCallback =
        blueBoxDecorationCallback,
    Color Function(IosThemeData theme)? iconColorCallback,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    Key? key,
  }) => AppIconWidget._(
    iconCallback:
        (theme) => Builder(
          builder:
              (context) => Icon(
                iconData,
                size: MediaQuery.textScalerOf(context).scale(iconSize),
                color:
                    iconColorCallback?.call(theme) ??
                    switch (theme) {
                      IosLightThemeData() => theme.defaultColors.systemWhite,
                      IosDarkThemeData() => theme.defaultColors.systemBlue,
                    },
              ),
        ),
    borderRadius: borderRadius ?? BorderRadius.circular(7),
    boxDecorationCallback: boxDecorationCallback,
    padding: padding ?? const EdgeInsets.all(5),
    key: key,
  );

  factory AppIconWidget.iconOrange({
    required IconData iconData,
    double iconSize = 20,
    BoxDecoration Function(IosThemeData theme) boxDecorationCallback =
        orangeBoxDecorationCallback,
    Color Function(IosThemeData theme)? iconColorCallback,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    Key? key,
  }) => AppIconWidget._(
    iconCallback:
        (theme) => Builder(
          builder:
              (context) => Icon(
                iconData,
                size: MediaQuery.textScalerOf(context).scale(iconSize),
                color:
                    iconColorCallback?.call(theme) ??
                    switch (theme) {
                      IosLightThemeData() => theme.defaultColors.systemWhite,
                      IosDarkThemeData() => theme.defaultColors.systemOrange,
                    },
              ),
        ),
    borderRadius: borderRadius ?? BorderRadius.circular(7),
    boxDecorationCallback: boxDecorationCallback,
    padding: padding ?? const EdgeInsets.all(5),
    key: key,
  );

  factory AppIconWidget.iconRed({
    required IconData iconData,
    double iconSize = 20,
    BoxDecoration Function(IosThemeData theme) boxDecorationCallback =
        redBoxDecorationCallback,
    Color Function(IosThemeData theme)? iconColorCallback,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    Key? key,
  }) => AppIconWidget._(
    iconCallback:
        (theme) => Builder(
          builder:
              (context) => Icon(
                iconData,
                size: MediaQuery.textScalerOf(context).scale(iconSize),
                color:
                    iconColorCallback?.call(theme) ??
                    switch (theme) {
                      IosLightThemeData() => theme.defaultColors.systemWhite,
                      IosDarkThemeData() => theme.defaultColors.systemRed,
                    },
              ),
        ),
    borderRadius: borderRadius ?? BorderRadius.circular(7),
    boxDecorationCallback: boxDecorationCallback,
    padding: padding ?? const EdgeInsets.all(5),
    key: key,
  );

  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry? borderRadius;
  final BoxDecoration Function(IosThemeData theme) boxDecorationCallback;
  final Widget? Function(IosThemeData theme)? iconCallback;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    return Container(
      padding: padding,
      decoration: boxDecorationCallback(
        theme,
      ).copyWith(borderRadius: borderRadius),
      child: iconCallback?.call(theme),
    );
  }
}

BoxDecoration defaultBoxDecorationCallback(IosThemeData theme) {
  const borderSide = BorderSide(
    strokeAlign: BorderSide.strokeAlignCenter,
    color: const Color(0xFF605F64),
    width: .3,
  );
  return switch (theme) {
    IosLightThemeData() => const BoxDecoration(
      color: Colors.white,
      border: Border(
        bottom: borderSide,
        top: borderSide,
        left: borderSide,
        right: borderSide,
      ),
    ),
    IosDarkThemeData() => const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFF303030), Color(0xFF151615)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      border: Border(
        bottom: borderSide,
        top: borderSide,
        left: borderSide,
        right: borderSide,
      ),
    ),
  };
}

BoxDecoration blueBoxDecorationCallback(IosThemeData theme) {
  const borderSide = BorderSide(
    strokeAlign: BorderSide.strokeAlignCenter,
    color: const Color(0xFF605F64),
    width: .3,
  );
  return switch (theme) {
    IosLightThemeData() => BoxDecoration(
      color: theme.defaultColors.systemBlue,
      border: const Border(
        bottom: borderSide,
        top: borderSide,
        left: borderSide,
        right: borderSide,
      ),
    ),
    IosDarkThemeData() => const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFF303030), Color(0xFF151615)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      border: Border(
        bottom: borderSide,
        top: borderSide,
        left: borderSide,
        right: borderSide,
      ),
    ),
  };
}

BoxDecoration redBoxDecorationCallback(IosThemeData theme) {
  const borderSide = BorderSide(
    strokeAlign: BorderSide.strokeAlignCenter,
    color: const Color(0xFF605F64),
    width: .3,
  );
  return switch (theme) {
    IosLightThemeData() => BoxDecoration(
      color: theme.defaultColors.systemRed,
      border: const Border(
        bottom: borderSide,
        top: borderSide,
        left: borderSide,
        right: borderSide,
      ),
    ),
    IosDarkThemeData() => const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFF303030), Color(0xFF151615)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      border: Border(
        bottom: borderSide,
        top: borderSide,
        left: borderSide,
        right: borderSide,
      ),
    ),
  };
}

BoxDecoration orangeBoxDecorationCallback(IosThemeData theme) {
  const borderSide = BorderSide(
    strokeAlign: BorderSide.strokeAlignCenter,
    color: const Color(0xFF605F64),
    width: .3,
  );
  return switch (theme) {
    IosLightThemeData() => BoxDecoration(
      color: theme.defaultColors.systemOrange,
      border: const Border(
        bottom: borderSide,
        top: borderSide,
        left: borderSide,
        right: borderSide,
      ),
    ),
    IosDarkThemeData() => const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFF303030), Color(0xFF151615)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      border: Border(
        bottom: borderSide,
        top: borderSide,
        left: borderSide,
        right: borderSide,
      ),
    ),
  };
}
