part of 'colors.dart';

sealed class DefaultColors {
  const DefaultColors({
    required this.systemRed,
    required this.systemOrange,
    required this.systemYellow,
    required this.systemGreen,
    required this.systemTeal,
    required this.systemBlue,
    required this.systemIndigo,
    required this.systemPurple,
    required this.systemPink,
    required this.systemBlack,
    required this.systemWhite,
    required this.systemGray01,
    required this.systemGray02,
    required this.systemGray03,
    required this.systemGray04,
    required this.systemGray05,
    required this.systemGray06,
  });

  final Color systemRed;
  final Color systemOrange;
  final Color systemYellow;
  final Color systemGreen;
  final Color systemTeal;
  final Color systemBlue;
  final Color systemIndigo;
  final Color systemPurple;
  final Color systemPink;
  final Color systemBlack;
  final Color systemWhite;
  final Color systemGray01;
  final Color systemGray02;
  final Color systemGray03;
  final Color systemGray04;
  final Color systemGray05;
  final Color systemGray06;

  DefaultColors lerp(DefaultColors b, double t) {
    final instance = t < 0.5 ? this : b;
    return instance.copyWith(
      systemRed: Color.lerp(systemRed, b.systemRed, t),
      systemOrange: Color.lerp(systemOrange, b.systemOrange, t),
      systemYellow: Color.lerp(systemYellow, b.systemYellow, t),
      systemGreen: Color.lerp(systemGreen, b.systemGreen, t),
      systemTeal: Color.lerp(systemTeal, b.systemTeal, t),
      systemBlue: Color.lerp(systemBlue, b.systemBlue, t),
      systemIndigo: Color.lerp(systemIndigo, b.systemIndigo, t),
      systemPurple: Color.lerp(systemPurple, b.systemPurple, t),
      systemPink: Color.lerp(systemPink, b.systemPink, t),
      systemBlack: Color.lerp(systemBlack, b.systemBlack, t),
      systemWhite: Color.lerp(systemWhite, b.systemWhite, t),
      systemGray01: Color.lerp(systemGray01, b.systemGray01, t),
      systemGray02: Color.lerp(systemGray02, b.systemGray02, t),
      systemGray03: Color.lerp(systemGray03, b.systemGray03, t),
      systemGray04: Color.lerp(systemGray04, b.systemGray04, t),
      systemGray05: Color.lerp(systemGray05, b.systemGray05, t),
      systemGray06: Color.lerp(systemGray06, b.systemGray06, t),
    );
  }

  DefaultColors copyWith({
    Color? systemRed,
    Color? systemOrange,
    Color? systemYellow,
    Color? systemGreen,
    Color? systemTeal,
    Color? systemBlue,
    Color? systemIndigo,
    Color? systemPurple,
    Color? systemPink,
    Color? systemBlack,
    Color? systemWhite,
    Color? systemGray01,
    Color? systemGray02,
    Color? systemGray03,
    Color? systemGray04,
    Color? systemGray05,
    Color? systemGray06,
  });
}

