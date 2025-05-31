part of 'colors.dart';

sealed class AppStoreDecorations {
  const AppStoreDecorations({
    required this.backgroundColors,
    required this.defaultColors,
  });

  final AppStoreBackgroundsColors backgroundColors;
  final AppStoreDefaultColors defaultColors;

  AppStoreDecorations lerp(AppStoreDecorations b, double t) {
    if (identical(this, b)) {
      return this;
    }
    final instance = t < 0.5 ? this : b;
    return instance.copyWith(
      backgroundColors: backgroundColors.lerp(b.backgroundColors, t),
      defaultColors: defaultColors.lerp(b.defaultColors, t),
    );
  }

  AppStoreDecorations copyWith({
    required AppStoreBackgroundsColors? backgroundColors,
    required AppStoreDefaultColors? defaultColors,
  });
}

class AppStoreDecorationsDark extends AppStoreDecorations {
  const AppStoreDecorationsDark({
    AppStoreBackgroundsColors backgroundColors =
        const AppStoreBackgroundsColorsDark(),
    AppStoreDefaultColors defaultColors = const AppStoreDefaultColorsDark(),
  }) : super(backgroundColors: backgroundColors, defaultColors: defaultColors);

  @override
  AppStoreDecorations copyWith({
    required AppStoreBackgroundsColors? backgroundColors,
    required AppStoreDefaultColors? defaultColors,
  }) => AppStoreDecorationsDark(
    backgroundColors: backgroundColors ?? this.backgroundColors,
    defaultColors: defaultColors ?? this.defaultColors,
  );
}

class AppStoreDecorationsLight extends AppStoreDecorations {
  const AppStoreDecorationsLight({
    AppStoreBackgroundsColors backgroundColors =
        const AppStoreBackgroundsColorsLight(),
    AppStoreDefaultColors defaultColors = const AppStoreDefaultColorsLight(),
  }) : super(backgroundColors: backgroundColors, defaultColors: defaultColors);

  @override
  AppStoreDecorations copyWith({
    required AppStoreBackgroundsColors? backgroundColors,
    required AppStoreDefaultColors? defaultColors,
  }) => AppStoreDecorationsLight(
    backgroundColors: backgroundColors ?? this.backgroundColors,
    defaultColors: defaultColors ?? this.defaultColors,
  );
}

sealed class AppStoreBackgroundsColors {
  const AppStoreBackgroundsColors({
    required this.primaryGradientLarge,
    required this.primaryGradientMedium,
    required this.primaryGradientSmall,
    required this.secondaryGradient,
  });

  final BoxDecoration primaryGradientLarge;
  final BoxDecoration primaryGradientMedium;
  final BoxDecoration primaryGradientSmall;
  final BoxDecoration secondaryGradient;

  AppStoreBackgroundsColors lerp(AppStoreBackgroundsColors b, double t) {
    if (identical(this, b)) {
      return this;
    }
    final instance = t < 0.5 ? this : b;
    return instance.copyWith(
      primaryGradientLarge: BoxDecoration.lerp(
        primaryGradientLarge,
        b.primaryGradientLarge,
        t,
      ),
      primaryGradientMedium: BoxDecoration.lerp(
        primaryGradientMedium,
        b.primaryGradientMedium,
        t,
      ),
      primaryGradientSmall: BoxDecoration.lerp(
        primaryGradientSmall,
        b.primaryGradientSmall,
        t,
      ),
      secondaryGradient: BoxDecoration.lerp(
        secondaryGradient,
        b.secondaryGradient,
        t,
      ),
    );
  }

  AppStoreBackgroundsColors copyWith({
    BoxDecoration? primaryGradientLarge,
    BoxDecoration? primaryGradientMedium,
    BoxDecoration? primaryGradientSmall,
    BoxDecoration? secondaryGradient,
  });
}

final class AppStoreBackgroundsColorsLight extends AppStoreBackgroundsColors {
  const AppStoreBackgroundsColorsLight({
    BoxDecoration primaryGradientLarge = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF21C6FE), const Color(0xFF1971EF)],
      ),
    ),
    BoxDecoration primaryGradientMedium = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF21C6FE), const Color(0xFF1971EF)],
      ),
    ),
    BoxDecoration primaryGradientSmall = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF21C6FE), const Color(0xFF1971EF)],
      ),
    ),
    BoxDecoration secondaryGradient = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF0FC3F6), const Color(0xFF139AEC)],
      ),
    ),
  }) : super(
         primaryGradientLarge: primaryGradientLarge,
         primaryGradientMedium: primaryGradientMedium,
         primaryGradientSmall: primaryGradientSmall,
         secondaryGradient: secondaryGradient,
       );

  AppStoreBackgroundsColors copyWith({
    BoxDecoration? primaryGradientLarge,
    BoxDecoration? primaryGradientMedium,
    BoxDecoration? primaryGradientSmall,
    BoxDecoration? secondaryGradient,
  }) => AppStoreBackgroundsColorsLight(
    primaryGradientLarge: primaryGradientLarge ?? this.primaryGradientLarge,
    primaryGradientMedium: primaryGradientMedium ?? this.primaryGradientMedium,
    primaryGradientSmall: primaryGradientSmall ?? this.primaryGradientSmall,
    secondaryGradient: secondaryGradient ?? this.secondaryGradient,
  );
}

