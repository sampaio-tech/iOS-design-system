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
  Widget wrap(BuildContext context, Widget child) =>
      IosTheme(data: theme.data, child: child);

  @override
  bool updateShouldNotify(IosInheritedTheme oldWidget) =>
      theme.data != oldWidget.theme.data;
}

class IosTheme extends StatelessWidget {
  const IosTheme({required this.data, required this.child, super.key});
  final IosThemeData data;
  final Widget child;

  static final IosThemeData Function(BuildContext? context) _kFallbackTheme =
      IosThemeData.fallback;

  static IosThemeData of(BuildContext context) {
    final IosInheritedTheme? inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<IosInheritedTheme>();
    return inheritedTheme?.theme.data ?? _kFallbackTheme(context);
  }

  @override
  Widget build(BuildContext context) =>
      IosInheritedTheme(theme: this, child: child);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<IosThemeData>('data', data, showName: false),
    );
  }
}

class IosThemeDataTween extends Tween<IosThemeData> {
  IosThemeDataTween({super.begin, super.end});

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
  final IosThemeData data;
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
    required this.weatherDecorations,
    required this.stocksDecorations,
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
  final IosTypography typography;
  final WeatherDecorations weatherDecorations;
  final StocksDecorations stocksDecorations;

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
        IosLightThemeData() => defaultColors.systemBlue.withValues(alpha: .2),
        IosDarkThemeData() => defaultLabelColors.primary.withValues(alpha: .2),
      },
      selectionHandleColor: defaultColors.systemBlue.withValues(alpha: .2),
    ),
  );

  static IosThemeData fallback(BuildContext? context) {
    final brightness =
        switch (context) {
          null => null,
          final context => MediaQuery.maybePlatformBrightnessOf(context),
        } ??
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return switch (brightness) {
      Brightness.light => const IosLightThemeData(),
      Brightness.dark => const IosDarkThemeData(),
    };
  }

  static IosThemeData lerp(IosThemeData a, IosThemeData b, double t) =>
      a._lerp(b, t);

  IosThemeData _lerp(IosThemeData b, double t) {
    if (identical(this, b)) {
      return this;
    }
    final instance = t < 0.5 ? this : b;
    return instance.copyWith(
      acessibleColors: acessibleColors.lerp(b.acessibleColors, t),
      defaultColors: defaultColors.lerp(b.defaultColors, t),
      defaultSystemBackgroundsColors: defaultSystemBackgroundsColors.lerp(
        b.defaultSystemBackgroundsColors,
        t,
      ),
      defaultFillColors: defaultFillColors.lerp(b.defaultFillColors, t),
      defaultLabelColors: defaultLabelColors.lerp(b.defaultLabelColors, t),
      defaultSeparatorColors: defaultSeparatorColors.lerp(
        b.defaultSeparatorColors,
        t,
      ),
      systemColoursSeparatorColors: systemColoursSeparatorColors.lerp(
        b.systemColoursSeparatorColors,
        t,
      ),
      systemMaterialsBackgroundsColors: systemMaterialsBackgroundsColors.lerp(
        b.systemMaterialsBackgroundsColors,
        t,
      ),
      systemMaterialsLabelsTextColors: systemMaterialsLabelsTextColors.lerp(
        b.systemMaterialsLabelsTextColors,
        t,
      ),
      systemMaterialsFillColors: systemMaterialsFillColors.lerp(
        b.systemMaterialsFillColors,
        t,
      ),
      typography: typography.lerp(b.typography, t),
      weatherDecorations: weatherDecorations.lerp(b.weatherDecorations, t),
      stocksDecorations: stocksDecorations.lerp(b.stocksDecorations, t),
    );
  }

  IosThemeData copyWith({
    AcessibleColors? acessibleColors,
    DefaultColors? defaultColors,
    DefaultSystemBackgroundsColors? defaultSystemBackgroundsColors,
    DefaultFillColors? defaultFillColors,
    DefaultLabelColors? defaultLabelColors,
    DefaultSeparatorColors? defaultSeparatorColors,
    SystemColoursSeparatorColors? systemColoursSeparatorColors,
    SystemMaterialsBackgroundsColors? systemMaterialsBackgroundsColors,
    SystemMaterialsLabelsTextColors? systemMaterialsLabelsTextColors,
    SystemMaterialsFillColors? systemMaterialsFillColors,
    IosTypography? typography,
    WeatherDecorations? weatherDecorations,
    StocksDecorations? stocksDecorations,
  });
}