final class DefaultColorsLight extends DefaultColors {
  const DefaultColorsLight({
    Color? systemRed,
    Color? systemOrange,
    Color? systemYellow,
    Color? systemGreen,
    Color? systemTeal,
    Color? systemBlue,
    Color? systemIndigo,
    Color? systemPurple,
    Color? systemPink,
    Color? systemBlack,
    Color? systemWhite,
    Color? systemGray01,
    Color? systemGray02,
    Color? systemGray03,
    Color? systemGray04,
    Color? systemGray05,
    Color? systemGray06,
  }) : super(
          systemRed: systemRed ?? const Color(0xFFFF3B30),
          systemOrange: systemOrange ?? const Color(0xFFFF9500),
          systemYellow: systemYellow ?? const Color(0xFFFFCC00),
          systemGreen: systemGreen ?? const Color(0xFF34C759),
          systemTeal: systemTeal ?? const Color(0xFF5AC8FA),
          systemBlue: systemBlue ?? const Color(0xFF007AFF),
          systemIndigo: systemIndigo ?? const Color(0xFF5856D6),
          systemPurple: systemPurple ?? const Color(0xFFAF52DE),
          systemPink: systemPink ?? const Color(0xFFFF2D55),
          systemBlack: systemBlack ?? const Color(0xFF000000),
          systemWhite: systemWhite ?? const Color(0xFFFFFFFF),
          systemGray01: systemGray01 ?? const Color(0xFF8E8E93),
          systemGray02: systemGray02 ?? const Color(0xFFAEAEB2),
          systemGray03: systemGray03 ?? const Color(0xFFC7C7CC),
          systemGray04: systemGray04 ?? const Color(0xFFD1D1D6),
          systemGray05: systemGray05 ?? const Color(0xFFE5E5EA),
          systemGray06: systemGray06 ?? const Color(0xFFF2F2F7),
        );

  @override
  DefaultColors copyWith({
    Color? systemRed,
    Color? systemOrange,
    Color? systemYellow,
    Color? systemGreen,
    Color? systemTeal,
    Color? systemBlue,
    Color? systemIndigo,
    Color? systemPurple,
    Color? systemPink,
    Color? systemBlack,
    Color? systemWhite,
    Color? systemGray01,
    Color? systemGray02,
    Color? systemGray03,
    Color? systemGray04,
    Color? systemGray05,
    Color? systemGray06,
  }) =>
      DefaultColorsLight(
        systemRed: systemRed ?? this.systemRed,
        systemOrange: systemOrange ?? this.systemOrange,
        systemYellow: systemYellow ?? this.systemYellow,
        systemGreen: systemGreen ?? this.systemGreen,
        systemTeal: systemTeal ?? this.systemTeal,
        systemBlue: systemBlue ?? this.systemBlue,
        systemIndigo: systemIndigo ?? this.systemIndigo,
        systemPurple: systemPurple ?? this.systemPurple,
        systemPink: systemPink ?? this.systemPink,
        systemBlack: systemBlack ?? this.systemBlack,
        systemWhite: systemWhite ?? this.systemWhite,
        systemGray01: systemGray01 ?? this.systemGray01,
        systemGray02: systemGray02 ?? this.systemGray02,
        systemGray03: systemGray03 ?? this.systemGray03,
        systemGray04: systemGray04 ?? this.systemGray04,
        systemGray05: systemGray05 ?? this.systemGray05,
        systemGray06: systemGray06 ?? this.systemGray06,
      );
}

final class DefaultColorsDark extends DefaultColors {
  const DefaultColorsDark({
    Color? systemRed,
    Color? systemOrange,
    Color? systemYellow,
    Color? systemGreen,
    Color? systemTeal,
    Color? systemBlue,
    Color? systemIndigo,
    Color? systemPurple,
    Color? systemPink,
    Color? systemBlack,
    Color? systemWhite,
    Color? systemGray01,
    Color? systemGray02,
    Color? systemGray03,
    Color? systemGray04,
    Color? systemGray05,
    Color? systemGray06,
  }) : super(
          systemRed: systemRed ?? const Color(0xFFFF453A),
          systemOrange: systemOrange ?? const Color(0xFFFF9F0A),
          systemYellow: systemYellow ?? const Color(0xFFFFD60A),
          systemGreen: systemGreen ?? const Color(0xFF32D74B),
          systemTeal: systemTeal ?? const Color(0xFF64D2FF),
          systemBlue: systemBlue ?? const Color(0xFF0A84FF),
          systemIndigo: systemIndigo ?? const Color(0xFF5E5CE6),
          systemPurple: systemPurple ?? const Color(0xFFBF5AF2),
          systemPink: systemPink ?? const Color(0xFFFF2D55),
          systemBlack: systemBlack ?? const Color(0xFF000000),
          systemWhite: systemWhite ?? const Color(0xFFFFFFFF),
          systemGray01: systemGray01 ?? const Color(0xFF8E8E93),
          systemGray02: systemGray02 ?? const Color(0xFF636366),
          systemGray03: systemGray03 ?? const Color(0xFF48484A),
          systemGray04: systemGray04 ?? const Color(0xFF3A3A3C),
          systemGray05: systemGray05 ?? const Color(0xFF2C2C2E),
          systemGray06: systemGray06 ?? const Color(0xFF1C1C1E),
        );

