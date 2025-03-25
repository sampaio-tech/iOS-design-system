import 'package:flutter/cupertino.dart';

import '../../ios_design_system.dart';

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

  static Future<T?> showApplePayModalSheet01<T>({
    required BuildContext context,
    required String title,
    required List<Widget> Function(BuildContext context)? children,
    Widget? leading,
    Widget? separator = DividerWidget.applePay,
    bool useNestedNavigation = false,
  }) => showModalSheet<T>(
    context: context,
    title: TitleSheetWidget.applePay01(
      title: title,
      separator: separator,
      leading: leading,
    ),
    children: children,
    useNestedNavigation: useNestedNavigation,
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

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    final viewInsets = MediaQuery.viewInsetsOf(context);
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
      child: SafeArea(
        top: false,
        maintainBottomViewPadding: true,
        minimum: kMinimumSafeAreaPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            title ?? const SizedBox.shrink(),
            if (children != null) ...(children?.call(context) ?? []),
            SizedBox(height: viewInsets.bottom),
          ],
        ),
      ),
    );
  }
}
