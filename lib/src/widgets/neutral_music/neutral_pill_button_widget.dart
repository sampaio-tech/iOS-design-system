import 'package:flutter/cupertino.dart';

import '../../../ios_design_system.dart';
import 'neutral_decorations_style.dart';

class NeutralPillButtonWidget extends StatelessWidget {
  const NeutralPillButtonWidget({
    super.key,
    this.label,
    this.icon,
    this.onLongPress,
    this.onPressed,
    this.displayCupertinoActivityIndicator = false,
    this.style = const NeutralMusicDecorationsStyle(),
  });

  factory NeutralPillButtonWidget.icon({
    required IconData icon,
    required String? label,
    double iconSize = 16,
    void Function()? onPressed,
    void Function()? onLongPress,
    bool displayCupertinoActivityIndicator = false,
    NeutralDecorationsStyle? style,
  }) => NeutralPillButtonWidget(
    label: label,
    icon: Builder(
      builder: (context) {
        final theme = IosTheme.of(context);
        final decorationsStyle =
            style ?? const NeutralMusicDecorationsStyle();
        if (displayCupertinoActivityIndicator) {
          return CupertinoActivityIndicator(radius: iconSize / 2);
        }
        return Icon(
          icon,
          size: iconSize,
          color: decorationsStyle.titleColor(theme),
        );
      },
    ),
    onPressed: onPressed,
    onLongPress: onLongPress,
    style: style ?? const NeutralMusicDecorationsStyle(),
  );

  final String? label;
  final Widget? icon;
  final void Function()? onPressed;
  final void Function()? onLongPress;
  final bool displayCupertinoActivityIndicator;
  final NeutralDecorationsStyle style;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          child: CupertinoButtonWidget(
            onPressed: switch (displayCupertinoActivityIndicator) {
              false => onPressed,
              true => null,
            },
            onLongPress: switch (displayCupertinoActivityIndicator) {
              false => onLongPress,
              true => null,
            },
            child: Container(
              decoration: style.backgroundPillButton(theme),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                spacing: switch (label != null && icon != null) {
                  true => 8,
                  false => 0,
                },
                mainAxisSize: MainAxisSize.min,
                children: [
                  switch (icon) {
                    null => const SizedBox.shrink(),
                    final icon => icon,
                  },
                  switch (label) {
                    null => const SizedBox.shrink(),
                    final label => Text(
                      label,
                      style: theme.typography.subheadlineBold.copyWith(
                        color: style.titleColor(theme),
                      ),
                    ),
                  },
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

