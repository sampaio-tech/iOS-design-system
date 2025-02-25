import 'package:flutter/cupertino.dart';

import '../exports.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({
    required this.title,
    required this.description,
    required this.displayDivider,
    required this.onPressed,
    required this.leftWidget,
    required this.rightWidget,
    this.contentPadding,
    super.key,
  });

  factory RowWidget.standard({
    required String title,
    required String? description,
    required Widget? leftWidget,
    required Widget? rightWidget,
    required bool displayDivider,
    required VoidCallback? onPressed,
    EdgeInsets? contentPadding,
  }) => RowWidget(
    title:
        (theme) => Text(
          title,
          style: theme.typography.bodyRegular.copyWith(
            color: theme.defaultLabelColors.primary,
          ),
          textAlign: TextAlign.start,
          overflow: TextOverflow.visible,
        ),
    description: switch (description) {
      null => null,
      final description =>
        (theme) => Text(
          description,
          style: theme.typography.caption1Regular.copyWith(
            color: theme.defaultLabelColors.secondary,
          ),
          textAlign: TextAlign.start,
          overflow: TextOverflow.visible,
        ),
    },
    displayDivider: displayDivider,
    onPressed: onPressed,
    leftWidget: leftWidget,
    rightWidget: rightWidget,
    contentPadding: contentPadding,
  );

  final Widget Function(IosThemeData theme) title;
  final Widget Function(IosThemeData theme)? description;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final bool displayDivider;
  final VoidCallback? onPressed;
  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    return CupertinoButtonWidget(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: switch (theme) {
            IosLightThemeData() =>
              theme.defaultSystemBackgroundsColors.primaryLight,
            IosDarkThemeData() =>
              theme.defaultSystemBackgroundsColors.primaryDarkElevated,
          },
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 16),
            if (leftWidget != null) leftWidget ?? const SizedBox.shrink(),
            if (leftWidget != null) const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        contentPadding ??
                        const EdgeInsets.symmetric(
                          vertical: 12,
                        ).copyWith(right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              title(theme),
                              if (description != null)
                                const SizedBox(height: 2),
                              if (description != null)
                                description?.call(theme) ??
                                    const SizedBox.shrink(),
                            ],
                          ),
                        ),
                        if (rightWidget != null) const SizedBox(width: 16),
                        if (rightWidget != null)
                          rightWidget ?? const SizedBox.shrink(),
                      ],
                    ),
                  ),
                  if (displayDivider) const DividerWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
