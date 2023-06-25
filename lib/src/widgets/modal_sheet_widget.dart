import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../../ios_design_system.dart';

class ModalSheetWidget extends StatelessWidget {
  final PromptWidget? prompt;
  final ModalTitleWidget? title;
  final List<Widget> Function(BuildContext context)? children;
  final CupertinoSearchTextFieldWidget? cupertinoSearchTextFieldWidget;

  const ModalSheetWidget({
    super.key,
    required this.prompt,
    required this.title,
    required this.cupertinoSearchTextFieldWidget,
    this.children,
  });

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
          builder: (BuildContext context) => ModalSheetWidget(
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
    final brightness = CupertinoTheme.brightnessOf(context);
    final viewInsets = MediaQuery.viewInsetsOf(context);
    return AnimatedContainer(
      duration: kAnimationInDuration,
      decoration: BoxDecoration(
        borderRadius: kBorderRadius,
        color: switch (brightness) {
          Brightness.light => DefaultColors.systemWhiteLight,
          Brightness.dark => DefaultSystemBackgroundsColors.secondaryDarkBase,
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
  enabled(
    barrierColor: SystemMaterialsBackgroundsColors.thickDark,
  ),
  disabled(
    barrierColor: SystemMaterialsBackgroundsColors.ultraThinDark,
  ),
  ;

  const BarrierFilter({required this.barrierColor});

  final Color barrierColor;
  ImageFilter? get imageFilter => switch (this) {
        BarrierFilter.enabled => kImageFilterBlur,
        BarrierFilter.disabled => null,
      };
}