final class AppStoreBackgroundsColorsDark extends AppStoreBackgroundsColors {
  const AppStoreBackgroundsColorsDark({
    BoxDecoration primaryGradientLarge = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF333333), const Color(0xFF191919)],
      ),
    ),
    BoxDecoration primaryGradientMedium = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF333333), const Color(0xFF000000)],
      ),
    ),
    BoxDecoration primaryGradientSmall = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF333333), const Color(0xFF000000)],
      ),
    ),

    BoxDecoration secondaryGradient = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF474747), const Color(0xFF000000)],
      ),
    ),
  }) : super(
         primaryGradientLarge: primaryGradientLarge,
         primaryGradientMedium: primaryGradientMedium,
         primaryGradientSmall: primaryGradientSmall,
         secondaryGradient: secondaryGradient,
       );

  AppStoreBackgroundsColors copyWith({
    BoxDecoration? primaryGradientLarge,
    BoxDecoration? primaryGradientMedium,
    BoxDecoration? primaryGradientSmall,
    BoxDecoration? secondaryGradient,
  }) => AppStoreBackgroundsColorsDark(
    primaryGradientLarge: primaryGradientLarge ?? this.primaryGradientLarge,
    primaryGradientMedium: primaryGradientMedium ?? this.primaryGradientMedium,
    primaryGradientSmall: primaryGradientSmall ?? this.primaryGradientSmall,
    secondaryGradient: secondaryGradient ?? this.secondaryGradient,
  );
}

sealed class AppStoreDefaultColors {
  const AppStoreDefaultColors({
    required this.baseWhite,
    required this.baseBlack,
    required this.title,
    required this.overline,
    required this.backgroundOverlay,
    required this.backgroundOverlayStroke,
  });

  final Color baseWhite;
  final Color baseBlack;
  final Color title;
  final Color overline;
  final Color backgroundOverlay;
  final Color backgroundOverlayStroke;

  AppStoreDefaultColors lerp(AppStoreDefaultColors b, double t) {
    if (identical(this, b)) {
      return this;
    }
    final instance = t < 0.5 ? this : b;
    return instance.copyWith(
      baseWhite: Color.lerp(baseWhite, b.baseWhite, t),
      baseBlack: Color.lerp(baseBlack, b.baseBlack, t),
      title: Color.lerp(title, b.title, t),
      overline: Color.lerp(overline, b.overline, t),
      backgroundOverlay: Color.lerp(backgroundOverlay, b.backgroundOverlay, t),
      backgroundOverlayStroke: Color.lerp(
        backgroundOverlayStroke,
        b.backgroundOverlayStroke,
        t,
      ),
    );
  }

  AppStoreDefaultColors copyWith({
    Color? baseWhite,
    Color? baseBlack,
    Color? title,
    Color? overline,
    Color? backgroundOverlay,
    Color? backgroundOverlayStroke,
  });
}

final class AppStoreDefaultColorsLight extends AppStoreDefaultColors {
  const AppStoreDefaultColorsLight({
    Color baseWhite = const Color(0xFFFFFFFF),
    Color baseBlack = const Color(0xFF000000),
    Color title = const Color.fromRGBO(0, 0, 0, .08),
    Color overline = const Color.fromRGBO(174, 174, 174, 0.74),
    Color backgroundOverlay = const Color.fromRGBO(0, 0, 0, 0.1),
    Color backgroundOverlayStroke = const Color.fromRGBO(0, 0, 0, 0.08),
  }) : super(
         baseWhite: baseWhite,
         baseBlack: baseBlack,
         title: title,
         overline: overline,
         backgroundOverlay: backgroundOverlay,
         backgroundOverlayStroke: backgroundOverlayStroke,
       );

  AppStoreDefaultColors copyWith({
    Color? baseWhite,
    Color? baseBlack,
    Color? title,
    Color? overline,
    Color? backgroundOverlay,
    Color? backgroundOverlayStroke,
  }) => AppStoreDefaultColorsLight(
    baseWhite: baseWhite ?? this.baseWhite,
    baseBlack: baseBlack ?? this.baseBlack,
    title: title ?? this.title,
    overline: overline ?? this.overline,
    backgroundOverlay: backgroundOverlay ?? this.backgroundOverlay,
    backgroundOverlayStroke:
        backgroundOverlayStroke ?? this.backgroundOverlayStroke,
  );
}

final class AppStoreDefaultColorsDark extends AppStoreDefaultColors {
  const AppStoreDefaultColorsDark({
    Color baseWhite = const Color(0xFFFFFFFF),
    Color baseBlack = const Color(0xFF000000),
    Color title = const Color.fromRGBO(0, 0, 0, .08),
    Color overline = const Color.fromRGBO(255, 255, 255, 0.07),
    Color backgroundOverlay = const Color.fromRGBO(0, 0, 0, 0.2),
    Color backgroundOverlayStroke = const Color.fromRGBO(0, 0, 0, 0.08),
  }) : super(
         baseWhite: baseWhite,
         baseBlack: baseBlack,
         title: title,
         overline: overline,
         backgroundOverlay: backgroundOverlay,
         backgroundOverlayStroke: backgroundOverlayStroke,
       );

  AppStoreDefaultColors copyWith({
    Color? baseWhite,
    Color? baseBlack,
    Color? title,
    Color? overline,
    Color? backgroundOverlay,
    Color? backgroundOverlayStroke,
  }) => AppStoreDefaultColorsDark(
    baseWhite: baseWhite ?? this.baseWhite,
    baseBlack: baseBlack ?? this.baseBlack,
    title: title ?? this.title,
    overline: overline ?? this.overline,
    backgroundOverlay: backgroundOverlay ?? this.backgroundOverlay,
    backgroundOverlayStroke:
        backgroundOverlayStroke ?? this.backgroundOverlayStroke,
  );
}
