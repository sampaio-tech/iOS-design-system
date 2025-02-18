import 'package:flutter/material.dart';

import '../../ios_design_system.dart';

class LabelButtonWidget extends StatelessWidget {
  const LabelButtonWidget._({
    Key? key,
    this.label,
    this.iconLeft,
    this.iconRight,
    this.padding = EdgeInsets.zero,
    this.onPressed,
  }) : super(key: key);

  factory LabelButtonWidget.label({
    required String label,
    Key? key,
    IconData? iconLeft,
    IconData? iconRight,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    void Function()? onPressed,
  }) =>
      LabelButtonWidget._(
        key: key,
        iconLeft: iconLeft,
        iconRight: iconRight,
        padding: padding,
        label: label,
        onPressed: onPressed,
      );

  factory LabelButtonWidget.icon({
    required IconData icon,
    Key? key,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    void Function()? onPressed,
  }) =>
      LabelButtonWidget._(
        key: key,
        iconLeft: icon,
        padding: padding,
        onPressed: onPressed,
      );
  final String? label;
  final IconData? iconLeft;
  final IconData? iconRight;
  final EdgeInsetsGeometry padding;
  final void Function()? onPressed;

  LabelButtonWidget copyWith({
    Key? key,
    String? label,
    IconData? iconLeft,
    IconData? iconRight,
    EdgeInsetsGeometry? padding,
    void Function()? onPressed,
  }) =>
      LabelButtonWidget._(
        key: key ?? this.key,
        label: label ?? this.label,
        iconLeft: iconLeft ?? this.iconLeft,
        iconRight: iconRight ?? this.iconRight,
        padding: padding ?? this.padding,
        onPressed: onPressed ?? this.onPressed,
      );

  @override
  Widget build(BuildContext context) {
    if (label == null && iconLeft == null && iconRight == null) {
      return const SizedBox.shrink();
    }
    final textScaleFactor = MediaQuery.textScalerOf(context);
    final theme = IosTheme.of(context);
    const borderRadius = BorderRadius.all(Radius.zero);
    const color = Colors.transparent;
    const disabledColor = Colors.transparent;
    const iconSize = 20.0;
    final labelColor = theme.defaultColors.systemBlue;
    return CupertinoButtonWidget(
      padding: padding,
      onPressed: onPressed,
      borderRadius: borderRadius,
      color: color,
      disabledColor: disabledColor,
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 2,
        runSpacing: 2,
        children: [
          if (iconLeft != null)
            Icon(
              iconLeft,
              color: labelColor,
              size: textScaleFactor.scale(iconSize),
            ),
          if (label != null)
            Text(
              label!,
              style: theme.typography.bodyRegular.copyWith(
                color: labelColor,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
            ),
          if (iconRight != null)
            Icon(
              iconRight,
              color: labelColor,
              size: textScaleFactor.scale(iconSize),
            ),
        ],
      ),
    );
  }
}
