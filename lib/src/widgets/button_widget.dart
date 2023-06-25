import 'package:flutter/cupertino.dart';

import '../../ios_design_system.dart';

class ButtonWidget extends StatelessWidget {
  final ButtonSize size;
  final ButtonColor color;
  final String? label;
  final IconData? leftIcon;
  final void Function()? onPressed;

  const ButtonWidget._({
    Key? key,
    required this.size,
    required this.onPressed,
    required this.color,
    this.leftIcon,
    this.label,
  }) : super(key: key);

  factory ButtonWidget.label({
    required ButtonSize size,
    required ButtonColor color,
    required String label,
    IconData? leftIcon,
    void Function()? onPressed,
    Key? key,
  }) =>
      ButtonWidget._(
        size: size,
        onPressed: onPressed,
        color: color,
        leftIcon: leftIcon,
        label: label,
        key: key,
      );

  factory ButtonWidget.icon({
    required ButtonSize size,
    required ButtonColor color,
    required IconData leftIcon,
    void Function()? onPressed,
    Key? key,
  }) =>
      ButtonWidget._(
        size: size,
        onPressed: onPressed,
        color: color,
        leftIcon: leftIcon,
        label: null,
        key: key,
      );

  @override
  Widget build(BuildContext context) {
    if (label == null && leftIcon == null) {
      return const SizedBox.shrink();
    }
    final brightness = CupertinoTheme.brightnessOf(context);
    final enabled = onPressed != null;
    return CupertinoButtonWidget(
      onPressed: onPressed,
      borderRadius: size.borderRadius(label),
      padding: size.padding(label),
      color: color.background(brightness),
      disabledColor: color.backgroundDisabled(brightness),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        spacing: 3,
        runSpacing: 3,
        children: [
          if (leftIcon != null)
            Icon(
              leftIcon,
              color: color.label(brightness: brightness, enabled: enabled),
              size: size.iconSize(label),
            ),
          if (label != null)
            Text(
              label!,
              style: size.textStyle(
                buttonColor: color,
                brightness: brightness,
                enabled: enabled,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
            ),
        ],
      ),
    );
  }
}

enum ButtonColor {
  greyTransparent(
    backgroundLight: DefaultFillColors.secondaryLight,
    backgroundDark: DefaultFillColors.secondaryDark,
    labelLight: DefaultColors.systemBlueLight,
    labelDark: DefaultColors.systemBlueDark,
  ),
  blue(
    backgroundLight: DefaultColors.systemBlueLight,
    backgroundDark: DefaultColors.systemBlueDark,
    labelLight: DefaultLabelColors.primaryDark,
    labelDark: DefaultLabelColors.primaryDark,
  ),
  blueTransparent(
    backgroundLight: DefaultColors.systemBlueLight,
    backgroundDark: DefaultColors.systemBlueDark,
    labelLight: DefaultColors.systemBlueLight,
    labelDark: DefaultColors.systemBlueDark,
  );

  const ButtonColor({
    required Color backgroundLight,
    required Color backgroundDark,
    required Color labelLight,
    required Color labelDark,
  })  : _labelDark = labelDark,
        _labelLight = labelLight,
        _backgroundDark = backgroundDark,
        _backgroundLight = backgroundLight;

  final Color _backgroundLight;
  final Color _backgroundDark;
  final Color _labelLight;
  final Color _labelDark;

  Color background(Brightness brightness) => switch ((this, brightness)) {
        (ButtonColor.blueTransparent, Brightness.light) =>
          _backgroundLight.withOpacity(.15),
        (ButtonColor.blueTransparent, Brightness.dark) =>
          _backgroundDark.withOpacity(.15),
        (_, Brightness.light) => _backgroundLight,
        (_, Brightness.dark) => _backgroundDark,
      };

  Color label({
    required Brightness brightness,
    required bool enabled,
  }) =>
      switch ((brightness, enabled)) {
        (final brightness, false) => _labelDisabled(brightness),
        (Brightness.light, _) => _labelLight,
        (Brightness.dark, _) => _labelDark,
      };

  Color _labelDisabled(Brightness brightness) => switch (brightness) {
        Brightness.light => DefaultLabelColors.tertiaryLight,
        Brightness.dark => DefaultLabelColors.tertiaryDark,
      };

  Color backgroundDisabled(Brightness brightness) => switch (brightness) {
        Brightness.light => DefaultFillColors.secondaryLight,
        Brightness.dark => DefaultFillColors.secondaryDark,
      };
}

enum ButtonSize {
  small(
    borderRadius: BorderRadius.all(Radius.circular(14)),
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    iconSize: 18,
  ),
  medium(
    borderRadius: BorderRadius.all(Radius.circular(50)),
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
    iconSize: 18,
  ),
  large(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    padding: EdgeInsets.symmetric(horizontal: 20.5, vertical: 15),
    iconSize: 18,
  );

  const ButtonSize({
    required BorderRadius borderRadius,
    required EdgeInsets padding,
    required double iconSize,
  })  : _padding = padding,
        _borderRadius = borderRadius,
        _iconSize = iconSize;

  final BorderRadius _borderRadius;
  final EdgeInsets _padding;
  final double _iconSize;

  TextStyle textStyle({
    required ButtonColor buttonColor,
    required Brightness brightness,
    required bool enabled,
  }) =>
      switch (this) {
        ButtonSize.small => AppTypography.subheadlineRegular,
        _ => AppTypography.bodyRegular,
      }
          .copyWith(
        color: buttonColor.label(brightness: brightness, enabled: enabled),
        height: 1,
        letterSpacing: 0,
      );

  double iconSize(String? label) => switch (label) {
        null => 26,
        _ => _iconSize,
      };

  BorderRadius borderRadius(String? label) => switch ((this, label)) {
        (_, null) => const BorderRadius.all(Radius.circular(50)),
        (final size, _) => size._borderRadius,
      };

  EdgeInsets padding(String? label) => switch ((this, label)) {
        (ButtonSize.small, null) => const EdgeInsets.all(10),
        (_, null) => const EdgeInsets.all(12),
        (final size, _) => size._padding,
      };
}
