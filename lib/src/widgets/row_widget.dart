import 'package:flutter/cupertino.dart';

import '../exports.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({
    required this.title,
    required this.description,
    required this.displayDivider,
    required this.onPressed,
    super.key,
    this.leftWidget,
    this.rightWidget,
  });
  final String title;
  final String? description;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final bool displayDivider;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    return CupertinoButtonWidget(
      onPressed: onPressed,
      child: AnimatedContainer(
        duration: kAnimationInDuration,
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
                    padding: const EdgeInsets.symmetric(vertical: 12)
                        .copyWith(right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                title,
                                style: theme.typography.bodyRegular.copyWith(
                                  color: theme.defaultLabelColors.primary,
                                ),
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.visible,
                              ),
                              if (description != null)
                                const SizedBox(height: 2),
                              if (description != null)
                                Text(
                                  description!,
                                  style:
                                      theme.typography.caption1Regular.copyWith(
                                    color: theme.defaultLabelColors.secondary,
                                  ),
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.visible,
                                ),
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
