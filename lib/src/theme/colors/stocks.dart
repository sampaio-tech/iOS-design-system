part of 'colors.dart';

sealed class StocksDecorations {
  const StocksDecorations({
    required this.gradients,
    required this.defaultColors,
  });

  final StocksGradients gradients;
  final StocksDefaultColors defaultColors;

  StocksDecorations lerp(StocksDecorations b, double t) {
    if (identical(this, b)) {
      return this;
    }
    final instance = t < 0.5 ? this : b;
    return instance.copyWith(
      gradients: gradients.lerp(b.gradients, t),
      defaultColors: defaultColors.lerp(b.defaultColors, t),
    );
  }

  StocksDecorations copyWith({
    required StocksGradients? gradients,
    required StocksDefaultColors? defaultColors,
  });
}

class StocksDecorationsDark extends StocksDecorations {
  const StocksDecorationsDark({
    StocksGradients gradients = const StocksGradientsDark(),
    StocksDefaultColors defaultColors = const StocksDefaultColorsDark(),
  }) : super(gradients: gradients, defaultColors: defaultColors);

  @override
  StocksDecorations copyWith({
    required StocksGradients? gradients,
    required StocksDefaultColors? defaultColors,
  }) => StocksDecorationsDark(
    gradients: gradients ?? this.gradients,
    defaultColors: defaultColors ?? this.defaultColors,
  );
}

class StocksDecorationsLight extends StocksDecorations {
  const StocksDecorationsLight({
    StocksGradients gradients = const StocksGradientsDark(),
    StocksDefaultColors defaultColors = const StocksDefaultColorsDark(),
  }) : super(gradients: gradients, defaultColors: defaultColors);

  @override
  StocksDecorations copyWith({
    required StocksGradients? gradients,
    required StocksDefaultColors? defaultColors,
  }) => StocksDecorationsLight(
    gradients: gradients ?? this.gradients,
    defaultColors: defaultColors ?? this.defaultColors,
  );
}

sealed class StocksGradients {
  const StocksGradients({
    required this.background,
    required this.positiveTrendGradientFill,
    required this.positiveTrendGradientFill2,
    required this.negativeTrendGradientFill,
  });

  final BoxDecoration background;
  final BoxDecoration positiveTrendGradientFill;
  final BoxDecoration positiveTrendGradientFill2;
  final BoxDecoration negativeTrendGradientFill;

  StocksGradients lerp(StocksGradients b, double t) {
    if (identical(this, b)) {
      return this;
    }
    final instance = t < 0.5 ? this : b;
    return instance.copyWith(
      background: BoxDecoration.lerp(background, b.background, t),
      positiveTrendGradientFill: BoxDecoration.lerp(
        positiveTrendGradientFill,
        b.positiveTrendGradientFill,
        t,
      ),
      positiveTrendGradientFill2: BoxDecoration.lerp(
        positiveTrendGradientFill2,
        b.positiveTrendGradientFill2,
        t,
      ),
      negativeTrendGradientFill: BoxDecoration.lerp(
        negativeTrendGradientFill,
        b.negativeTrendGradientFill,
        t,
      ),
    );
  }

  StocksGradients copyWith({
    BoxDecoration? background,
    BoxDecoration? positiveTrendGradientFill,
    BoxDecoration? positiveTrendGradientFill2,
    BoxDecoration? negativeTrendGradientFill,
  });
}

final class StocksGradientsLight extends StocksGradients {
  const StocksGradientsLight({
    BoxDecoration background = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF1A1A1A), const Color(0xFF0D0D0D)],
      ),
    ),
    BoxDecoration positiveTrendGradientFill = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color.fromRGBO(52, 200, 90, 0.58),
          const Color(0xFF34C85A),
        ],
      ),
    ),
    BoxDecoration positiveTrendGradientFill2 = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color.fromRGBO(52, 200, 90, 0.48),
          const Color.fromRGBO(52, 200, 90, 0),
        ],
      ),
    ),
    BoxDecoration negativeTrendGradientFill = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color.fromRGBO(253, 59, 49, 0.56),
          const Color.fromRGBO(253, 59, 49, 0),
        ],
      ),
    ),
  }) : super(
         background: background,
         positiveTrendGradientFill: positiveTrendGradientFill,
         positiveTrendGradientFill2: positiveTrendGradientFill2,
         negativeTrendGradientFill: negativeTrendGradientFill,
       );

  StocksGradients copyWith({
    BoxDecoration? background,
    BoxDecoration? positiveTrendGradientFill,
    BoxDecoration? positiveTrendGradientFill2,
    BoxDecoration? negativeTrendGradientFill,
  }) => StocksGradientsLight(
    background: background ?? this.background,
    positiveTrendGradientFill:
        positiveTrendGradientFill ?? this.positiveTrendGradientFill,
    positiveTrendGradientFill2:
        positiveTrendGradientFill2 ?? this.positiveTrendGradientFill2,
    negativeTrendGradientFill:
        negativeTrendGradientFill ?? this.negativeTrendGradientFill,
  );
}

