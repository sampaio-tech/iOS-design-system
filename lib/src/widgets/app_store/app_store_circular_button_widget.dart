import 'package:flutter/material.dart';

import '../../../ios_design_system.dart';

class AppStoreCircularButtonWidget extends StatelessWidget {
  const AppStoreCircularButtonWidget({
    super.key,
    this.icon,
    this.onLongPress,
    this.onPressed,
    this.borderRadius,
  });

  factory AppStoreCircularButtonWidget.icon({
    required IconData icon,
    double iconSize = 16,
    void Function()? onPressed,
    void Function()? onLongPress,
    BorderRadius? borderRadius,
  }) => AppStoreCircularButtonWidget(
    icon: Builder(
      builder: (context) {
        final theme = IosTheme.of(context);
        return Icon(
          icon,
          size: iconSize,
          color: theme.appStoreDecorations.defaultColors.baseWhite,
        );
      },
    ),
    onPressed: onPressed,
    onLongPress: onLongPress,
    borderRadius: borderRadius,
  );

  factory AppStoreCircularButtonWidget.text({
    required String text,
    TextStyle? textStyle,
    void Function()? onPressed,
    void Function()? onLongPress,
    BorderRadius? borderRadius,
  }) => AppStoreCircularButtonWidget(
    icon: Builder(
      builder: (context) {
        final theme = IosTheme.of(context);
        return Text(
          text,
          style:
              textStyle ??
              theme.typography.subheadlineRegular.copyWith(
                color: theme.appStoreDecorations.defaultColors.baseWhite,
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
    final borderSide = BorderSide(
      color: theme.appStoreDecorations.defaultColors.backgroundOverlayStroke,
    );
    final button = CupertinoButtonWidget(
      onPressed: onPressed,
      onLongPress: onLongPress,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: borderSide,
            top: borderSide,
            left: borderSide,
            right: borderSide,
          ),
          color: theme.appStoreDecorations.defaultColors.backgroundOverlay,
        ),
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
