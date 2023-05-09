import 'dart:ui';

class AppColors {
  const AppColors._();

  static const defaultColors = _kDefaultColors;
}

const _kDefaultColors = DefaultColors._(
  systemRed: kDefaultSystemRed,
);

class DefaultColors {
  final ColorBase systemRed;
  const DefaultColors._({
    required this.systemRed,
  });
}

const kDefaultSystemRed = ColorBase._(
  light: Color(0xFFFF3B30),
  dark: Color(0xFFFF453A),
);

class ColorBase {
  final Color light;
  final Color dark;

  const ColorBase._({
    required this.light,
    required this.dark,
  });
}

class ColorDarkExtended {
  final Color light;
  final Color darkBase;
  final Color darkElevated;

  const ColorDarkExtended._({
    required this.light,
    required this.darkBase,
    required this.darkElevated,
  });
}
