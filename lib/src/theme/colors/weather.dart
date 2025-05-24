part of 'colors.dart';

sealed class WeatherDecorations {
  const WeatherDecorations({
    required this.backgroundColors,
    required this.defaultColors,
  });

  final WeatherBackgroundsColors backgroundColors;
  final WeatherDefaultColors defaultColors;

  WeatherDecorations lerp(WeatherDecorations b, double t) {
    if (identical(this, b)) {
      return this;
    }
    final instance = t < 0.5 ? this : b;
    return instance.copyWith(
      backgroundColors: backgroundColors.lerp(b.backgroundColors, t),
      defaultColors: defaultColors.lerp(b.defaultColors, t),
    );
  }

  WeatherDecorations copyWith({
    required WeatherBackgroundsColors? backgroundColors,
    required WeatherDefaultColors? defaultColors,
  });
}

class WeatherDecorationsDark extends WeatherDecorations {
  const WeatherDecorationsDark({
    WeatherBackgroundsColors backgroundColors =
        const WeatherBackgroundsColorsDark(),
    WeatherDefaultColors defaultColors = const WeatherDefaultColorsDark(),
  }) : super(backgroundColors: backgroundColors, defaultColors: defaultColors);

  @override
  WeatherDecorations copyWith({
    required WeatherBackgroundsColors? backgroundColors,
    required WeatherDefaultColors? defaultColors,
  }) => WeatherDecorationsDark(
    backgroundColors: backgroundColors ?? this.backgroundColors,
    defaultColors: defaultColors ?? this.defaultColors,
  );
}

class WeatherDecorationsLight extends WeatherDecorations {
  const WeatherDecorationsLight({
    WeatherBackgroundsColors backgroundColors =
        const WeatherBackgroundsColorsDark(),
    WeatherDefaultColors defaultColors = const WeatherDefaultColorsDark(),
  }) : super(backgroundColors: backgroundColors, defaultColors: defaultColors);

  @override
  WeatherDecorations copyWith({
    required WeatherBackgroundsColors? backgroundColors,
    required WeatherDefaultColors? defaultColors,
  }) => WeatherDecorationsLight(
    backgroundColors: backgroundColors ?? this.backgroundColors,
    defaultColors: defaultColors ?? this.defaultColors,
  );
}

sealed class WeatherBackgroundsColors {
  const WeatherBackgroundsColors({
    required this.rain,
    required this.night,
    required this.day,
  });

  final BoxDecoration rain;
  final BoxDecoration night;
  final BoxDecoration day;

  WeatherBackgroundsColors lerp(WeatherBackgroundsColors b, double t) {
    if (identical(this, b)) {
      return this;
    }
    final instance = t < 0.5 ? this : b;
    return instance.copyWith(
      rain: BoxDecoration.lerp(rain, b.rain, t),
      night: BoxDecoration.lerp(night, b.night, t),
      day: BoxDecoration.lerp(day, b.day, t),
    );
  }

  WeatherBackgroundsColors copyWith({
    BoxDecoration? rain,
    BoxDecoration? night,
    BoxDecoration? day,
  });
}

final class WeatherBackgroundsColorsLight extends WeatherBackgroundsColors {
  const WeatherBackgroundsColorsLight({
    BoxDecoration rain = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF657688), const Color(0xFF4D5E70)],
      ),
    ),
    BoxDecoration night = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF020518), const Color(0xFF283555)],
      ),
    ),
    BoxDecoration day = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF1A1A1A), const Color(0xFF0D0D0D)],
      ),
    ),
  }) : super(rain: rain, night: night, day: day);

  WeatherBackgroundsColors copyWith({
    BoxDecoration? rain,
    BoxDecoration? night,
    BoxDecoration? day,
  }) => WeatherBackgroundsColorsLight(
    rain: rain ?? this.rain,
    night: night ?? this.night,
    day: day ?? this.day,
  );
}

