import 'package:flutter/material.dart';

import '../../../ios_design_system.dart';

class NeutralMusicCircularButtonWidget extends StatelessWidget {
  const NeutralMusicCircularButtonWidget({
    super.key,
    this.icon,
    this.onLongPress,
    this.onPressed,
    this.borderRadius,
  });

  factory NeutralMusicCircularButtonWidget.icon({
    required IconData icon,
    double iconSize = 16,
    void Function()? onPressed,
    void Function()? onLongPress,
    BorderRadius? borderRadius,
  }) => NeutralMusicCircularButtonWidget(
    icon: Builder(
      builder: (context) {
        final theme = IosTheme.of(context);
        return Icon(
          icon,
          size: iconSize,
          color: theme.neutralMusicDecorations.defaultColors.title,
        );
      },
    ),
    onPressed: onPressed,
    onLongPress: onLongPress,
    borderRadius: borderRadius,
  );

  factory NeutralMusicCircularButtonWidget.text({
    required String text,
    TextStyle? textStyle,
    void Function()? onPressed,
    void Function()? onLongPress,
    BorderRadius? borderRadius,
    TextScaler? textScaler,
    BoxConstraints constraints = const BoxConstraints(
      minHeight: 16,
      minWidth: 16,
    ),
  }) => NeutralMusicCircularButtonWidget(
    icon: Builder(
      builder: (context) {
        final theme = IosTheme.of(context);
        return ConstrainedBox(
          constraints: constraints,
          child: Center(
            child: Text(
              text,
              style:
                  textStyle ??
                  theme.typography.subheadlineRegular.copyWith(
                    color: theme.neutralMusicDecorations.defaultColors.title,
                  ),
              textScaler: textScaler,
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    ),
    onPressed: onPressed,
    onLongPress: onLongPress,
    borderRadius: borderRadius,
  );

  final Widget? icon;
  final void Function()? onPressed;
  final void Function()? onLongPress;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    final button = CupertinoButtonWidget(
      onPressed: onPressed,
      onLongPress: onLongPress,
      child: Container(
        decoration:
            theme.neutralMusicDecorations.gradients.backgroundCircularButton,
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            switch (icon) {
              null => const SizedBox.shrink(),
              final icon => icon,
            },
          ],
        ),
      ),
    );
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        switch (borderRadius) {
          null => ClipOval(child: button),
          final borderRadius => ClipRRect(
            borderRadius: borderRadius,
            child: button,
          ),
        },
      ],
    );
  }
}
