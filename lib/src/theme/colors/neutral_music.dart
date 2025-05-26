part of 'colors.dart';

sealed class NeutralMusicDecorations {
  const NeutralMusicDecorations({
    required this.gradients,
    required this.defaultColors,
  });

  final NeutralMusicGradients gradients;
  final NeutralMusicDefaultColors defaultColors;

  NeutralMusicDecorations lerp(NeutralMusicDecorations b, double t) {
    if (identical(this, b)) {
      return this;
    }
    final instance = t < 0.5 ? this : b;
    return instance.copyWith(
      gradients: gradients.lerp(b.gradients, t),
      defaultColors: defaultColors.lerp(b.defaultColors, t),
    );
  }

  NeutralMusicDecorations copyWith({
    required NeutralMusicGradients? gradients,
    required NeutralMusicDefaultColors? defaultColors,
  });
}

class NeutralMusicDecorationsDark extends NeutralMusicDecorations {
  const NeutralMusicDecorationsDark({
    NeutralMusicGradients gradients = const NeutralMusicGradientsDark(),
    NeutralMusicDefaultColors defaultColors =
        const NeutralMusicDefaultColorsDark(),
  }) : super(gradients: gradients, defaultColors: defaultColors);

  @override
  NeutralMusicDecorations copyWith({
    required NeutralMusicGradients? gradients,
    required NeutralMusicDefaultColors? defaultColors,
  }) => NeutralMusicDecorationsDark(
    gradients: gradients ?? this.gradients,
    defaultColors: defaultColors ?? this.defaultColors,
  );
}

class NeutralMusicDecorationsLight extends NeutralMusicDecorations {
  const NeutralMusicDecorationsLight({
    NeutralMusicGradients gradients = const NeutralMusicGradientsDark(),
    NeutralMusicDefaultColors defaultColors =
        const NeutralMusicDefaultColorsDark(),
  }) : super(gradients: gradients, defaultColors: defaultColors);

  @override
  NeutralMusicDecorations copyWith({
    required NeutralMusicGradients? gradients,
    required NeutralMusicDefaultColors? defaultColors,
  }) => NeutralMusicDecorationsLight(
    gradients: gradients ?? this.gradients,
    defaultColors: defaultColors ?? this.defaultColors,
  );
}

sealed class NeutralMusicGradients {
  const NeutralMusicGradients({
    required this.primaryBackgroundLargeWidget,
    required this.secondaryBackgroundLargeWidget,
    required this.backgroundDefault,
    required this.backgroundPillButton,
    required this.backgroundCircularButton,
  });

  final BoxDecoration primaryBackgroundLargeWidget;
  final BoxDecoration secondaryBackgroundLargeWidget;
  final BoxDecoration backgroundDefault;
  final BoxDecoration backgroundPillButton;
  final BoxDecoration backgroundCircularButton;

  NeutralMusicGradients lerp(NeutralMusicGradients b, double t) {
    if (identical(this, b)) {
      return this;
    }
    final instance = t < 0.5 ? this : b;
    return instance.copyWith(
      primaryBackgroundLargeWidget: BoxDecoration.lerp(
        primaryBackgroundLargeWidget,
        b.primaryBackgroundLargeWidget,
        t,
      ),
      secondaryBackgroundLargeWidget: BoxDecoration.lerp(
        secondaryBackgroundLargeWidget,
        b.secondaryBackgroundLargeWidget,
        t,
      ),
      backgroundDefault: BoxDecoration.lerp(
        backgroundDefault,
        b.backgroundDefault,
        t,
      ),
      backgroundPillButton: BoxDecoration.lerp(
        backgroundPillButton,
        b.backgroundPillButton,
        t,
      ),
      backgroundCircularButton: BoxDecoration.lerp(
        backgroundCircularButton,
        b.backgroundCircularButton,
        t,
      ),
    );
  }

  NeutralMusicGradients copyWith({
    BoxDecoration? primaryBackgroundLargeWidget,
    BoxDecoration? secondaryBackgroundLargeWidget,
    BoxDecoration? backgroundDefault,
    BoxDecoration? backgroundPillButton,
    BoxDecoration? backgroundCircularButton,
  });
}

