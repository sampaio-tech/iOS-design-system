import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../colors/colors.dart';
import '../typography/typography.dart';
import './constants.dart' as constants;

class IosInheritedTheme extends InheritedTheme {
  const IosInheritedTheme({
    required this.theme,
    required super.child,
    super.key,
  });
  final IosTheme theme;

  @override
  Widget wrap(BuildContext context, Widget child) => IosTheme(
        data: theme.data,
        child: child,
      );

  @override
  bool updateShouldNotify(IosInheritedTheme oldWidget) =>
      theme.data != oldWidget.theme.data;
}

class IosTheme extends StatelessWidget {
  const IosTheme({
    required this.data,
    required this.child,
    super.key,
  });
  final IosThemeData data;
  final Widget child;

  static final IosThemeData Function(
    BuildContext? context,
  ) _kFallbackTheme = IosThemeData.fallback;

  static IosThemeData of(BuildContext context) {
    final IosInheritedTheme? inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<IosInheritedTheme>();
    return inheritedTheme?.theme.data ?? _kFallbackTheme(context);
  }

  @override
  Widget build(BuildContext context) => IosInheritedTheme(
        theme: this,
        child: child,
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<IosThemeData>(
        'data',
        data,
        showName: false,
      ),
    );
  }
}

class IosThemeDataTween extends Tween<IosThemeData> {
  IosThemeDataTween({
    super.begin,
    super.end,
  });

  @override
  IosThemeData lerp(double t) => IosThemeData.lerp(begin!, end!, t);
}

class IosAnimatedTheme extends ImplicitlyAnimatedWidget {
  const IosAnimatedTheme({
    required this.data,
    required this.child,
    super.key,
    super.curve,
    super.duration = constants.kThemeAnimationDuration,
    super.onEnd,
  });
  final IosThemeDataTween data;
  final Widget child;

  @override
  AnimatedWidgetBaseState<IosAnimatedTheme> createState() =>
      _IosAnimatedThemeState();
}

class _IosAnimatedThemeState extends AnimatedWidgetBaseState<IosAnimatedTheme> {
  IosThemeDataTween? _data;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    final data = visitor(
      _data,
      widget.data,
      (dynamic value) => IosThemeDataTween(
        begin: switch (value) {
          final IosThemeData value => value,
          _ => IosThemeData.fallback(null),
        },
      ),
    );
    if (data is IosThemeDataTween) {
      _data = data;
    }
  }

  @override
  Widget build(BuildContext context) => IosTheme(
        data: _data?.evaluate(animation) ?? IosThemeData.fallback(context),
        child: widget.child,
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(
      DiagnosticsProperty<IosThemeDataTween>(
        'data',
        _data,
        showName: false,
        defaultValue: null,
      ),
    );
  }
}

sealed class IosThemeData {
  const IosThemeData({
    required this.acessibleColors,
    required this.defaultColors,
    required this.defaultSystemBackgroundsColors,
    required this.defaultSystemGroupedBackgroundsColors,
    required this.defaultFillColors,
    required this.defaultLabelColors,
    required this.defaultSeparatorColors,
    required this.systemColoursSeparatorColors,
    required this.systemMaterialsBackgroundsColors,
    required this.systemMaterialsLabelsTextColors,
    required this.systemMaterialsFillColors,
    required this.typography,
  });
  final AcessibleColors acessibleColors;
  final DefaultColors defaultColors;
  final DefaultSystemBackgroundsColors defaultSystemBackgroundsColors;
  final DefaultSystemGroupedBackgroundsColors
      defaultSystemGroupedBackgroundsColors;
  final DefaultFillColors defaultFillColors;
  final DefaultLabelColors defaultLabelColors;
  final DefaultSeparatorColors defaultSeparatorColors;
  final SystemColoursSeparatorColors systemColoursSeparatorColors;
  final SystemMaterialsBackgroundsColors systemMaterialsBackgroundsColors;
  final SystemMaterialsLabelsTextColors systemMaterialsLabelsTextColors;
  final SystemMaterialsFillColors systemMaterialsFillColors;
  final AppTypography typography;

  Brightness get brightness => switch (this) {
        IosLightThemeData() => Brightness.light,
        IosDarkThemeData() => Brightness.dark,
      };

  ThemeData get textFieldThemeData => ThemeData(
        brightness: brightness,
        splashColor: defaultColors.systemBlue,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: defaultColors.systemBlue,
          selectionColor: switch (this) {
            IosLightThemeData() =>
              defaultColors.systemBlue.withValues(alpha: .2),
            IosDarkThemeData() =>
              defaultLabelColors.primary.withValues(alpha: .2),
          },
          selectionHandleColor: defaultColors.systemBlue.withValues(alpha: .2),
        ),
      );

  static IosThemeData fallback(
    BuildContext? context,
  ) {
    final brightness = switch (context) {
          null => null,
          final context => MediaQuery.maybePlatformBrightnessOf(context),
        } ??
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return switch (brightness) {
      Brightness.light => const IosLightThemeData(),
      Brightness.dark => const IosDarkThemeData(),
    };
  }

  static IosThemeData lerp(IosThemeData a, IosThemeData b, double t) {
    if (identical(a, b)) {
      return a;
    }
    return b;
  }
}

class IosLightThemeData extends IosThemeData {
  const IosLightThemeData()
      : super(
          acessibleColors: const AcessibleColorsLight(),
          defaultColors: const DefaultColorsLight(),
          defaultSystemBackgroundsColors:
              const DefaultSystemBackgroundsColorsLight(),
          defaultSystemGroupedBackgroundsColors:
              const DefaultSystemGroupedBackgroundsColorsLight(),
          defaultFillColors: const DefaultFillColorsLight(),
          defaultLabelColors: const DefaultLabelColorsLight(),
          defaultSeparatorColors: const DefaultSeparatorColorsLight(),
          systemColoursSeparatorColors:
              const SystemColoursSeparatorColorsLight(),
          systemMaterialsBackgroundsColors:
              const SystemMaterialsBackgroundsColorsLight(),
          systemMaterialsLabelsTextColors:
              const SystemMaterialsLabelsTextColorsLight(),
          systemMaterialsFillColors: const SystemMaterialsFillColorsLight(),
          typography: const AppTypography(),
        );
}

class IosDarkThemeData extends IosThemeData {
  const IosDarkThemeData()
      : super(
          acessibleColors: const AcessibleColorsDark(),
          defaultColors: const DefaultColorsDark(),
          defaultSystemBackgroundsColors:
              const DefaultSystemBackgroundsColorsDark(),
          defaultSystemGroupedBackgroundsColors:
              const DefaultSystemGroupedBackgroundsColorsDark(),
          defaultFillColors: const DefaultFillColorsDark(),
          defaultLabelColors: const DefaultLabelColorsDark(),
          defaultSeparatorColors: const DefaultSeparatorColorsDark(),
          systemColoursSeparatorColors:
              const SystemColoursSeparatorColorsDark(),
          systemMaterialsBackgroundsColors:
              const SystemMaterialsBackgroundsColorsDark(),
          systemMaterialsLabelsTextColors:
              const SystemMaterialsLabelsTextColorsDark(),
          systemMaterialsFillColors: const SystemMaterialsFillColorsDark(),
          typography: const AppTypography(),
        );
}