  @override
  DefaultColors copyWith({
    Color? systemRed,
    Color? systemOrange,
    Color? systemYellow,
    Color? systemGreen,
    Color? systemTeal,
    Color? systemBlue,
    Color? systemIndigo,
    Color? systemPurple,
    Color? systemPink,
    Color? systemBlack,
    Color? systemWhite,
    Color? systemGray01,
    Color? systemGray02,
    Color? systemGray03,
    Color? systemGray04,
    Color? systemGray05,
    Color? systemGray06,
  }) =>
      DefaultColorsDark(
        systemRed: systemRed ?? this.systemRed,
        systemOrange: systemOrange ?? this.systemOrange,
        systemYellow: systemYellow ?? this.systemYellow,
        systemGreen: systemGreen ?? this.systemGreen,
        systemTeal: systemTeal ?? this.systemTeal,
        systemBlue: systemBlue ?? this.systemBlue,
        systemIndigo: systemIndigo ?? this.systemIndigo,
        systemPurple: systemPurple ?? this.systemPurple,
        systemPink: systemPink ?? this.systemPink,
        systemBlack: systemBlack ?? this.systemBlack,
        systemWhite: systemWhite ?? this.systemWhite,
        systemGray01: systemGray01 ?? this.systemGray01,
        systemGray02: systemGray02 ?? this.systemGray02,
        systemGray03: systemGray03 ?? this.systemGray03,
        systemGray04: systemGray04 ?? this.systemGray04,
        systemGray05: systemGray05 ?? this.systemGray05,
        systemGray06: systemGray06 ?? this.systemGray06,
      );
}

sealed class DefaultSystemBackgroundsColors {
  const DefaultSystemBackgroundsColors({
    required this.primaryLight,
    required this.primaryDarkBase,
    required this.primaryDarkElevated,
    required this.secondaryLight,
    required this.secondaryDarkBase,
    required this.secondaryDarkElevated,
    required this.tertiaryLight,
    required this.tertiaryDarkBase,
    required this.tertiaryDarkElevated,
  });

  final Color primaryLight;
  final Color primaryDarkBase;
  final Color primaryDarkElevated;
  final Color secondaryLight;
  final Color secondaryDarkBase;
  final Color secondaryDarkElevated;
  final Color tertiaryLight;
  final Color tertiaryDarkBase;
  final Color tertiaryDarkElevated;

  DefaultSystemBackgroundsColors lerp(
    DefaultSystemBackgroundsColors b,
    double t,
  ) =>
      copyWith(
        primaryLight: Color.lerp(primaryLight, b.primaryLight, t),
        primaryDarkBase: Color.lerp(primaryDarkBase, b.primaryDarkBase, t),
        primaryDarkElevated:
            Color.lerp(primaryDarkElevated, b.primaryDarkElevated, t),
        secondaryLight: Color.lerp(secondaryLight, b.secondaryLight, t),
        secondaryDarkBase:
            Color.lerp(secondaryDarkBase, b.secondaryDarkBase, t),
        secondaryDarkElevated:
            Color.lerp(secondaryDarkElevated, b.secondaryDarkElevated, t),
        tertiaryLight: Color.lerp(tertiaryLight, b.tertiaryLight, t),
        tertiaryDarkBase: Color.lerp(tertiaryDarkBase, b.tertiaryDarkBase, t),
        tertiaryDarkElevated:
            Color.lerp(tertiaryDarkElevated, b.tertiaryDarkElevated, t),
      );

