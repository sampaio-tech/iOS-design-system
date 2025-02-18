part of 'colors.dart';

sealed class SystemMaterialsBackgroundsColors {
  const SystemMaterialsBackgroundsColors({
    required this.thick,
    required this.regular,
    required this.thin,
    required this.ultraThin,
  });

  final Color thick;
  final Color regular;
  final Color thin;
  final Color ultraThin;
}

final class SystemMaterialsBackgroundsColorsLight
    extends SystemMaterialsBackgroundsColors {
  const SystemMaterialsBackgroundsColorsLight()
      : super(
          thick: const Color.fromRGBO(253, 253, 253, .92),
          regular: const Color.fromRGBO(249, 249, 249, .78),
          thin: const Color.fromRGBO(245, 245, 245, .6),
          ultraThin: const Color.fromRGBO(240, 240, 240, .38),
        );
}

final class SystemMaterialsBackgroundsColorsDark
    extends SystemMaterialsBackgroundsColors {
  const SystemMaterialsBackgroundsColorsDark()
      : super(
          thick: const Color.fromRGBO(0, 0, 0, .6),
          regular: const Color.fromRGBO(0, 0, 0, .41),
          thin: const Color.fromRGBO(0, 0, 0, .25),
          ultraThin: const Color.fromRGBO(0, 0, 0, .1),
        );
}

sealed class SystemMaterialsLabelsTextColors {
  const SystemMaterialsLabelsTextColors({
    required this.vibrantPrimary,
    required this.vibrantSecondary,
    required this.vibratTertiary,
    required this.vibrantQuartenary,
  });

  final Color vibrantPrimary;
  final Color vibrantSecondary;
  final Color vibratTertiary;
  final Color vibrantQuartenary;
}

final class SystemMaterialsLabelsTextColorsLight
    extends SystemMaterialsLabelsTextColors {
  const SystemMaterialsLabelsTextColorsLight()
      : super(
          vibrantPrimary: const Color.fromRGBO(0, 0, 0, .96),
          vibrantSecondary: const Color.fromRGBO(0, 0, 0, .5),
          vibratTertiary: const Color.fromRGBO(0, 0, 0, .3),
          vibrantQuartenary: const Color.fromRGBO(0, 0, 0, .2),
        );
}

final class SystemMaterialsLabelsTextColorsDark
    extends SystemMaterialsLabelsTextColors {
  const SystemMaterialsLabelsTextColorsDark()
      : super(
          vibrantPrimary: const Color.fromRGBO(255, 255, 255, .5),
          vibrantSecondary: const Color.fromRGBO(255, 255, 255, .5),
          vibratTertiary: const Color.fromRGBO(255, 255, 255, .3),
          vibrantQuartenary: const Color.fromRGBO(255, 255, 255, .2),
        );
}

sealed class SystemMaterialsFillColors {
  const SystemMaterialsFillColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
  });

  final Color primary;
  final Color secondary;
  final Color tertiary;
}

final class SystemMaterialsFillColorsLight extends SystemMaterialsFillColors {
  const SystemMaterialsFillColorsLight()
      : super(
          primary: const Color.fromRGBO(0, 0, 0, .45),
          secondary: const Color.fromRGBO(0, 0, 0, .2),
          tertiary: const Color.fromRGBO(0, 0, 0, .1),
        );
}

final class SystemMaterialsFillColorsDark extends SystemMaterialsFillColors {
  const SystemMaterialsFillColorsDark()
      : super(
          primary: const Color.fromRGBO(255, 255, 255, .45),
          secondary: const Color.fromRGBO(255, 255, 255, .2),
          tertiary: const Color.fromRGBO(255, 255, 255, .1),
        );
}

sealed class SystemMaterialsSeparatorColors {
  const SystemMaterialsSeparatorColors({
    required this.separator,
  });

  final Color separator;
}

final class SystemMaterialsSeparatorColorsLight
    extends SystemMaterialsSeparatorColors {
  const SystemMaterialsSeparatorColorsLight()
      : super(
          separator: const Color.fromRGBO(0, 0, 0, .3),
        );
}

final class SystemMaterialsSeparatorColorsDark
    extends SystemMaterialsSeparatorColors {
  const SystemMaterialsSeparatorColorsDark()
      : super(
          separator: const Color.fromRGBO(255, 255, 255, .3),
        );
}