final class NeutralMusicGradientsLight extends NeutralMusicGradients {
  const NeutralMusicGradientsLight({
    BoxDecoration primaryBackgroundLargeWidget = const BoxDecoration(
      color: const Color(0xFF434D56),
    ),
    BoxDecoration secondaryBackgroundLargeWidget = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF3D4750), const Color(0xFF434D56)],
      ),
    ),
    BoxDecoration backgroundDefault = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF444D56), const Color(0xFF434D56)],
      ),
    ),
    BoxDecoration backgroundPillButton = const BoxDecoration(
      color: const Color(0XFF626C75),
    ),
    BoxDecoration backgroundCircularButton = const BoxDecoration(
      color: const Color(0XFF58626B),
    ),
  }) : super(
         primaryBackgroundLargeWidget: primaryBackgroundLargeWidget,
         secondaryBackgroundLargeWidget: secondaryBackgroundLargeWidget,
         backgroundDefault: backgroundDefault,
         backgroundPillButton: backgroundPillButton,
         backgroundCircularButton: backgroundCircularButton,
       );

  @override
  NeutralMusicGradients copyWith({
    BoxDecoration? primaryBackgroundLargeWidget,
    BoxDecoration? secondaryBackgroundLargeWidget,
    BoxDecoration? backgroundDefault,
    BoxDecoration? backgroundPillButton,
    BoxDecoration? backgroundCircularButton,
  }) => NeutralMusicGradientsLight(
    primaryBackgroundLargeWidget:
        primaryBackgroundLargeWidget ?? this.primaryBackgroundLargeWidget,
    secondaryBackgroundLargeWidget:
        secondaryBackgroundLargeWidget ?? this.secondaryBackgroundLargeWidget,
    backgroundDefault: backgroundDefault ?? this.backgroundDefault,
    backgroundPillButton: backgroundPillButton ?? this.backgroundPillButton,
    backgroundCircularButton:
        backgroundCircularButton ?? this.backgroundCircularButton,
  );
}

final class NeutralMusicGradientsDark extends NeutralMusicGradients {
  const NeutralMusicGradientsDark({
    BoxDecoration primaryBackgroundLargeWidget = const BoxDecoration(
      color: const Color(0xFF434D56),
    ),
    BoxDecoration secondaryBackgroundLargeWidget = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF3D4750), const Color(0xFF434D56)],
      ),
    ),
    BoxDecoration backgroundDefault = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF444D56), const Color(0xFF434D56)],
      ),
    ),
    BoxDecoration backgroundPillButton = const BoxDecoration(
      color: const Color(0XFF626C75),
    ),
    BoxDecoration backgroundCircularButton = const BoxDecoration(
      color: const Color(0XFF58626B),
    ),
  }) : super(
         primaryBackgroundLargeWidget: primaryBackgroundLargeWidget,
         secondaryBackgroundLargeWidget: secondaryBackgroundLargeWidget,
         backgroundDefault: backgroundDefault,
         backgroundPillButton: backgroundPillButton,
         backgroundCircularButton: backgroundCircularButton,
       );

  @override
  NeutralMusicGradients copyWith({
    BoxDecoration? primaryBackgroundLargeWidget,
    BoxDecoration? secondaryBackgroundLargeWidget,
    BoxDecoration? backgroundDefault,
    BoxDecoration? backgroundPillButton,
    BoxDecoration? backgroundCircularButton,
  }) => NeutralMusicGradientsDark(
    primaryBackgroundLargeWidget:
        primaryBackgroundLargeWidget ?? this.primaryBackgroundLargeWidget,
    secondaryBackgroundLargeWidget:
        secondaryBackgroundLargeWidget ?? this.secondaryBackgroundLargeWidget,
    backgroundDefault: backgroundDefault ?? this.backgroundDefault,
    backgroundPillButton: backgroundPillButton ?? this.backgroundPillButton,
    backgroundCircularButton:
        backgroundCircularButton ?? this.backgroundCircularButton,
  );
}

sealed class NeutralMusicDefaultColors {
  const NeutralMusicDefaultColors({
    required this.title,
    required this.metadata,
  });

  final Color title;
  final Color metadata;

  NeutralMusicDefaultColors lerp(NeutralMusicDefaultColors b, double t) {
    if (identical(this, b)) {
      return this;
    }
    final instance = t < 0.5 ? this : b;
    return instance.copyWith(
      title: Color.lerp(title, b.title, t),
      metadata: Color.lerp(metadata, b.metadata, t),
    );
  }

  NeutralMusicDefaultColors copyWith({Color? title, Color? metadata});
}

final class NeutralMusicDefaultColorsLight extends NeutralMusicDefaultColors {
  const NeutralMusicDefaultColorsLight({
    Color title = const Color(0xFFFFFFFF),
    Color metadata = const Color(0xFFD0D9EA),
  }) : super(title: title, metadata: metadata);

  @override
  NeutralMusicDefaultColors copyWith({Color? title, Color? metadata}) =>
      NeutralMusicDefaultColorsLight(
        title: title ?? this.title,
        metadata: metadata ?? this.metadata,
      );
}

final class NeutralMusicDefaultColorsDark extends NeutralMusicDefaultColors {
  const NeutralMusicDefaultColorsDark({
    Color title = const Color(0xFFFFFFFF),
    Color metadata = const Color(0xFFD0D9EA),
  }) : super(title: title, metadata: metadata);

  @override
  NeutralMusicDefaultColors copyWith({Color? title, Color? metadata}) =>
      NeutralMusicDefaultColorsDark(
        title: title ?? this.title,
        metadata: metadata ?? this.metadata,
      );
}