  DefaultSystemBackgroundsColors copyWith({
    Color? primaryLight,
    Color? primaryDarkBase,
    Color? primaryDarkElevated,
    Color? secondaryLight,
    Color? secondaryDarkBase,
    Color? secondaryDarkElevated,
    Color? tertiaryLight,
    Color? tertiaryDarkBase,
    Color? tertiaryDarkElevated,
  });
}

final class DefaultSystemBackgroundsColorsLight
    extends DefaultSystemBackgroundsColors {
  const DefaultSystemBackgroundsColorsLight({
    Color? primaryLight,
    Color? primaryDarkBase,
    Color? primaryDarkElevated,
    Color? secondaryLight,
    Color? secondaryDarkBase,
    Color? secondaryDarkElevated,
    Color? tertiaryLight,
    Color? tertiaryDarkBase,
    Color? tertiaryDarkElevated,
  }) : super(
          primaryLight: primaryLight ?? const Color(0xFFFFFFFF),
          primaryDarkBase: primaryDarkBase ?? const Color(0xFF000000),
          primaryDarkElevated: primaryDarkElevated ?? const Color(0xFF1C1C1E),
          secondaryLight: secondaryLight ?? const Color(0xFFF2F2F7),
          secondaryDarkBase: secondaryDarkBase ?? const Color(0xFF1C1C1E),
          secondaryDarkElevated:
              secondaryDarkElevated ?? const Color(0xFF2C2C2E),
          tertiaryLight: tertiaryLight ?? const Color(0xFFFFFFFF),
          tertiaryDarkBase: tertiaryDarkBase ?? const Color(0xFF2C2C2E),
          tertiaryDarkElevated: tertiaryDarkElevated ?? const Color(0xFF3A3A3C),
        );

  @override
  DefaultSystemBackgroundsColors copyWith({
    Color? primaryLight,
    Color? primaryDarkBase,
    Color? primaryDarkElevated,
    Color? secondaryLight,
    Color? secondaryDarkBase,
    Color? secondaryDarkElevated,
    Color? tertiaryLight,
    Color? tertiaryDarkBase,
    Color? tertiaryDarkElevated,
  }) =>
      DefaultSystemBackgroundsColorsLight(
        primaryLight: primaryLight ?? this.primaryLight,
        primaryDarkBase: primaryDarkBase ?? this.primaryDarkBase,
        primaryDarkElevated: primaryDarkElevated ?? this.primaryDarkElevated,
        secondaryLight: secondaryLight ?? this.secondaryLight,
        secondaryDarkBase: secondaryDarkBase ?? this.secondaryDarkBase,
        secondaryDarkElevated:
            secondaryDarkElevated ?? this.secondaryDarkElevated,
        tertiaryLight: tertiaryLight ?? this.tertiaryLight,
        tertiaryDarkBase: tertiaryDarkBase ?? this.tertiaryDarkBase,
        tertiaryDarkElevated: tertiaryDarkElevated ?? this.tertiaryDarkElevated,
      );
}

