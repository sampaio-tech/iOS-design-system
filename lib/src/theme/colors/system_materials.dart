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

  SystemMaterialsBackgroundsColors lerp(
    SystemMaterialsBackgroundsColors b,
    double t,
  ) {
    if (identical(this, b)) {
      return this;
    }
    final instance = t < 0.5 ? this : b;
    return instance.copyWith(
      thick: Color.lerp(thick, b.thick, t),
      regular: Color.lerp(regular, b.regular, t),
      thin: Color.lerp(thin, b.thin, t),
      ultraThin: Color.lerp(ultraThin, b.ultraThin, t),
    );
  }

  SystemMaterialsBackgroundsColors copyWith({
    Color? thick,
    Color? regular,
    Color? thin,
    Color? ultraThin,
  });
}

final class SystemMaterialsBackgroundsColorsLight
    extends SystemMaterialsBackgroundsColors {
  const SystemMaterialsBackgroundsColorsLight({
    Color? thick,
    Color? regular,
    Color? thin,
    Color? ultraThin,
  }) : super(
          thick: thick ?? const Color.fromRGBO(253, 253, 253, .92),
          regular: regular ?? const Color.fromRGBO(249, 249, 249, .78),
          thin: thin ?? const Color.fromRGBO(245, 245, 245, .6),
          ultraThin: ultraThin ?? const Color.fromRGBO(240, 240, 240, .38),
        );

  @override
  SystemMaterialsBackgroundsColors copyWith({
    Color? thick,
    Color? regular,
    Color? thin,
    Color? ultraThin,
  }) =>
      SystemMaterialsBackgroundsColorsLight(
        thick: thick,
        regular: regular,
        thin: thin,
        ultraThin: ultraThin,
      );
}

final class SystemMaterialsBackgroundsColorsDark
    extends SystemMaterialsBackgroundsColors {
  const SystemMaterialsBackgroundsColorsDark({
    Color? thick,
    Color? regular,
    Color? thin,
    Color? ultraThin,
  }) : super(
          thick: thick ?? const Color.fromRGBO(0, 0, 0, .6),
          regular: regular ?? const Color.fromRGBO(0, 0, 0, .41),
          thin: thin ?? const Color.fromRGBO(0, 0, 0, .25),
          ultraThin: ultraThin ?? const Color.fromRGBO(0, 0, 0, .1),
        );

  @override
  SystemMaterialsBackgroundsColors copyWith({
    Color? thick,
    Color? regular,
    Color? thin,
    Color? ultraThin,
  }) =>
      SystemMaterialsBackgroundsColorsDark(
        thick: thick,
        regular: regular,
        thin: thin,
        ultraThin: ultraThin,
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
  final Color vibratTertiary; // Mantido o nome original (possível typo)
  final Color vibrantQuartenary;

  SystemMaterialsLabelsTextColors lerp(
    SystemMaterialsLabelsTextColors b,
    double t,
  ) {
    if (identical(this, b)) {
      return this;
    }
    final instance = t < 0.5 ? this : b;
    return instance.copyWith(
      vibrantPrimary: Color.lerp(vibrantPrimary, b.vibrantPrimary, t),
      vibrantSecondary: Color.lerp(vibrantSecondary, b.vibrantSecondary, t),
      vibratTertiary: Color.lerp(vibratTertiary, b.vibratTertiary, t),
      vibrantQuartenary: Color.lerp(vibrantQuartenary, b.vibrantQuartenary, t),
    );
  }

  SystemMaterialsLabelsTextColors copyWith({
    Color? vibrantPrimary,
    Color? vibrantSecondary,
    Color? vibratTertiary,
    Color? vibrantQuartenary,
  });
}

final class SystemMaterialsLabelsTextColorsLight
    extends SystemMaterialsLabelsTextColors {
  const SystemMaterialsLabelsTextColorsLight({
    Color? vibrantPrimary,
    Color? vibrantSecondary,
    Color? vibratTertiary,
    Color? vibrantQuartenary,
  }) : super(
          vibrantPrimary: vibrantPrimary ?? const Color.fromRGBO(0, 0, 0, .96),
          vibrantSecondary:
              vibrantSecondary ?? const Color.fromRGBO(0, 0, 0, .5),
          vibratTertiary: vibratTertiary ?? const Color.fromRGBO(0, 0, 0, .3),
          vibrantQuartenary:
              vibrantQuartenary ?? const Color.fromRGBO(0, 0, 0, .2),
        );

  @override
  SystemMaterialsLabelsTextColors copyWith({
    Color? vibrantPrimary,
    Color? vibrantSecondary,
    Color? vibratTertiary,
    Color? vibrantQuartenary,
  }) =>
      SystemMaterialsLabelsTextColorsLight(
        vibrantPrimary: vibrantPrimary,
        vibrantSecondary: vibrantSecondary,
        vibratTertiary: vibratTertiary,
        vibrantQuartenary: vibrantQuartenary,
      );
}

final class SystemMaterialsLabelsTextColorsDark
    extends SystemMaterialsLabelsTextColors {
  const SystemMaterialsLabelsTextColorsDark({
    Color? vibrantPrimary,
    Color? vibrantSecondary,
    Color? vibratTertiary,
    Color? vibrantQuartenary,
  }) : super(
          vibrantPrimary:
              vibrantPrimary ?? const Color.fromRGBO(255, 255, 255, .5),
          vibrantSecondary:
              vibrantSecondary ?? const Color.fromRGBO(255, 255, 255, .5),
          vibratTertiary:
              vibratTertiary ?? const Color.fromRGBO(255, 255, 255, .3),
          vibrantQuartenary:
              vibrantQuartenary ?? const Color.fromRGBO(255, 255, 255, .2),
        );

  @override
  SystemMaterialsLabelsTextColors copyWith({
    Color? vibrantPrimary,
    Color? vibrantSecondary,
    Color? vibratTertiary,
    Color? vibrantQuartenary,
  }) =>
      SystemMaterialsLabelsTextColorsDark(
        vibrantPrimary: vibrantPrimary,
        vibrantSecondary: vibrantSecondary,
        vibratTertiary: vibratTertiary,
        vibrantQuartenary: vibrantQuartenary,
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

  SystemMaterialsFillColors lerp(
    SystemMaterialsFillColors b,
    double t,
  ) {
    if (identical(this, b)) {
      return this;
    }
    final instance = t < 0.5 ? this : b;
    return instance.copyWith(
      primary: Color.lerp(primary, b.primary, t),
      secondary: Color.lerp(secondary, b.secondary, t),
      tertiary: Color.lerp(tertiary, b.tertiary, t),
    );
  }

  SystemMaterialsFillColors copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
  });
}