final class WeatherBackgroundsColorsDark extends WeatherBackgroundsColors {
  const WeatherBackgroundsColorsDark({
    BoxDecoration rain = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF657688), const Color(0xFF4D5E70)],
      ),
    ),
    BoxDecoration night = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF020518), const Color(0xFF283555)],
      ),
    ),
    BoxDecoration day = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF1A1A1A), const Color(0xFF0D0D0D)],
      ),
    ),
  }) : super(rain: rain, night: night, day: day);

  WeatherBackgroundsColors copyWith({
    BoxDecoration? rain,
    BoxDecoration? night,
    BoxDecoration? day,
  }) => WeatherBackgroundsColorsDark(
    rain: rain ?? this.rain,
    night: night ?? this.night,
    day: day ?? this.day,
  );
}

sealed class WeatherDefaultColors {
  const WeatherDefaultColors({
    required this.baseWhite,
    required this.baseBlack,
    required this.baseWhite75,
    required this.baseWhite70,
    required this.chartTitle,
    required this.gridLine,
    required this.axisLabel,
    required this.separator,
    required this.hourlyTime,
    required this.sunYellow,
    required this.rainBlue,
    required this.barGradient,
  });

  final Color baseWhite;
  final Color baseBlack;
  final Color baseWhite75;
  final Color baseWhite70;
  final Color chartTitle;
  final Color gridLine;
  final Color axisLabel;
  final Color separator;
  final Color hourlyTime;
  final Color sunYellow;
  final Color rainBlue;
  final BoxDecoration barGradient;

  WeatherDefaultColors lerp(WeatherDefaultColors b, double t) {
    if (identical(this, b)) {
      return this;
    }
    final instance = t < 0.5 ? this : b;
    return instance.copyWith(
      baseWhite: Color.lerp(baseWhite, b.baseWhite, t),
      baseWhite75: Color.lerp(baseWhite75, b.baseWhite75, t),
      baseWhite70: Color.lerp(baseWhite70, b.baseWhite70, t),
      chartTitle: Color.lerp(chartTitle, b.chartTitle, t),
      gridLine: Color.lerp(gridLine, b.gridLine, t),
      axisLabel: Color.lerp(axisLabel, b.axisLabel, t),
      separator: Color.lerp(separator, b.separator, t),
      hourlyTime: Color.lerp(hourlyTime, b.hourlyTime, t),
      sunYellow: Color.lerp(sunYellow, b.sunYellow, t),
      rainBlue: Color.lerp(rainBlue, b.rainBlue, t),
      barGradient: BoxDecoration.lerp(barGradient, b.barGradient, t),
    );
  }

  WeatherDefaultColors copyWith({
    Color? baseWhite,
    Color? baseWhite75,
    Color? baseWhite70,
    Color? chartTitle,
    Color? gridLine,
    Color? axisLabel,
    Color? separator,
    Color? hourlyTime,
    Color? sunYellow,
    Color? rainBlue,
    BoxDecoration? barGradient,
  });
}