final class DefaultSystemBackgroundsColorsDark
    extends DefaultSystemBackgroundsColors {
  const DefaultSystemBackgroundsColorsDark({
    Color? primaryLight,
    Color? primaryDarkBase,
    Color? primaryDarkElevated,
    Color? secondaryLight,
    Color? secondaryDarkBase,
    Color? secondaryDarkElevated,
    Color? tertiaryLight,
    Color? tertiaryDarkBase,
    Color? tertiaryDarkElevated,
  }) : super(
          primaryLight: primaryLight ?? const Color(0xFFFFFFFF),
          primaryDarkBase: primaryDarkBase ?? const Color(0xFF000000),
          primaryDarkElevated: primaryDarkElevated ?? const Color(0xFF1C1C1E),
          secondaryLight: secondaryLight ?? const Color(0xFFF2F2F7),
          secondaryDarkBase: secondaryDarkBase ?? const Color(0xFF1C1C1E),
          secondaryDarkElevated:
              secondaryDarkElevated ?? const Color(0xFF2C2C2E),
          tertiaryLight: tertiaryLight ?? const Color(0xFFFFFFFF),
          tertiaryDarkBase: tertiaryDarkBase ?? const Color(0xFF2C2C2E),
          tertiaryDarkElevated: tertiaryDarkElevated ?? const Color(0xFF3A3A3C),
        );

  @override
  DefaultSystemBackgroundsColors copyWith({
    Color? primaryLight,
    Color? primaryDarkBase,
    Color? primaryDarkElevated,
    Color? secondaryLight,
    Color? secondaryDarkBase,
    Color? secondaryDarkElevated,
    Color? tertiaryLight,
    Color? tertiaryDarkBase,
    Color? tertiaryDarkElevated,
  }) =>
      DefaultSystemBackgroundsColorsDark(
        primaryLight: primaryLight ?? this.primaryLight,
        primaryDarkBase: primaryDarkBase ?? this.primaryDarkBase,
        primaryDarkElevated: primaryDarkElevated ?? this.primaryDarkElevated,
        secondaryLight: secondaryLight ?? this.secondaryLight,
        secondaryDarkBase: secondaryDarkBase ?? this.secondaryDarkBase,
        secondaryDarkElevated:
            secondaryDarkElevated ?? this.secondaryDarkElevated,
        tertiaryLight: tertiaryLight ?? this.tertiaryLight,
        tertiaryDarkBase: tertiaryDarkBase ?? this.tertiaryDarkBase,
        tertiaryDarkElevated: tertiaryDarkElevated ?? this.tertiaryDarkElevated,
      );
}

sealed class DefaultSystemGroupedBackgroundsColors {
  const DefaultSystemGroupedBackgroundsColors({
    required this.primaryLight,
    required this.primaryDarkBase,
    required this.primaryDarkElevated,
    required this.secondaryLight,
    required this.secondaryDarkBase,
    required this.secondaryDarkElevated,
    required this.tertiaryLight,
    required this.tertiaryDarkBase,
    required this.tertiaryDarkElevated,
  });

  final Color primaryLight;
  final Color primaryDarkBase;
  final Color primaryDarkElevated;
  final Color secondaryLight;
  final Color secondaryDarkBase;
  final Color secondaryDarkElevated;
  final Color tertiaryLight;
  final Color tertiaryDarkBase;
  final Color tertiaryDarkElevated;

  DefaultSystemGroupedBackgroundsColors lerp(
    DefaultSystemGroupedBackgroundsColors b,
    double t,
  ) =>
      copyWith(
        primaryLight: Color.lerp(primaryLight, b.primaryLight, t),
        primaryDarkBase: Color.lerp(primaryDarkBase, b.primaryDarkBase, t),
        primaryDarkElevated:
            Color.lerp(primaryDarkElevated, b.primaryDarkElevated, t),
        secondaryLight: Color.lerp(secondaryLight, b.secondaryLight, t),
        secondaryDarkBase:
            Color.lerp(secondaryDarkBase, b.secondaryDarkBase, t),
        secondaryDarkElevated:
            Color.lerp(secondaryDarkElevated, b.secondaryDarkElevated, t),
        tertiaryLight: Color.lerp(tertiaryLight, b.tertiaryLight, t),
        tertiaryDarkBase: Color.lerp(tertiaryDarkBase, b.tertiaryDarkBase, t),
        tertiaryDarkElevated:
            Color.lerp(tertiaryDarkElevated, b.tertiaryDarkElevated, t),
      );

