import 'package:flutter/cupertino.dart';

import '../../../ios_design_system.dart';

class AppStorePillButtonWidget extends StatelessWidget {
  const AppStorePillButtonWidget({
    super.key,
    this.label,
    this.icon,
    this.onLongPress,
    this.onPressed,
    this.displayCupertinoActivityIndicator = false,
  });

  factory AppStorePillButtonWidget.icon({
    required IconData icon,
    required String? label,
    double iconSize = 16,
    void Function()? onPressed,
    void Function()? onLongPress,
    bool displayCupertinoActivityIndicator = false,
  }) => AppStorePillButtonWidget(
    label: label,
    icon: Builder(
      builder: (context) {
        final theme = IosTheme.of(context);
        if (displayCupertinoActivityIndicator) {
          return CupertinoActivityIndicator(radius: iconSize / 2);
        }
        return Icon(
          icon,
          size: iconSize,
          color: theme.appStoreDecorations.defaultColors.baseWhite,
        );
      },
    ),
    onPressed: onPressed,
    onLongPress: onLongPress,
  );

  final String? label;
  final Widget? icon;
  final void Function()? onPressed;
  final void Function()? onLongPress;
  final bool displayCupertinoActivityIndicator;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    final borderSide = BorderSide(
      color: theme.appStoreDecorations.defaultColors.backgroundOverlayStroke,
    );
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CupertinoButtonWidget(
          onPressed: switch (displayCupertinoActivityIndicator) {
            false => onPressed,
            true => null,
          },
          onLongPress: switch (displayCupertinoActivityIndicator) {
            false => onLongPress,
            true => null,
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              border: Border(
                bottom: borderSide,
                top: borderSide,
                left: borderSide,
                right: borderSide,
              ),
              color: theme.appStoreDecorations.defaultColors.backgroundOverlay,
            ),
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
                      color: theme.appStoreDecorations.defaultColors.baseWhite,
                    ),
                  ),
                },
              ],
            ),
          ),
        ),
      ],
    );
  }
}
