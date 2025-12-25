import 'package:flutter/material.dart';

import '../../../ios_design_system.dart';

class NeutralCircularButtonWidget extends StatelessWidget {
  const NeutralCircularButtonWidget({
    super.key,
    this.icon,
    this.onLongPress,
    this.onPressed,
    this.borderRadius,
    this.style = const NeutralMusicDecorationsStyle(),
  });

  factory NeutralCircularButtonWidget.icon({
    required IconData icon,
    double iconSize = 16,
    void Function()? onPressed,
    void Function()? onLongPress,
    BorderRadius? borderRadius,
    NeutralDecorationsStyle? style,
  }) => NeutralCircularButtonWidget(
    icon: Builder(
      builder: (context) {
        final theme = IosTheme.of(context);
        final decorationsStyle = style ?? const NeutralMusicDecorationsStyle();
        return Icon(
          icon,
          size: iconSize,
          color: decorationsStyle.titleColor(theme),
        );
      },
    ),
    onPressed: onPressed,
    onLongPress: onLongPress,
    borderRadius: borderRadius,
    style: style ?? const NeutralMusicDecorationsStyle(),
  );

  factory NeutralCircularButtonWidget.text({
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
    NeutralDecorationsStyle? style,
  }) => NeutralCircularButtonWidget(
    icon: Builder(
      builder: (context) {
        final theme = IosTheme.of(context);
        final decorationsStyle = style ?? const NeutralMusicDecorationsStyle();
        return ConstrainedBox(
          constraints: constraints,
          child: Center(
            child: Text(
              text,
              style:
                  textStyle ??
                  theme.typography.subheadlineRegular.copyWith(
                    color: decorationsStyle.titleColor(theme),
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
    style: style ?? const NeutralMusicDecorationsStyle(),
  );

  final Widget? icon;
  final void Function()? onPressed;
  final void Function()? onLongPress;
  final BorderRadius? borderRadius;
  final NeutralDecorationsStyle style;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    final button = CupertinoButtonWidget(
      onPressed: onPressed,
      onLongPress: onLongPress,
      child: Container(
        decoration: style.backgroundCircularButton(theme),
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