  DefaultSystemGroupedBackgroundsColors copyWith({
    Color? primaryLight,
    Color? primaryDarkBase,
    Color? primaryDarkElevated,
    Color? secondaryLight,
    Color? secondaryDarkBase,
    Color? secondaryDarkElevated,
    Color? tertiaryLight,
    Color? tertiaryDarkBase,
    Color? tertiaryDarkElevated,
  });
}

final class DefaultSystemGroupedBackgroundsColorsLight
    extends DefaultSystemGroupedBackgroundsColors {
  const DefaultSystemGroupedBackgroundsColorsLight({
    Color? primaryLight,
    Color? primaryDarkBase,
    Color? primaryDarkElevated,
    Color? secondaryLight,
    Color? secondaryDarkBase,
    Color? secondaryDarkElevated,
    Color? tertiaryLight,
    Color? tertiaryDarkBase,
    Color? tertiaryDarkElevated,
  }) : super(
          primaryLight: primaryLight ?? const Color(0xFFF2F2F7),
          primaryDarkBase: primaryDarkBase ?? const Color(0xFF000000),
          primaryDarkElevated: primaryDarkElevated ?? const Color(0xFF1C1C1E),
          secondaryLight: secondaryLight ?? const Color(0xFFFFFFFF),
          secondaryDarkBase: secondaryDarkBase ?? const Color(0xFF1C1C1E),
          secondaryDarkElevated:
              secondaryDarkElevated ?? const Color(0xFF2C2C2E),
          tertiaryLight: tertiaryLight ?? const Color(0xFFF2F2F7),
          tertiaryDarkBase: tertiaryDarkBase ?? const Color(0xFF2C2C2E),
          tertiaryDarkElevated: tertiaryDarkElevated ?? const Color(0xFF3A3A3C),
        );

  @override
  DefaultSystemGroupedBackgroundsColors copyWith({
    Color? primaryLight,
    Color? primaryDarkBase,
    Color? primaryDarkElevated,
    Color? secondaryLight,
    Color? secondaryDarkBase,
    Color? secondaryDarkElevated,
    Color? tertiaryLight,
    Color? tertiaryDarkBase,
    Color? tertiaryDarkElevated,
  }) =>
      DefaultSystemGroupedBackgroundsColorsLight(
        primaryLight: primaryLight ?? this.primaryLight,
        primaryDarkBase: primaryDarkBase ?? this.primaryDarkBase,
        primaryDarkElevated: primaryDarkElevated ?? this.primaryDarkElevated,
        secondaryLight: secondaryLight ?? this.secondaryLight,
        secondaryDarkBase: secondaryDarkBase ?? this.secondaryDarkBase,
        secondaryDarkElevated:
            secondaryDarkElevated ?? this.secondaryDarkElevated,
        tertiaryLight: tertiaryLight ?? this.tertiaryLight,
        tertiaryDarkBase: tertiaryDarkBase ?? this.tertiaryDarkBase,
        tertiaryDarkElevated: tertiaryDarkElevated ?? this.tertiaryDarkElevated,
      );
}

