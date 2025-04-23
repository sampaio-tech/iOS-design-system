import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../../ios_design_system.dart';

Color scaffoldBackgroundColorCallback01(IosThemeData theme) => switch (theme) {
  IosLightThemeData() =>
    theme.defaultSystemGroupedBackgroundsColors.primaryLight,
  IosDarkThemeData() => theme.defaultSystemBackgroundsColors.primaryDarkBase,
};

class CupertinoSheetWidget extends StatelessWidget {
  const CupertinoSheetWidget({
    required this.title,
    super.key,
    this.children,
    this.colorCallback,
    this.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(10),
      topRight: Radius.circular(10),
    ),
  });

  final Widget? title;
  final List<Widget> Function(BuildContext context)? children;
  final BorderRadius borderRadius;
  final Color? Function(IosThemeData theme)? colorCallback;

  static Future<T?> showModalSheet<T>({
    required BuildContext context,
    required Widget? title,
    required List<Widget> Function(BuildContext context)? children,
    Color? Function(IosThemeData theme)? colorCallback,
    bool useNestedNavigation = false,
  }) => showCupertinoSheet<T>(
    context: context,
    pageBuilder:
        (context) => CupertinoSheetWidget(
          title: title,
          children: children,
          colorCallback: colorCallback,
        ),
    useNestedNavigation: useNestedNavigation,
  );

  static Future<T?> showCupertinoModalSheet<T>({
    required BuildContext context,
    required Widget? title,
    required List<Widget> Function(BuildContext context)? children,
    Color? Function(IosThemeData theme)? colorCallback,
    ImageFilter? filter,
    Color barrierColor = kCupertinoModalBarrierColor,
    bool barrierDismissible = true,
    bool useRootNavigator = true,
    bool semanticsDismissible = false,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
  }) => showCupertinoModalPopup<T>(
    context: context,
    builder:
        (context) => Column(
          children: [
            SafeArea(bottom: false, child: Container()),
            Expanded(
              child: CupertinoSheetWidget(
                title: title,
                children: children,
                colorCallback: colorCallback,
              ),
            ),
          ],
        ),
    filter: filter,
    barrierColor: barrierColor,
    barrierDismissible: barrierDismissible,
    semanticsDismissible: semanticsDismissible,
    routeSettings: routeSettings,
    anchorPoint: anchorPoint,
  );

  static Future<T?> showStandardModalSheet<T>({
    required BuildContext context,
    required String title,
    required List<Widget> Function(BuildContext context)? children,
    Widget? leading,
    Widget? separator = const DividerWidget(),
    bool useNestedNavigation = false,
  }) => showModalSheet<T>(
    context: context,
    title: TitleSheetWidget.standard(
      title: title,
      separator: separator,
      leading: leading,
    ),
    children: children,
    useNestedNavigation: useNestedNavigation,
  );

  static Future<T?> showCupertinoModalSheetApplePayModalSheet01<T>({
    required BuildContext context,
    required String title,
    required List<Widget> Function(BuildContext context)? children,
    Widget? leading,
    Widget? separator = DividerWidget.applePay,
    ImageFilter? filter,
    Color barrierColor = kCupertinoModalBarrierColor,
    bool barrierDismissible = true,
    bool useRootNavigator = true,
    bool semanticsDismissible = false,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
  }) => showCupertinoModalSheet<T>(
    context: context,
    title: TitleSheetWidget.applePay01(
      title: title,
      separator: separator,
      leading: leading,
    ),
    children: children,
    filter: filter,
    barrierColor: barrierColor,
    barrierDismissible: barrierDismissible,
    semanticsDismissible: semanticsDismissible,
    routeSettings: routeSettings,
    anchorPoint: anchorPoint,
    colorCallback: applePlayBackgroundColorCallback01,
  );

  static Future<T?> showCupertinoModalSheetApplePayModalSheet02<T>({
    required BuildContext context,
    required String title,
    required List<Widget> Function(BuildContext context)? children,
    Widget? leading,
    Widget? separator = DividerWidget.applePay,
    ImageFilter? filter,
    Color barrierColor = kCupertinoModalBarrierColor,
    bool barrierDismissible = true,
    bool useRootNavigator = true,
    bool semanticsDismissible = false,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
  }) => showCupertinoModalSheet<T>(
    context: context,
    title: TitleSheetWidget.applePay02(
      title: title,
      separator: separator,
      leading: leading,
    ),
    children: children,
    filter: filter,
    barrierColor: barrierColor,
    barrierDismissible: barrierDismissible,
    semanticsDismissible: semanticsDismissible,
    routeSettings: routeSettings,
    anchorPoint: anchorPoint,
    colorCallback: applePlayBackgroundColorCallback01,
  );

  static Future<T?> showApplePayModalSheet01<T>({
    required BuildContext context,
    required String title,
    required List<Widget> Function(BuildContext context)? children,
    Widget? leading,
    Widget? separator = DividerWidget.applePay,
    ImageFilter? filter,
    Color barrierColor = kCupertinoModalBarrierColor,
    bool barrierDismissible = true,
    bool useRootNavigator = true,
    bool semanticsDismissible = false,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
  }) => showCupertinoModalSheet<T>(
    context: context,
    title: TitleSheetWidget.applePay01(
      title: title,
      separator: separator,
      leading: leading,
    ),
    children: children,
    filter: filter,
    barrierColor: barrierColor,
    barrierDismissible: barrierDismissible,
    semanticsDismissible: semanticsDismissible,
    routeSettings: routeSettings,
    anchorPoint: anchorPoint,
    colorCallback: applePlayBackgroundColorCallback01,
  );

  static Future<T?> showApplePayModalSheet02<T>({
    required BuildContext context,
    required String title,
    required List<Widget> Function(BuildContext context)? children,
    Widget? leading,
    Widget? separator = DividerWidget.applePay,
    bool useNestedNavigation = false,
  }) => showModalSheet<T>(
    context: context,
    title: TitleSheetWidget.applePay02(
      title: title,
      separator: separator,
      leading: leading,
    ),
    children: children,
    useNestedNavigation: useNestedNavigation,
    colorCallback: applePlayBackgroundColorCallback01,
  );

  static ViewPadding safeArea(BuildContext context) => View.of(context).padding;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color:
            colorCallback?.call(theme) ??
            switch (theme) {
              IosLightThemeData() => theme.defaultColors.systemWhite,
              IosDarkThemeData() =>
                theme.defaultSystemBackgroundsColors.secondaryDarkBase,
            },
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          title ?? const SizedBox.shrink(),
          if (children != null) ...(children?.call(context) ?? []),
        ],
      ),
    );
  }
}