final class WeatherDefaultColorsLight extends WeatherDefaultColors {
  const WeatherDefaultColorsLight({
    Color baseWhite = const Color(0xFFFFFFFF),
    Color baseBlack = const Color(0xFFFFFFFF),
    Color baseWhite75 = const Color.fromRGBO(255, 255, 255, 0.75),
    Color baseWhite70 = const Color.fromRGBO(255, 255, 255, 0.7),
    Color chartTitle = const Color.fromRGBO(255, 255, 255, 0.56),
    Color gridLine = const Color.fromRGBO(255, 255, 255, 0.28),
    Color axisLabel = const Color.fromRGBO(255, 255, 255, 0.56),
    Color separator = const Color.fromRGBO(255, 255, 255, 0.24),
    Color hourlyTime = const Color.fromRGBO(255, 255, 255, 0.72),
    Color sunYellow = const Color(0xFFFFD409),
    Color rainBlue = const Color(0xFF63D2FF),
    BoxDecoration barGradient = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF1A1A1A), const Color(0xFF0D0D0D)],
      ),
    ),
  }) : super(
         baseWhite: baseWhite,
         baseBlack: baseBlack,
         baseWhite75: baseWhite75,
         baseWhite70: baseWhite70,
         chartTitle: chartTitle,
         gridLine: gridLine,
         axisLabel: axisLabel,
         separator: separator,
         hourlyTime: hourlyTime,
         sunYellow: sunYellow,
         rainBlue: rainBlue,
         barGradient: barGradient,
       );

  WeatherDefaultColors copyWith({
    Color? baseWhite,
    Color? baseWhite75,
    Color? baseWhite70,
    Color? chartTitle,
    Color? gridLine,
    Color? axisLabel,
    Color? separator,
    Color? hourlyTime,
    Color? divider,
    Color? sunYellow,
    Color? rainBlue,
    BoxDecoration? barGradient,
  }) => WeatherDefaultColorsLight(
    baseWhite: baseWhite ?? this.baseWhite,
    baseWhite75: baseWhite75 ?? this.baseWhite75,
    baseWhite70: baseWhite70 ?? this.baseWhite70,
    chartTitle: chartTitle ?? this.chartTitle,
    gridLine: gridLine ?? this.gridLine,
    axisLabel: axisLabel ?? this.axisLabel,
    separator: separator ?? this.separator,
    hourlyTime: hourlyTime ?? this.hourlyTime,
    sunYellow: sunYellow ?? this.sunYellow,
    rainBlue: rainBlue ?? this.rainBlue,
    barGradient: barGradient ?? this.barGradient,
  );
}

final class WeatherDefaultColorsDark extends WeatherDefaultColors {
  const WeatherDefaultColorsDark({
    Color baseWhite = const Color(0xFFFFFFFF),
    Color baseBlack = const Color(0xFFFFFFFF),
    Color baseWhite75 = const Color.fromRGBO(255, 255, 255, 0.75),
    Color baseWhite70 = const Color.fromRGBO(255, 255, 255, 0.7),
    Color chartTitle = const Color.fromRGBO(255, 255, 255, 0.56),
    Color gridLine = const Color.fromRGBO(255, 255, 255, 0.28),
    Color axisLabel = const Color.fromRGBO(255, 255, 255, 0.56),
    Color separator = const Color.fromRGBO(255, 255, 255, 0.24),
    Color hourlyTime = const Color.fromRGBO(255, 255, 255, 0.72),
    Color sunYellow = const Color(0xFFFFD409),
    Color rainBlue = const Color(0xFF63D2FF),
    BoxDecoration barGradient = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF1A1A1A), const Color(0xFF0D0D0D)],
      ),
    ),
  }) : super(
         baseWhite: baseWhite,
         baseBlack: baseBlack,
         baseWhite75: baseWhite75,
         baseWhite70: baseWhite70,
         chartTitle: chartTitle,
         gridLine: gridLine,
         axisLabel: axisLabel,
         separator: separator,
         hourlyTime: hourlyTime,
         sunYellow: sunYellow,
         rainBlue: rainBlue,
         barGradient: barGradient,
       );

  WeatherDefaultColors copyWith({
    Color? baseWhite,
    Color? baseWhite75,
    Color? baseWhite70,
    Color? chartTitle,
    Color? gridLine,
    Color? axisLabel,
    Color? separator,
    Color? hourlyTime,
    Color? divider,
    Color? sunYellow,
    Color? rainBlue,
    BoxDecoration? barGradient,
  }) => WeatherDefaultColorsLight(
    baseWhite: baseWhite ?? this.baseWhite,
    baseWhite75: baseWhite75 ?? this.baseWhite75,
    baseWhite70: baseWhite70 ?? this.baseWhite70,
    chartTitle: chartTitle ?? this.chartTitle,
    gridLine: gridLine ?? this.gridLine,
    axisLabel: axisLabel ?? this.axisLabel,
    separator: separator ?? this.separator,
    hourlyTime: hourlyTime ?? this.hourlyTime,
    sunYellow: sunYellow ?? this.sunYellow,
    rainBlue: rainBlue ?? this.rainBlue,
    barGradient: barGradient ?? this.barGradient,
  );
}