final class DefaultSystemGroupedBackgroundsColorsDark
    extends DefaultSystemGroupedBackgroundsColors {
  const DefaultSystemGroupedBackgroundsColorsDark({
    Color? primaryLight,
    Color? primaryDarkBase,
    Color? primaryDarkElevated,
    Color? secondaryLight,
    Color? secondaryDarkBase,
    Color? secondaryDarkElevated,
    Color? tertiaryLight,
    Color? tertiaryDarkBase,
    Color? tertiaryDarkElevated,
  }) : super(
          primaryLight: primaryLight ?? const Color(0xFFF2F2F7),
          primaryDarkBase: primaryDarkBase ?? const Color(0xFF000000),
          primaryDarkElevated: primaryDarkElevated ?? const Color(0xFF1C1C1E),
          secondaryLight: secondaryLight ?? const Color(0xFFFFFFFF),
          secondaryDarkBase: secondaryDarkBase ?? const Color(0xFF1C1C1E),
          secondaryDarkElevated:
              secondaryDarkElevated ?? const Color(0xFF2C2C2E),
          tertiaryLight: tertiaryLight ?? const Color(0xFFF2F2F7),
          tertiaryDarkBase: tertiaryDarkBase ?? const Color(0xFF2C2C2E),
          tertiaryDarkElevated: tertiaryDarkElevated ?? const Color(0xFF3A3A3C),
        );

  @override
  DefaultSystemGroupedBackgroundsColors copyWith({
    Color? primaryLight,
    Color? primaryDarkBase,
    Color? primaryDarkElevated,
    Color? secondaryLight,
    Color? secondaryDarkBase,
    Color? secondaryDarkElevated,
    Color? tertiaryLight,
    Color? tertiaryDarkBase,
    Color? tertiaryDarkElevated,
  }) =>
      DefaultSystemGroupedBackgroundsColorsDark(
        primaryLight: primaryLight ?? this.primaryLight,
        primaryDarkBase: primaryDarkBase ?? this.primaryDarkBase,
        primaryDarkElevated: primaryDarkElevated ?? this.primaryDarkElevated,
        secondaryLight: secondaryLight ?? this.secondaryLight,
        secondaryDarkBase: secondaryDarkBase ?? this.secondaryDarkBase,
        secondaryDarkElevated:
            secondaryDarkElevated ?? this.secondaryDarkElevated,
        tertiaryLight: tertiaryLight ?? this.tertiaryLight,
        tertiaryDarkBase: tertiaryDarkBase ?? this.tertiaryDarkBase,
        tertiaryDarkElevated: tertiaryDarkElevated ?? this.tertiaryDarkElevated,
      );
}

sealed class DefaultFillColors {
  const DefaultFillColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.quartenary,
  });

  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color quartenary;

  DefaultFillColors lerp(
    DefaultFillColors b,
    double t,
  ) {
    final instance = switch (t) {
      < 0.5 => this,
      _ => b,
    };

    return instance.copyWith(
      primary: Color.lerp(primary, b.primary, t),
      secondary: Color.lerp(secondary, b.secondary, t),
      tertiary: Color.lerp(tertiary, b.tertiary, t),
      quartenary: Color.lerp(quartenary, b.quartenary, t),
    );
  }

  DefaultFillColors copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? quartenary,
  });
}

final class DefaultFillColorsLight extends DefaultFillColors {
  const DefaultFillColorsLight({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? quartenary,
  }) : super(
          primary: primary ?? const Color.fromRGBO(120, 120, 128, .2),
          secondary: secondary ?? const Color.fromRGBO(120, 120, 128, .16),
          tertiary: tertiary ?? const Color.fromRGBO(120, 120, 128, .12),
          quartenary: quartenary ?? const Color.fromRGBO(120, 120, 128, .8),
        );

  @override
  DefaultFillColors copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? quartenary,
  }) =>
      DefaultFillColorsLight(
        primary: primary,
        secondary: secondary,
        tertiary: tertiary,
        quartenary: quartenary,
      );
}

final class DefaultFillColorsDark extends DefaultFillColors {
  const DefaultFillColorsDark({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? quartenary,
  }) : super(
          primary: primary ?? const Color.fromRGBO(120, 120, 128, .36),
          secondary: secondary ?? const Color.fromRGBO(120, 120, 128, .32),
          tertiary: tertiary ?? const Color.fromRGBO(120, 120, 128, .24),
          quartenary: quartenary ?? const Color.fromRGBO(120, 120, 128, .18),
        );

  @override
  DefaultFillColors copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? quartenary,
  }) =>
      DefaultFillColorsDark(
        primary: primary,
        secondary: secondary,
        tertiary: tertiary,
        quartenary: quartenary,
      );
}

