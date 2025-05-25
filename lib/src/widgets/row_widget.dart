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
    this.divider = const DividerWidget(),
    this.decorationCallback,
    this.onLongPress,
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
    required VoidCallback? onLongPress,
    required BoxDecoration Function(IosThemeData theme)? decorationCallback,
    EdgeInsets? contentPadding,
  }) => RowWidget(
    decorationCallback: decorationCallback,
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
    onLongPress: onLongPress,
    leftWidget: leftWidget,
    rightWidget: rightWidget,
    contentPadding: contentPadding,
  );

  factory RowWidget.stocks({
    required String title,
    required String? description,
    required Widget? leftWidget,
    required Widget? rightWidget,
    required bool displayDivider,
    required VoidCallback? onPressed,
    required VoidCallback? onLongPress,
    required BoxDecoration Function(IosThemeData theme)? decorationCallback,
    EdgeInsets? contentPadding,
  }) => RowWidget(
    decorationCallback: decorationCallback,
    title:
        (theme) => Text(
          title,
          style: theme.typography.bodyRegular.copyWith(
            color: theme.stocksDecorations.defaultColors.primary,
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
            color: theme.stocksDecorations.defaultColors.secondary,
          ),
          textAlign: TextAlign.start,
          overflow: TextOverflow.visible,
        ),
    },
    displayDivider: displayDivider,
    onPressed: onPressed,
    onLongPress: onLongPress,
    leftWidget: leftWidget,
    rightWidget: rightWidget,
    contentPadding: contentPadding,
    divider: DividerWidget.stocks,
  );

  final Widget Function(IosThemeData theme) title;
  final Widget Function(IosThemeData theme)? description;
  final BoxDecoration Function(IosThemeData theme)? decorationCallback;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final bool displayDivider;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final EdgeInsets? contentPadding;
  final DividerWidget divider;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    return CupertinoButtonWidget(
      onPressed: onPressed,
      onLongPress: onLongPress,
      child: Container(
        decoration: switch (decorationCallback) {
          null => null,
          final callback => callback(theme),
        },
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (rightWidget is! Flexible)
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                        if (rightWidget is Flexible)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                        if (rightWidget != null) const SizedBox(width: 16),
                        if (rightWidget != null)
                          rightWidget ?? const SizedBox.shrink(),
                      ],
                    ),
                  ),
                  if (displayDivider) divider,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