class IosLightThemeData extends IosThemeData {
  const IosLightThemeData({
    AcessibleColors? acessibleColors,
    DefaultColors? defaultColors,
    DefaultSystemBackgroundsColors? defaultSystemBackgroundsColors,
    DefaultSystemGroupedBackgroundsColors?
    defaultSystemGroupedBackgroundsColors,
    DefaultFillColors? defaultFillColors,
    DefaultLabelColors? defaultLabelColors,
    DefaultSeparatorColors? defaultSeparatorColors,
    SystemColoursSeparatorColors? systemColoursSeparatorColors,
    SystemMaterialsBackgroundsColors? systemMaterialsBackgroundsColors,
    SystemMaterialsLabelsTextColors? systemMaterialsLabelsTextColors,
    SystemMaterialsFillColors? systemMaterialsFillColors,
    IosTypography? typography,
    WeatherDecorations? weatherDecorations,
    StocksDecorations? stocksDecorations,
  }) : super(
         acessibleColors: acessibleColors ?? const AcessibleColorsLight(),
         defaultColors: defaultColors ?? const DefaultColorsLight(),
         defaultSystemBackgroundsColors:
             defaultSystemBackgroundsColors ??
             const DefaultSystemBackgroundsColorsLight(),
         defaultSystemGroupedBackgroundsColors:
             defaultSystemGroupedBackgroundsColors ??
             const DefaultSystemGroupedBackgroundsColorsLight(),
         defaultFillColors: defaultFillColors ?? const DefaultFillColorsLight(),
         defaultLabelColors:
             defaultLabelColors ?? const DefaultLabelColorsLight(),
         defaultSeparatorColors:
             defaultSeparatorColors ?? const DefaultSeparatorColorsLight(),
         systemColoursSeparatorColors:
             systemColoursSeparatorColors ??
             const SystemColoursSeparatorColorsLight(),
         systemMaterialsBackgroundsColors:
             systemMaterialsBackgroundsColors ??
             const SystemMaterialsBackgroundsColorsLight(),
         systemMaterialsLabelsTextColors:
             systemMaterialsLabelsTextColors ??
             const SystemMaterialsLabelsTextColorsLight(),
         systemMaterialsFillColors:
             systemMaterialsFillColors ??
             const SystemMaterialsFillColorsLight(),
         typography: typography ?? const IosTypography(),
         weatherDecorations:
             weatherDecorations ?? const WeatherDecorationsLight(),
         stocksDecorations: stocksDecorations ?? const StocksDecorationsLight(),
       );

  @override
  IosThemeData copyWith({
    AcessibleColors? acessibleColors,
    DefaultColors? defaultColors,
    DefaultSystemBackgroundsColors? defaultSystemBackgroundsColors,
    DefaultFillColors? defaultFillColors,
    DefaultLabelColors? defaultLabelColors,
    DefaultSeparatorColors? defaultSeparatorColors,
    SystemColoursSeparatorColors? systemColoursSeparatorColors,
    SystemMaterialsBackgroundsColors? systemMaterialsBackgroundsColors,
    SystemMaterialsLabelsTextColors? systemMaterialsLabelsTextColors,
    SystemMaterialsFillColors? systemMaterialsFillColors,
    IosTypography? typography,
    WeatherDecorations? weatherDecorations,
    StocksDecorations? stocksDecorations,
  }) => IosLightThemeData(
    acessibleColors: acessibleColors,
    defaultColors: defaultColors,
    defaultSystemBackgroundsColors: defaultSystemBackgroundsColors,
    defaultFillColors: defaultFillColors,
    defaultLabelColors: defaultLabelColors,
    defaultSeparatorColors: defaultSeparatorColors,
    systemColoursSeparatorColors: systemColoursSeparatorColors,
    systemMaterialsBackgroundsColors: systemMaterialsBackgroundsColors,
    systemMaterialsLabelsTextColors: systemMaterialsLabelsTextColors,
    systemMaterialsFillColors: systemMaterialsFillColors,
    typography: typography,
    weatherDecorations: weatherDecorations,
    stocksDecorations: stocksDecorations,
  );
}

