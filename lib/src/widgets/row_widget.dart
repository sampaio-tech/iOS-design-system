import 'package:flutter/cupertino.dart';

import '../exports.dart';

class RowWidget extends StatelessWidget {
  final String title;
  final String? description;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final bool displayDivider;
  final VoidCallback? onPressed;

  const RowWidget({
    super.key,
    required this.title,
    required this.description,
    required this.displayDivider,
    required this.onPressed,
    this.leftWidget,
    this.rightWidget,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = CupertinoTheme.brightnessOf(context);
    return CupertinoButtonWidget(
      onPressed: onPressed,
      child: AnimatedContainer(
        duration: kAnimationInDuration,
        decoration: BoxDecoration(
          color: switch (brightness) {
            Brightness.light => DefaultSystemBackgroundsColors.primaryLight,
            Brightness.dark =>
              DefaultSystemBackgroundsColors.primaryDarkElevated,
          },
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                title,
                                style: AppTypography.bodyRegular.copyWith(
                                  color: switch (brightness) {
                                    Brightness.light =>
                                      DefaultLabelColors.primaryLight,
                                    Brightness.dark =>
                                      DefaultLabelColors.primaryDark,
                                  },
                                ),
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.visible,
                              ),
                              if (description != null)
                                const SizedBox(height: 2),
                              if (description != null)
                                Text(
                                  description!,
                                  style: AppTypography.caption1Regular.copyWith(
                                    color: switch (brightness) {
                                      Brightness.light =>
                                        DefaultLabelColors.secondaryLight,
                                      Brightness.dark =>
                                        DefaultLabelColors.secondaryDark,
                                    },
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
