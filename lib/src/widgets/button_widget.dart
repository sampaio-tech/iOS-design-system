import 'package:flutter/cupertino.dart';

import '../../ios_design_system.dart';

class ButtonWidget extends StatelessWidget {
  final ButtonSize size;
  final ButtonColor color;
  final LabelFontWeight labelFontWeight;
  final String? label;
  final Widget? leftWidget;
  final Widget? rigthWidget;
  final IconData? leftIcon;
  final IconData? rigthIcon;
  final void Function()? onPressed;
  final double spacing;
  final BoxBorder? border;
  final BoxShape shape;
  final bool displayCupertinoActivityIndicator;
  final CupertinoActivityIndicator? cupertinoActivityIndicator;

  const ButtonWidget._({
    Key? key,
    required this.size,
    required this.onPressed,
    required this.color,
    this.cupertinoActivityIndicator,
    this.labelFontWeight = LabelFontWeight.regular,
    this.leftIcon,
    this.rigthIcon,
    this.leftWidget,
    this.rigthWidget,
    this.label,
    this.spacing = 3,
    this.border,
    this.shape = BoxShape.rectangle,
    this.displayCupertinoActivityIndicator = false,
  }) : super(key: key);

  factory ButtonWidget.label({
    required ButtonSize size,
    required ButtonColor color,
    required String label,
    CupertinoActivityIndicator? cupertinoActivityIndicator,
    LabelFontWeight labelFontWeight = LabelFontWeight.regular,
    IconData? leftIcon,
    IconData? rigthIcon,
    Widget? leftWidget,
    Widget? rigthWidget,
    void Function()? onPressed,
    double spacing = 3,
    BoxBorder? border,
    BoxShape shape = BoxShape.rectangle,
    bool displayCupertinoActivityIndicator = false,
    Key? key,
  }) =>
      ButtonWidget._(
        labelFontWeight: labelFontWeight,
        cupertinoActivityIndicator: cupertinoActivityIndicator,
        size: size,
        onPressed: onPressed,
        color: color,
        leftIcon: leftIcon,
        rigthIcon: rigthIcon,
        leftWidget: leftWidget,
        rigthWidget: rigthWidget,
        label: label,
        spacing: spacing,
        border: border,
        shape: shape,
        displayCupertinoActivityIndicator: displayCupertinoActivityIndicator,
        key: key,
      );

  factory ButtonWidget.icon({
    required ButtonSize size,
    required ButtonColor color,
    required IconData leftIcon,
    void Function()? onPressed,
    CupertinoActivityIndicator? cupertinoActivityIndicator,
    double spacing = 3,
    BoxBorder? border,
    BoxShape shape = BoxShape.rectangle,
    bool displayCupertinoActivityIndicator = false,
    Key? key,
  }) =>
      ButtonWidget._(
        cupertinoActivityIndicator: cupertinoActivityIndicator,
        size: size,
        onPressed: onPressed,
        color: color,
        leftIcon: leftIcon,
        label: null,
        spacing: spacing,
        border: border,
        shape: shape,
        displayCupertinoActivityIndicator: displayCupertinoActivityIndicator,
        key: key,
      );

  @override
  Widget build(BuildContext context) {
    if (label == null && leftIcon == null) {
      return const SizedBox.shrink();
    }
    final textScaleFactor = MediaQuery.textScaleFactorOf(context);
    final brightness = CupertinoTheme.brightnessOf(context);
    final enabled = onPressed != null;
    final kLabelTextStyle = size.textStyle(
      labelFontWeight: labelFontWeight,
      buttonColor: color,
      brightness: brightness,
      enabled: enabled,
    );
    final kPadding = size.padding(label);
    return CupertinoButtonWidget(
      onPressed: onPressed,
      border: border,
      shape: shape,
      displayCupertinoActivityIndicator: displayCupertinoActivityIndicator,
      cupertinoActivityIndicator: cupertinoActivityIndicator ??
          CupertinoActivityIndicator(
            radius: switch (kLabelTextStyle.fontSize) {
              null => 10,
              final fontSize => (fontSize * textScaleFactor) / 2
            },
          ),
      constraints: size._boxConstraints,
      borderRadius: size.borderRadius(label),
      padding: kPadding,
      color: color.background(brightness),
      disabledColor: color.backgroundDisabled(brightness),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        spacing: spacing,
        runSpacing: spacing,
        children: [
          if (leftWidget != null)
            AnimatedOpacity(
              duration: kAnimationInDuration,
              opacity: switch (enabled) {
                true => 1,
                false => kCupertinoButtonPressedOpacity,
              },
              child: leftWidget,
            ),
          if (leftIcon != null)
            Icon(
              leftIcon,
              color: color.label(brightness: brightness, enabled: enabled),
              size: size.iconSize(label),
            ),
          if (label != null)
            Text(
              label!,
              style: kLabelTextStyle,
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
            ),
          if (rigthIcon != null)
            Icon(
              rigthIcon,
              color: color.label(brightness: brightness, enabled: enabled),
              size: size.iconSize(label),
            ),
          if (rigthWidget != null)
            AnimatedOpacity(
              duration: kAnimationInDuration,
              opacity: switch (enabled) {
                true => 1,
                false => kCupertinoButtonPressedOpacity,
              },
              child: rigthWidget,
            ),
        ],
      ),
    );
  }
}