sealed class DefaultLabelColors {
  const DefaultLabelColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.quartenary,
  });

  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color quartenary;

  DefaultLabelColors lerp(
    DefaultLabelColors b,
    double t,
  ) {
    final instance = switch (t) {
      < 0.5 => this,
      _ => b,
    };

    return instance.copyWith(
      primary: Color.lerp(primary, b.primary, t),
      secondary: Color.lerp(secondary, b.secondary, t),
      tertiary: Color.lerp(tertiary, b.tertiary, t),
      quartenary: Color.lerp(quartenary, b.quartenary, t),
    );
  }

  DefaultLabelColors copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? quartenary,
  });
}

final class DefaultLabelColorsLight extends DefaultLabelColors {
  const DefaultLabelColorsLight({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? quartenary,
  }) : super(
          primary: primary ?? const Color(0xFF000000),
          secondary: secondary ?? const Color.fromRGBO(60, 60, 67, .60),
          tertiary: tertiary ?? const Color.fromRGBO(60, 60, 67, .30),
          quartenary: quartenary ?? const Color.fromRGBO(60, 60, 67, .18),
        );

  @override
  DefaultLabelColors copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? quartenary,
  }) =>
      DefaultLabelColorsLight(
        primary: primary,
        secondary: secondary,
        tertiary: tertiary,
        quartenary: quartenary,
      );
}

final class DefaultLabelColorsDark extends DefaultLabelColors {
  const DefaultLabelColorsDark({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? quartenary,
  }) : super(
          primary: primary ?? const Color(0xFFFFFFFF),
          secondary: secondary ?? const Color.fromRGBO(235, 235, 245, .60),
          tertiary: tertiary ?? const Color.fromRGBO(235, 235, 245, .30),
          quartenary: quartenary ?? const Color.fromRGBO(235, 235, 245, .18),
        );

  @override
  DefaultLabelColors copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? quartenary,
  }) =>
      DefaultLabelColorsDark(
        primary: primary,
        secondary: secondary,
        tertiary: tertiary,
        quartenary: quartenary,
      );
}

sealed class DefaultSeparatorColors {
  const DefaultSeparatorColors({
    required this.nonOpaque,
    required this.opaque,
  });

  final Color nonOpaque;
  final Color opaque;

  DefaultSeparatorColors lerp(
    DefaultSeparatorColors b,
    double t,
  ) {
    final instance = switch (t) {
      < 0.5 => this,
      _ => b,
    };

    return instance.copyWith(
      nonOpaque: Color.lerp(nonOpaque, b.nonOpaque, t),
      opaque: Color.lerp(opaque, b.opaque, t),
    );
  }

  DefaultSeparatorColors copyWith({
    Color? nonOpaque,
    Color? opaque,
  });
}

final class DefaultSeparatorColorsLight extends DefaultSeparatorColors {
  const DefaultSeparatorColorsLight({
    Color? nonOpaque,
    Color? opaque,
  }) : super(
          nonOpaque: nonOpaque ?? const Color(0xFFC6C6C8),
          opaque: opaque ?? const Color.fromRGBO(60, 60, 67, .36),
        );

  @override
  DefaultSeparatorColors copyWith({
    Color? nonOpaque,
    Color? opaque,
  }) =>
      DefaultSeparatorColorsLight(
        nonOpaque: nonOpaque,
        opaque: opaque,
      );
}

final class DefaultSeparatorColorsDark extends DefaultSeparatorColors {
  const DefaultSeparatorColorsDark({
    Color? nonOpaque,
    Color? opaque,
  }) : super(
          nonOpaque: nonOpaque ?? const Color(0xFF38383A),
          opaque: opaque ?? const Color.fromRGBO(84, 84, 88, .36),
        );

  @override
  DefaultSeparatorColors copyWith({
    Color? nonOpaque,
    Color? opaque,
  }) =>
      DefaultSeparatorColorsDark(
        nonOpaque: nonOpaque,
        opaque: opaque,
      );
}