final class SystemMaterialsFillColorsLight extends SystemMaterialsFillColors {
  const SystemMaterialsFillColorsLight({
    Color? primary,
    Color? secondary,
    Color? tertiary,
  }) : super(
          primary: primary ?? const Color.fromRGBO(0, 0, 0, .45),
          secondary: secondary ?? const Color.fromRGBO(0, 0, 0, .2),
          tertiary: tertiary ?? const Color.fromRGBO(0, 0, 0, .1),
        );

  @override
  SystemMaterialsFillColors copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
  }) =>
      SystemMaterialsFillColorsLight(
        primary: primary,
        secondary: secondary,
        tertiary: tertiary,
      );
}

final class SystemMaterialsFillColorsDark extends SystemMaterialsFillColors {
  const SystemMaterialsFillColorsDark({
    Color? primary,
    Color? secondary,
    Color? tertiary,
  }) : super(
          primary: primary ?? const Color.fromRGBO(255, 255, 255, .45),
          secondary: secondary ?? const Color.fromRGBO(255, 255, 255, .2),
          tertiary: tertiary ?? const Color.fromRGBO(255, 255, 255, .1),
        );

  @override
  SystemMaterialsFillColors copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
  }) =>
      SystemMaterialsFillColorsDark(
        primary: primary,
        secondary: secondary,
        tertiary: tertiary,
      );
}

sealed class SystemMaterialsSeparatorColors {
  const SystemMaterialsSeparatorColors({
    required this.separator,
  });

  final Color separator;

  SystemMaterialsSeparatorColors lerp(
    SystemMaterialsSeparatorColors b,
    double t,
  ) {
    if (identical(this, b)) {
      return this;
    }
    final instance = t < 0.5 ? this : b;
    return instance.copyWith(
      separator: Color.lerp(separator, b.separator, t),
    );
  }

  SystemMaterialsSeparatorColors copyWith({
    Color? separator,
  });
}

final class SystemMaterialsSeparatorColorsLight
    extends SystemMaterialsSeparatorColors {
  const SystemMaterialsSeparatorColorsLight({
    Color? separator,
  }) : super(
          separator: separator ?? const Color.fromRGBO(0, 0, 0, .3),
        );

  @override
  SystemMaterialsSeparatorColors copyWith({
    Color? separator,
  }) =>
      SystemMaterialsSeparatorColorsLight(
        separator: separator,
      );
}

final class SystemMaterialsSeparatorColorsDark
    extends SystemMaterialsSeparatorColors {
  const SystemMaterialsSeparatorColorsDark({
    Color? separator,
  }) : super(
          separator: separator ?? const Color.fromRGBO(255, 255, 255, .3),
        );

  @override
  SystemMaterialsSeparatorColors copyWith({
    Color? separator,
  }) =>
      SystemMaterialsSeparatorColorsDark(
        separator: separator,
      );
}