sealed class ButtonColor {
  final Color _backgroundLight;
  final Color _backgroundDark;
  final Color _labelLight;
  final Color _labelDark;

  const ButtonColor({
    required Color backgroundLight,
    required Color backgroundDark,
    required Color labelLight,
    required Color labelDark,
  })  : _labelDark = labelDark,
        _labelLight = labelLight,
        _backgroundDark = backgroundDark,
        _backgroundLight = backgroundLight;

  Color background(Brightness brightness) => switch ((this, brightness)) {
        (BlueTransparentButtonColor(), Brightness.light) =>
          _backgroundLight.withOpacity(.15),
        (BlueTransparentButtonColor(), Brightness.dark) =>
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

class GreyTransparentButtonColor extends ButtonColor {
  const GreyTransparentButtonColor()
      : super(
          backgroundLight: DefaultFillColors.secondaryLight,
          backgroundDark: DefaultFillColors.secondaryDark,
          labelLight: DefaultColors.systemBlueLight,
          labelDark: DefaultColors.systemBlueDark,
        );
}

class BlueButtonColor extends ButtonColor {
  const BlueButtonColor()
      : super(
          backgroundLight: DefaultColors.systemBlueLight,
          backgroundDark: DefaultColors.systemBlueDark,
          labelLight: DefaultLabelColors.primaryDark,
          labelDark: DefaultLabelColors.primaryDark,
        );
}

class BlueTransparentButtonColor extends ButtonColor {
  const BlueTransparentButtonColor()
      : super(
          backgroundLight: DefaultColors.systemBlueLight,
          backgroundDark: DefaultColors.systemBlueDark,
          labelLight: DefaultColors.systemBlueLight,
          labelDark: DefaultColors.systemBlueDark,
        );
}

class CustomButtonColor extends ButtonColor {
  const CustomButtonColor({
    required Color backgroundLight,
    required Color backgroundDark,
    required Color labelLight,
    required Color labelDark,
  }) : super(
          backgroundLight: backgroundLight,
          backgroundDark: backgroundDark,
          labelLight: labelLight,
          labelDark: labelDark,
        );
}

sealed class ButtonSize {
  final BorderRadius _borderRadius;
  final EdgeInsets _padding;
  final double _iconSize;
  final BoxConstraints? _boxConstraints;

  const ButtonSize({
    required BorderRadius borderRadius,
    required EdgeInsets padding,
    required double iconSize,
    required BoxConstraints? boxConstraints,
  })  : _padding = padding,
        _borderRadius = borderRadius,
        _iconSize = iconSize,
        _boxConstraints = boxConstraints;

  TextStyle textStyle({
    required ButtonColor buttonColor,
    required Brightness brightness,
    required bool enabled,
    required LabelFontWeight labelFontWeight,
  }) =>
      switch ((this, labelFontWeight)) {
        (SmallButtonSize(), LabelFontWeight.regular) =>
          AppTypography.subheadlineRegular,
        (SmallButtonSize(), LabelFontWeight.bold) =>
          AppTypography.subheadlineBold,
        (_, LabelFontWeight.regular) => AppTypography.bodyRegular,
        (_, LabelFontWeight.bold) => AppTypography.bodyBold,
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
        (SmallButtonSize(), null) => const EdgeInsets.all(10),
        (_, null) => const EdgeInsets.all(12),
        (final size, _) => size._padding,
      };
}

class SmallButtonSize extends ButtonSize {
  const SmallButtonSize()
      : super(
          borderRadius: const BorderRadius.all(Radius.circular(14)),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          iconSize: 18,
          boxConstraints: const BoxConstraints(minHeight: 28, minWidth: 28),
        );
}

class MediumButtonSize extends ButtonSize {
  const MediumButtonSize()
      : super(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          iconSize: 18,
          boxConstraints: const BoxConstraints(minHeight: 34, minWidth: 34),
        );
}

class LargeButtonSize extends ButtonSize {
  const LargeButtonSize()
      : super(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 20.5, vertical: 15),
          iconSize: 18,
          boxConstraints: const BoxConstraints(minHeight: 50, minWidth: 50),
        );
}

class CustomButtonSize extends ButtonSize {
  const CustomButtonSize({
    required BorderRadius borderRadius,
    required EdgeInsets padding,
    required double iconSize,
    required BoxConstraints? boxConstraints,
  }) : super(
          borderRadius: borderRadius,
          padding: padding,
          iconSize: iconSize,
          boxConstraints: boxConstraints,
        );
}

enum LabelFontWeight {
  regular,
  bold,
}
