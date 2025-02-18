import 'package:flutter/cupertino.dart';

import '../../ios_design_system.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget._({
    required this.size,
    required this.onPressed,
    required this.color,
    Key? key,
    this.cupertinoActivityIndicator,
    this.labelFontWeight = const RegularLabelFontWeight(),
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
    LabelFontWeight labelFontWeight = const RegularLabelFontWeight(),
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
        spacing: spacing,
        border: border,
        shape: shape,
        displayCupertinoActivityIndicator: displayCupertinoActivityIndicator,
        key: key,
      );
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

  @override
  Widget build(BuildContext context) {
    if (label == null && leftIcon == null) {
      return const SizedBox.shrink();
    }
    final textScale = MediaQuery.textScalerOf(context);
    final enabled = onPressed != null;
    final labelTextStyle = labelFontWeight.textStyle(
      context: context,
      buttonSize: size,
      buttonColor: color,
      enabled: enabled,
    );
    final padding = size.padding(label);
    return CupertinoButtonWidget(
      onPressed: onPressed,
      border: border,
      shape: shape,
      displayCupertinoActivityIndicator: displayCupertinoActivityIndicator,
      cupertinoActivityIndicator: cupertinoActivityIndicator ??
          CupertinoActivityIndicator(
            radius: switch (labelTextStyle.fontSize) {
              null => 10,
              final fontSize => (textScale.scale(fontSize)) / 2
            },
          ),
      constraints: size._boxConstraints,
      borderRadius: size.borderRadius(label),
      padding: padding,
      color: color.background(
        context: context,
        enabled: enabled,
      ),
      disabledColor: color.background(
        context: context,
        enabled: enabled,
      ),
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
              color: color.label(
                context: context,
                enabled: enabled,
              ),
              size: size.iconSize(label),
            ),
          if (label != null)
            Text(
              label!,
              style: labelTextStyle,
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
            ),
          if (rigthIcon != null)
            Icon(
              rigthIcon,
              color: color.label(
                context: context,
                enabled: enabled,
              ),
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
  const ButtonColor();

  Color background({
    required BuildContext context,
    required bool enabled,
  }) {
    if (!enabled) {
      return backgroundDisabled(context: context);
    }
    return backgroundEnabled(context: context);
  }

  Color label({
    required BuildContext context,
    required bool enabled,
  }) {
    if (!enabled) {
      return labelDisabled(context: context);
    }
    return labelEnabled(context: context);
  }

  Color labelDisabled({
    required BuildContext context,
  }) {
    final theme = IosTheme.of(context);
    return theme.defaultLabelColors.tertiary;
  }

  Color labelEnabled({
    required BuildContext context,
  });

  Color backgroundDisabled({
    required BuildContext context,
  }) {
    final theme = IosTheme.of(context);
    return theme.defaultFillColors.secondary;
  }

  Color backgroundEnabled({
    required BuildContext context,
  });
}

class GreyTransparentButtonColor extends ButtonColor {
  const GreyTransparentButtonColor();

  @override
  Color backgroundEnabled({
    required BuildContext context,
  }) {
    final theme = IosTheme.of(context);
    return theme.defaultFillColors.secondary;
  }

  @override
  Color labelEnabled({
    required BuildContext context,
  }) {
    final theme = IosTheme.of(context);
    return theme.defaultColors.systemBlue;
  }
}

class BlueButtonColor extends ButtonColor {
  const BlueButtonColor();

  @override
  Color backgroundEnabled({
    required BuildContext context,
  }) {
    final theme = IosTheme.of(context);
    return theme.defaultColors.systemBlue;
  }

  @override
  Color labelEnabled({
    required BuildContext context,
  }) {
    final theme = IosTheme.of(context);
    return switch (theme) {
      IosLightThemeData() => const DefaultLabelColorsDark().primary,
      IosDarkThemeData() => theme.defaultLabelColors.primary,
    };
  }
}

class BlueTransparentButtonColor extends ButtonColor {
  const BlueTransparentButtonColor();

  @override
  Color backgroundEnabled({
    required BuildContext context,
  }) {
    final theme = IosTheme.of(context);
    return theme.defaultColors.systemBlue.withValues(alpha: .15);
  }

  @override
  Color labelEnabled({
    required BuildContext context,
  }) {
    final theme = IosTheme.of(context);
    return theme.defaultColors.systemBlue;
  }
}

class CustomButtonColor extends ButtonColor {
  const CustomButtonColor({
    required Color backgroundEnabled,
    required Color? backgroundDisabled,
    required Color labelEnabled,
    required Color? labelDisabled,
  })  : _backgroundEnabled = backgroundEnabled,
        _backgroundDisabled = backgroundDisabled,
        _labelEnabled = labelEnabled,
        _labelDisabled = labelDisabled;

  final Color _backgroundEnabled;
  final Color? _backgroundDisabled;
  final Color _labelEnabled;
  final Color? _labelDisabled;

  @override
  Color backgroundEnabled({
    required BuildContext context,
  }) =>
      _backgroundEnabled;

  @override
  Color backgroundDisabled({
    required BuildContext context,
  }) =>
      _backgroundDisabled ?? super.backgroundDisabled(context: context);

  @override
  Color labelEnabled({
    required BuildContext context,
  }) =>
      _labelEnabled;

  @override
  Color labelDisabled({
    required BuildContext context,
  }) =>
      _labelDisabled ?? super.labelDisabled(context: context);
}

sealed class ButtonSize {
  const ButtonSize({
    required BorderRadius borderRadius,
    required EdgeInsets padding,
    required double iconSize,
    required BoxConstraints? boxConstraints,
  })  : _padding = padding,
        _borderRadius = borderRadius,
        _iconSize = iconSize,
        _boxConstraints = boxConstraints;

  final BorderRadius _borderRadius;
  final EdgeInsets _padding;
  final double _iconSize;
  final BoxConstraints? _boxConstraints;

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
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          iconSize: 18,
          boxConstraints: const BoxConstraints(
            minHeight: 28,
            minWidth: 28,
          ),
        );
}

