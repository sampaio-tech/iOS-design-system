import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../../ios_design_system.dart';

class ModalSheetWidget extends StatelessWidget {
  const ModalSheetWidget({
    required this.prompt,
    required this.title,
    required this.cupertinoSearchTextFieldWidget,
    super.key,
    this.children,
  });
  final PromptWidget? prompt;
  final ModalTitleWidget? title;
  final List<Widget> Function(BuildContext context)? children;
  final CupertinoSearchTextFieldWidget? cupertinoSearchTextFieldWidget;

  static Future<T?> showModalSheet<T>({
    required BuildContext context,
    required PromptWidget? prompt,
    required ModalTitleWidget? title,
    required CupertinoSearchTextFieldWidget? cupertinoSearchTextFieldWidget,
    bool useRootNavigator = true,
    BarrierFilter barrierFilter = BarrierFilter.disabled,
    Color? barrierColor,
    bool barrierDismissible = true,
    bool semanticsDismissible = false,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
    String barrierLabel = 'Dismiss',
  }) =>
      Navigator.of(context, rootNavigator: useRootNavigator).push<T>(
        CupertinoModalPopupRoute<T>(
          builder: (context) => ModalSheetWidget(
            cupertinoSearchTextFieldWidget: cupertinoSearchTextFieldWidget,
            prompt: prompt,
            title: title,
          ),
          filter: barrierFilter.imageFilter,
          barrierColor: barrierColor ?? barrierFilter.barrierColor,
          barrierDismissible: barrierDismissible,
          semanticsDismissible: semanticsDismissible,
          settings: routeSettings,
          anchorPoint: anchorPoint,
          barrierLabel: barrierLabel,
        ),
      );

  static const kBorderRadius = BorderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(10),
  );

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    final viewInsets = MediaQuery.viewInsetsOf(context);
    return AnimatedContainer(
      duration: kAnimationInDuration,
      decoration: BoxDecoration(
        borderRadius: kBorderRadius,
        color: switch (theme) {
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 4),
            const ResizeIndicatorWidget(),
            if (prompt != null) prompt!,
            if (title != null) title!,
            if (cupertinoSearchTextFieldWidget != null)
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 4,
                  bottom: 13,
                ),
                child: cupertinoSearchTextFieldWidget!,
              ),
            const DividerWidget(),
            if (children != null) ...children!.call(context),
            SizedBox(height: viewInsets.bottom),
          ],
        ),
      ),
    );
  }
}

enum BarrierFilter {
  enabled,
  disabled;

  const BarrierFilter();

  Color get barrierColor => switch (this) {
        BarrierFilter.enabled =>
          const SystemMaterialsBackgroundsColorsDark().thick,
        BarrierFilter.disabled =>
          const SystemMaterialsBackgroundsColorsDark().ultraThin,
      };
  ImageFilter? get imageFilter => switch (this) {
        BarrierFilter.enabled => kImageFilterBlur,
        BarrierFilter.disabled => null,
      };
}
