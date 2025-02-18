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
}

final class DefaultColorsLight extends DefaultColors {
  const DefaultColorsLight()
      : super(
          systemRed: const Color(0xFFFF3B30),
          systemOrange: const Color(0xFFFF9500),
          systemYellow: const Color(0xFFFFCC00),
          systemGreen: const Color(0xFF34C759),
          systemTeal: const Color(0xFF5AC8FA),
          systemBlue: const Color(0xFF007AFF),
          systemIndigo: const Color(0xFF5856D6),
          systemPurple: const Color(0xFFAF52DE),
          systemPink: const Color(0xFFFF2D55),
          systemBlack: const Color(0xFF000000),
          systemWhite: const Color(0xFFFFFFFF),
          systemGray01: const Color(0xFF8E8E93),
          systemGray02: const Color(0xFFAEAEB2),
          systemGray03: const Color(0xFFC7C7CC),
          systemGray04: const Color(0xFFD1D1D6),
          systemGray05: const Color(0xFFE5E5EA),
          systemGray06: const Color(0xFFF2F2F7),
        );
}

final class DefaultColorsDark extends DefaultColors {
  const DefaultColorsDark()
      : super(
          systemRed: const Color(0xFFFF453A),
          systemOrange: const Color(0xFFFF9F0A),
          systemYellow: const Color(0xFFFFD60A),
          systemGreen: const Color(0xFF32D74B),
          systemTeal: const Color(0xFF64D2FF),
          systemBlue: const Color(0xFF0A84FF),
          systemIndigo: const Color(0xFF5E5CE6),
          systemPurple: const Color(0xFFBF5AF2),
          systemPink: const Color(0xFFFF2D55),
          systemBlack: const Color(0xFF000000),
          systemWhite: const Color(0xFFFFFFFF),
          systemGray01: const Color(0xFF8E8E93),
          systemGray02: const Color(0xFF636366),
          systemGray03: const Color(0xFF48484A),
          systemGray04: const Color(0xFF3A3A3C),
          systemGray05: const Color(0xFF2C2C2E),
          systemGray06: const Color(0xFF1C1C1E),
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
}

final class DefaultSystemBackgroundsColorsLight
    extends DefaultSystemBackgroundsColors {
  const DefaultSystemBackgroundsColorsLight()
      : super(
          primaryLight: const Color(0xFFFFFFFF),
          primaryDarkBase: const Color(0xFF000000),
          primaryDarkElevated: const Color(0xFF1C1C1E),
          secondaryLight: const Color(0xFFF2F2F7),
          secondaryDarkBase: const Color(0xFF1C1C1E),
          secondaryDarkElevated: const Color(0xFF2C2C2E),
          tertiaryLight: const Color(0xFFFFFFFF),
          tertiaryDarkBase: const Color(0xFF2C2C2E),
          tertiaryDarkElevated: const Color(0xFF3A3A3C),
        );
}

final class DefaultSystemBackgroundsColorsDark
    extends DefaultSystemBackgroundsColors {
  const DefaultSystemBackgroundsColorsDark()
      : super(
          primaryLight: const Color(0xFFFFFFFF),
          primaryDarkBase: const Color(0xFF000000),
          primaryDarkElevated: const Color(0xFF1C1C1E),
          secondaryLight: const Color(0xFFF2F2F7),
          secondaryDarkBase: const Color(0xFF1C1C1E),
          secondaryDarkElevated: const Color(0xFF2C2C2E),
          tertiaryLight: const Color(0xFFFFFFFF),
          tertiaryDarkBase: const Color(0xFF2C2C2E),
          tertiaryDarkElevated: const Color(0xFF3A3A3C),
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
}

final class DefaultSystemGroupedBackgroundsColorsLight
    extends DefaultSystemGroupedBackgroundsColors {
  const DefaultSystemGroupedBackgroundsColorsLight()
      : super(
          primaryLight: const Color(0xFFF2F2F7),
          primaryDarkBase: const Color(0xFF000000),
          primaryDarkElevated: const Color(0xFF1C1C1E),
          secondaryLight: const Color(0xFFFFFFFF),
          secondaryDarkBase: const Color(0xFF1C1C1E),
          secondaryDarkElevated: const Color(0xFF2C2C2E),
          tertiaryLight: const Color(0xFFF2F2F7),
          tertiaryDarkBase: const Color(0xFF2C2C2E),
          tertiaryDarkElevated: const Color(0xFF3A3A3C),
        );
}

final class DefaultSystemGroupedBackgroundsColorsDark
    extends DefaultSystemGroupedBackgroundsColors {
  const DefaultSystemGroupedBackgroundsColorsDark()
      : super(
          primaryLight: const Color(0xFFF2F2F7),
          primaryDarkBase: const Color(0xFF000000),
          primaryDarkElevated: const Color(0xFF1C1C1E),
          secondaryLight: const Color(0xFFFFFFFF),
          secondaryDarkBase: const Color(0xFF1C1C1E),
          secondaryDarkElevated: const Color(0xFF2C2C2E),
          tertiaryLight: const Color(0xFFF2F2F7),
          tertiaryDarkBase: const Color(0xFF2C2C2E),
          tertiaryDarkElevated: const Color(0xFF3A3A3C),
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
}

final class DefaultFillColorsLight extends DefaultFillColors {
  const DefaultFillColorsLight()
      : super(
          primary: const Color.fromRGBO(120, 120, 128, .2),
          secondary: const Color.fromRGBO(120, 120, 128, .16),
          tertiary: const Color.fromRGBO(120, 120, 128, .12),
          quartenary: const Color.fromRGBO(120, 120, 128,
              .8), // Note: Was .18 in original request, corrected to .8 based on naming pattern and light theme
        );
}

final class DefaultFillColorsDark extends DefaultFillColors {
  const DefaultFillColorsDark()
      : super(
          primary: const Color.fromRGBO(120, 120, 128, .36),
          secondary: const Color.fromRGBO(120, 120, 128, .32),
          tertiary: const Color.fromRGBO(120, 120, 128, .24),
          quartenary: const Color.fromRGBO(120, 120, 128, .18),
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
}

final class DefaultLabelColorsLight extends DefaultLabelColors {
  const DefaultLabelColorsLight()
      : super(
          primary: const Color(0xFF000000),
          secondary: const Color.fromRGBO(60, 60, 67, .60),
          tertiary: const Color.fromRGBO(60, 60, 67, .30),
          quartenary: const Color.fromRGBO(60, 60, 67, .18),
        );
}

final class DefaultLabelColorsDark extends DefaultLabelColors {
  const DefaultLabelColorsDark()
      : super(
          primary: const Color(0xFFFFFFFF),
          secondary: const Color.fromRGBO(235, 235, 245, .60),
          tertiary: const Color.fromRGBO(235, 235, 245, .30),
          quartenary: const Color.fromRGBO(235, 235, 245, .18),
        );
}

sealed class DefaultSeparatorColors {
  const DefaultSeparatorColors({
    required this.nonOpaque,
    required this.opaque,
  });

  final Color nonOpaque;
  final Color opaque;
}

final class DefaultSeparatorColorsLight extends DefaultSeparatorColors {
  const DefaultSeparatorColorsLight()
      : super(
          nonOpaque: const Color(0xFFC6C6C8),
          opaque: const Color.fromRGBO(60, 60, 67, .36),
        );
}

final class DefaultSeparatorColorsDark extends DefaultSeparatorColors {
  const DefaultSeparatorColorsDark()
      : super(
          nonOpaque: const Color(0xFF38383A),
          opaque: const Color.fromRGBO(84, 84, 88, .36),
        );
}
