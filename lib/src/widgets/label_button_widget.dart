import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ios_design_system.dart';

class LabelButtonWidget extends StatelessWidget {
  final String? label;
  final IconData? iconLeft;
  final IconData? iconRight;
  final EdgeInsetsGeometry padding;
  final void Function()? onPressed;

  const LabelButtonWidget._({
    Key? key,
    this.label,
    this.iconLeft,
    this.iconRight,
    this.padding = EdgeInsets.zero,
    this.onPressed,
  }) : super(key: key);

  factory LabelButtonWidget.label({
    Key? key,
    required String label,
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
    Key? key,
    required IconData icon,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    void Function()? onPressed,
  }) =>
      LabelButtonWidget._(
        key: key,
        iconLeft: icon,
        iconRight: null,
        padding: padding,
        label: null,
        onPressed: onPressed,
      );

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
    final brightness = CupertinoTheme.brightnessOf(context);
    final textScaleFactor = MediaQuery.textScaleFactorOf(context);
    const kBorderRadius = BorderRadius.all(Radius.zero);
    const kColor = Colors.transparent;
    const kDisabledColor = Colors.transparent;
    const kIconSize = 20.0;
    final kLabelColor = switch (brightness) {
      Brightness.light => DefaultColors.systemBlueLight,
      Brightness.dark => DefaultColors.systemBlueDark,
    };
    return CupertinoButtonWidget(
      padding: padding,
      onPressed: onPressed,
      borderRadius: kBorderRadius,
      color: kColor,
      disabledColor: kDisabledColor,
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
              color: kLabelColor,
              size: kIconSize * textScaleFactor,
            ),
          if (label != null)
            Text(
              label!,
              style: AppTypography.bodyRegular.copyWith(color: kLabelColor),
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
            ),
          if (iconRight != null)
            Icon(
              iconRight,
              color: kLabelColor,
              size: kIconSize * textScaleFactor,
            ),
        ],
      ),
    );
  }
}