class IosDarkThemeData extends IosThemeData {
  const IosDarkThemeData({
    AcessibleColors? acessibleColors,
    DefaultColors? defaultColors,
    DefaultSystemBackgroundsColors? defaultSystemBackgroundsColors,
    DefaultSystemGroupedBackgroundsColors?
    defaultSystemGroupedBackgroundsColors,
    DefaultFillColors? defaultFillColors,
    DefaultLabelColors? defaultLabelColors,
    DefaultSeparatorColors? defaultSeparatorColors,
    SystemColoursSeparatorColors? systemColoursSeparatorColors,
    SystemMaterialsBackgroundsColors? systemMaterialsBackgroundsColors,
    SystemMaterialsLabelsTextColors? systemMaterialsLabelsTextColors,
    SystemMaterialsFillColors? systemMaterialsFillColors,
    IosTypography? typography,
    WeatherDecorations? weatherDecorations,
    StocksDecorations? stocksDecorations,
  }) : super(
         acessibleColors: acessibleColors ?? const AcessibleColorsDark(),
         defaultColors: defaultColors ?? const DefaultColorsDark(),
         defaultSystemBackgroundsColors:
             defaultSystemBackgroundsColors ??
             const DefaultSystemBackgroundsColorsDark(),
         defaultSystemGroupedBackgroundsColors:
             defaultSystemGroupedBackgroundsColors ??
             const DefaultSystemGroupedBackgroundsColorsDark(),
         defaultFillColors: defaultFillColors ?? const DefaultFillColorsDark(),
         defaultLabelColors:
             defaultLabelColors ?? const DefaultLabelColorsDark(),
         defaultSeparatorColors:
             defaultSeparatorColors ?? const DefaultSeparatorColorsDark(),
         systemColoursSeparatorColors:
             systemColoursSeparatorColors ??
             const SystemColoursSeparatorColorsDark(),
         systemMaterialsBackgroundsColors:
             systemMaterialsBackgroundsColors ??
             const SystemMaterialsBackgroundsColorsDark(),
         systemMaterialsLabelsTextColors:
             systemMaterialsLabelsTextColors ??
             const SystemMaterialsLabelsTextColorsDark(),
         systemMaterialsFillColors:
             systemMaterialsFillColors ?? const SystemMaterialsFillColorsDark(),
         typography: typography ?? const IosTypography(),
         weatherDecorations:
             weatherDecorations ?? const WeatherDecorationsDark(),
         stocksDecorations: stocksDecorations ?? const StocksDecorationsDark(),
       );

  @override
  IosThemeData copyWith({
    AcessibleColors? acessibleColors,
    DefaultColors? defaultColors,
    DefaultSystemBackgroundsColors? defaultSystemBackgroundsColors,
    DefaultFillColors? defaultFillColors,
    DefaultLabelColors? defaultLabelColors,
    DefaultSeparatorColors? defaultSeparatorColors,
    SystemColoursSeparatorColors? systemColoursSeparatorColors,
    SystemMaterialsBackgroundsColors? systemMaterialsBackgroundsColors,
    SystemMaterialsLabelsTextColors? systemMaterialsLabelsTextColors,
    SystemMaterialsFillColors? systemMaterialsFillColors,
    IosTypography? typography,
    WeatherDecorations? weatherDecorations,
    StocksDecorations? stocksDecorations,
  }) => IosDarkThemeData(
    acessibleColors: acessibleColors,
    defaultColors: defaultColors,
    defaultSystemBackgroundsColors: defaultSystemBackgroundsColors,
    defaultFillColors: defaultFillColors,
    defaultLabelColors: defaultLabelColors,
    defaultSeparatorColors: defaultSeparatorColors,
    systemColoursSeparatorColors: systemColoursSeparatorColors,
    systemMaterialsBackgroundsColors: systemMaterialsBackgroundsColors,
    systemMaterialsLabelsTextColors: systemMaterialsLabelsTextColors,
    systemMaterialsFillColors: systemMaterialsFillColors,
    typography: typography,
    weatherDecorations: weatherDecorations,
    stocksDecorations: stocksDecorations,
  );
}