class MediumButtonSize extends ButtonSize {
  const MediumButtonSize()
      : super(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 7,
          ),
          iconSize: 18,
          boxConstraints: const BoxConstraints(
            minHeight: 34,
            minWidth: 34,
          ),
        );
}

class LargeButtonSize extends ButtonSize {
  const LargeButtonSize()
      : super(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          padding: const EdgeInsets.symmetric(
            horizontal: 20.5,
            vertical: 15,
          ),
          iconSize: 18,
          boxConstraints: const BoxConstraints(
            minHeight: 50,
            minWidth: 50,
          ),
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

sealed class LabelFontWeight {
  const LabelFontWeight();

  TextStyle textStyle({
    required BuildContext context,
    required ButtonSize buttonSize,
    required ButtonColor buttonColor,
    required bool enabled,
    double? height = 1.0,
    double? letterSpacing = 0,
  });
}

class RegularLabelFontWeight extends LabelFontWeight {
  const RegularLabelFontWeight();

  @override
  TextStyle textStyle({
    required BuildContext context,
    required ButtonSize buttonSize,
    required ButtonColor buttonColor,
    required bool enabled,
    double? height = 1.0,
    double? letterSpacing = 0,
  }) {
    final theme = IosTheme.of(context);
    final textStyle = switch (buttonSize) {
      SmallButtonSize() => theme.typography.subheadlineRegular,
      _ => theme.typography.bodyRegular,
    }
        .copyWith(
      color: buttonColor.label(context: context, enabled: enabled),
      height: height,
      letterSpacing: letterSpacing,
    );
    return textStyle;
  }
}

class BoldLabelFontWeight extends LabelFontWeight {
  const BoldLabelFontWeight();

  @override
  TextStyle textStyle({
    required BuildContext context,
    required ButtonSize buttonSize,
    required ButtonColor buttonColor,
    required bool enabled,
    double? height = 1.0,
    double? letterSpacing = 0,
  }) {
    final theme = IosTheme.of(context);
    final textStyle = switch (buttonSize) {
      SmallButtonSize() => theme.typography.subheadlineBold,
      _ => theme.typography.bodyBold,
    }
        .copyWith(
      color: buttonColor.label(context: context, enabled: enabled),
      height: height,
      letterSpacing: letterSpacing,
    );
    return textStyle;
  }
}