final class StocksGradientsDark extends StocksGradients {
  const StocksGradientsDark({
    BoxDecoration background = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF1A1A1A), const Color(0xFF0D0D0D)],
      ),
    ),
    BoxDecoration positiveTrendGradientFill = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color.fromRGBO(52, 200, 90, 0.58),
          const Color(0xFF34C85A),
        ],
      ),
    ),
    BoxDecoration positiveTrendGradientFill2 = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color.fromRGBO(52, 200, 90, 0.48),
          const Color.fromRGBO(52, 200, 90, 0),
        ],
      ),
    ),
    BoxDecoration negativeTrendGradientFill = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color.fromRGBO(253, 59, 49, 0.56),
          const Color.fromRGBO(253, 59, 49, 0),
        ],
      ),
    ),
  }) : super(
         background: background,
         positiveTrendGradientFill: positiveTrendGradientFill,
         positiveTrendGradientFill2: positiveTrendGradientFill2,
         negativeTrendGradientFill: negativeTrendGradientFill,
       );

  StocksGradients copyWith({
    BoxDecoration? background,
    BoxDecoration? positiveTrendGradientFill,
    BoxDecoration? positiveTrendGradientFill2,
    BoxDecoration? negativeTrendGradientFill,
  }) => StocksGradientsDark(
    background: background ?? this.background,
    positiveTrendGradientFill:
        positiveTrendGradientFill ?? this.positiveTrendGradientFill,
    positiveTrendGradientFill2:
        positiveTrendGradientFill2 ?? this.positiveTrendGradientFill2,
    negativeTrendGradientFill:
        negativeTrendGradientFill ?? this.negativeTrendGradientFill,
  );
}

sealed class StocksDefaultColors {
  const StocksDefaultColors({
    required this.primary,
    required this.secondary,
    required this.positiveTrend,
    required this.negativeTrend,
    required this.axisLabels,
    required this.separator,
  });

  final Color primary;
  final Color secondary;
  final Color positiveTrend;
  final Color negativeTrend;
  final Color axisLabels;
  final Color separator;

  StocksDefaultColors lerp(StocksDefaultColors b, double t) {
    if (identical(this, b)) {
      return this;
    }
    final instance = t < 0.5 ? this : b;
    return instance.copyWith(
      primary: Color.lerp(primary, b.primary, t),
      secondary: Color.lerp(secondary, b.secondary, t),
      positiveTrend: Color.lerp(positiveTrend, b.positiveTrend, t),
      negativeTrend: Color.lerp(negativeTrend, b.negativeTrend, t),
      axisLabels: Color.lerp(axisLabels, b.axisLabels, t),
      separator: Color.lerp(separator, b.separator, t),
    );
  }

  StocksDefaultColors copyWith({
    Color? primary,
    Color? secondary,
    Color? positiveTrend,
    Color? negativeTrend,
    Color? axisLabels,
    Color? separator,
  });
}

final class StocksDefaultColorsLight extends StocksDefaultColors {
  const StocksDefaultColorsLight({
    Color primary = const Color(0xFFFFFFFF),
    Color secondary = const Color(0xFF939298),
    Color positiveTrend = const Color(0xFF34C85A),
    Color negativeTrend = const Color(0xFFFD3B31),
    Color axisLabels = const Color(0xFF56565A),
    Color separator = const Color(0xFF36353A),
  }) : super(
         primary: primary,
         secondary: secondary,
         positiveTrend: positiveTrend,
         negativeTrend: negativeTrend,
         axisLabels: axisLabels,
         separator: separator,
       );

  StocksDefaultColors copyWith({
    Color? primary,
    Color? secondary,
    Color? positiveTrend,
    Color? negativeTrend,
    Color? axisLabels,
    Color? separator,
  }) => StocksDefaultColorsLight(
    primary: primary ?? this.primary,
    secondary: secondary ?? this.secondary,
    positiveTrend: positiveTrend ?? this.positiveTrend,
    negativeTrend: negativeTrend ?? this.negativeTrend,
    axisLabels: axisLabels ?? this.axisLabels,
    separator: separator ?? this.separator,
  );
}

final class StocksDefaultColorsDark extends StocksDefaultColors {
  const StocksDefaultColorsDark({
    Color primary = const Color(0xFFFFFFFF),
    Color secondary = const Color(0xFF939298),
    Color positiveTrend = const Color(0xFF34C85A),
    Color negativeTrend = const Color(0xFFFD3B31),
    Color axisLabels = const Color(0xFF56565A),
    Color separator = const Color(0xFF36353A),
  }) : super(
         primary: primary,
         secondary: secondary,
         positiveTrend: positiveTrend,
         negativeTrend: negativeTrend,
         axisLabels: axisLabels,
         separator: separator,
       );

  StocksDefaultColors copyWith({
    Color? primary,
    Color? secondary,
    Color? positiveTrend,
    Color? negativeTrend,
    Color? axisLabels,
    Color? separator,
  }) => StocksDefaultColorsDark(
    primary: primary ?? this.primary,
    secondary: secondary ?? this.secondary,
    positiveTrend: positiveTrend ?? this.positiveTrend,
    negativeTrend: negativeTrend ?? this.negativeTrend,
    axisLabels: axisLabels ?? this.axisLabels,
    separator: separator ?? this.separator,
  );
}
