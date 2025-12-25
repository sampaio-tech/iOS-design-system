part of 'colors.dart';

sealed class NeutralPodcastDecorations {
  const NeutralPodcastDecorations({
    required this.gradients,
    required this.defaultColors,
  });

  final NeutralPodcastGradients gradients;
  final NeutralPodcastDefaultColors defaultColors;

  NeutralPodcastDecorations lerp(NeutralPodcastDecorations b, double t) {
    if (identical(this, b)) {
      return this;
    }
    final instance = t < 0.5 ? this : b;
    return instance.copyWith(
      gradients: gradients.lerp(b.gradients, t),
      defaultColors: defaultColors.lerp(b.defaultColors, t),
    );
  }

  NeutralPodcastDecorations copyWith({
    required NeutralPodcastGradients? gradients,
    required NeutralPodcastDefaultColors? defaultColors,
  });
}

class NeutralPodcastDecorationsDark extends NeutralPodcastDecorations {
  const NeutralPodcastDecorationsDark({
    NeutralPodcastGradients gradients = const NeutralPodcastGradientsDark(),
    NeutralPodcastDefaultColors defaultColors =
        const NeutralPodcastDefaultColorsDark(),
  }) : super(gradients: gradients, defaultColors: defaultColors);

  @override
  NeutralPodcastDecorations copyWith({
    required NeutralPodcastGradients? gradients,
    required NeutralPodcastDefaultColors? defaultColors,
  }) => NeutralPodcastDecorationsDark(
    gradients: gradients ?? this.gradients,
    defaultColors: defaultColors ?? this.defaultColors,
  );
}

class NeutralPodcastDecorationsLight extends NeutralPodcastDecorations {
  const NeutralPodcastDecorationsLight({
    NeutralPodcastGradients gradients = const NeutralPodcastGradientsDark(),
    NeutralPodcastDefaultColors defaultColors =
        const NeutralPodcastDefaultColorsDark(),
  }) : super(gradients: gradients, defaultColors: defaultColors);

  @override
  NeutralPodcastDecorations copyWith({
    required NeutralPodcastGradients? gradients,
    required NeutralPodcastDefaultColors? defaultColors,
  }) => NeutralPodcastDecorationsLight(
    gradients: gradients ?? this.gradients,
    defaultColors: defaultColors ?? this.defaultColors,
  );
}

sealed class NeutralPodcastGradients {
  const NeutralPodcastGradients({
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

  NeutralPodcastGradients lerp(NeutralPodcastGradients b, double t) {
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

  NeutralPodcastGradients copyWith({
    BoxDecoration? primaryBackgroundLargeWidget,
    BoxDecoration? secondaryBackgroundLargeWidget,
    BoxDecoration? backgroundDefault,
    BoxDecoration? backgroundPillButton,
    BoxDecoration? backgroundCircularButton,
  });
}

final class NeutralPodcastGradientsLight extends NeutralPodcastGradients {
  const NeutralPodcastGradientsLight({
    BoxDecoration primaryBackgroundLargeWidget = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF5B1F53), const Color(0xFF562753)],
      ),
    ),
    BoxDecoration secondaryBackgroundLargeWidget = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF492146), const Color(0xFF4E2756)],
      ),
    ),
    BoxDecoration backgroundDefault = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF5B2154), const Color(0xFF4E2756)],
      ),
    ),
    BoxDecoration backgroundPillButton = const BoxDecoration(
      color: const Color(0XFF653B69),
    ),
    BoxDecoration backgroundCircularButton = const BoxDecoration(
      color: const Color(0XFF643665),
    ),
  }) : super(
         primaryBackgroundLargeWidget: primaryBackgroundLargeWidget,
         secondaryBackgroundLargeWidget: secondaryBackgroundLargeWidget,
         backgroundDefault: backgroundDefault,
         backgroundPillButton: backgroundPillButton,
         backgroundCircularButton: backgroundCircularButton,
       );

  @override
  NeutralPodcastGradients copyWith({
    BoxDecoration? primaryBackgroundLargeWidget,
    BoxDecoration? secondaryBackgroundLargeWidget,
    BoxDecoration? backgroundDefault,
    BoxDecoration? backgroundPillButton,
    BoxDecoration? backgroundCircularButton,
  }) => NeutralPodcastGradientsLight(
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

final class NeutralPodcastGradientsDark extends NeutralPodcastGradients {
  const NeutralPodcastGradientsDark({
    BoxDecoration primaryBackgroundLargeWidget = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF5B1F53), const Color(0xFF562753)],
      ),
    ),
    BoxDecoration secondaryBackgroundLargeWidget = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF492146), const Color(0xFF4E2756)],
      ),
    ),
    BoxDecoration backgroundDefault = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF5B2154), const Color(0xFF4E2756)],
      ),
    ),
    BoxDecoration backgroundPillButton = const BoxDecoration(
      color: const Color(0XFF653B69),
    ),
    BoxDecoration backgroundCircularButton = const BoxDecoration(
      color: const Color(0XFF643665),
    ),
  }) : super(
         primaryBackgroundLargeWidget: primaryBackgroundLargeWidget,
         secondaryBackgroundLargeWidget: secondaryBackgroundLargeWidget,
         backgroundDefault: backgroundDefault,
         backgroundPillButton: backgroundPillButton,
         backgroundCircularButton: backgroundCircularButton,
       );

  @override
  NeutralPodcastGradients copyWith({
    BoxDecoration? primaryBackgroundLargeWidget,
    BoxDecoration? secondaryBackgroundLargeWidget,
    BoxDecoration? backgroundDefault,
    BoxDecoration? backgroundPillButton,
    BoxDecoration? backgroundCircularButton,
  }) => NeutralPodcastGradientsDark(
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

sealed class NeutralPodcastDefaultColors {
  const NeutralPodcastDefaultColors({
    required this.title,
    required this.metadata,
  });

  final Color title;
  final Color metadata;

  NeutralPodcastDefaultColors lerp(NeutralPodcastDefaultColors b, double t) {
    if (identical(this, b)) {
      return this;
    }
    final instance = t < 0.5 ? this : b;
    return instance.copyWith(
      title: Color.lerp(title, b.title, t),
      metadata: Color.lerp(metadata, b.metadata, t),
    );
  }

  NeutralPodcastDefaultColors copyWith({Color? title, Color? metadata});
}

final class NeutralPodcastDefaultColorsLight
    extends NeutralPodcastDefaultColors {
  const NeutralPodcastDefaultColorsLight({
    Color title = const Color(0xFFFFFFFF),
    Color metadata = const Color(0xFFB284B5),
  }) : super(title: title, metadata: metadata);

  @override
  NeutralPodcastDefaultColors copyWith({Color? title, Color? metadata}) =>
      NeutralPodcastDefaultColorsLight(
        title: title ?? this.title,
        metadata: metadata ?? this.metadata,
      );
}

final class NeutralPodcastDefaultColorsDark
    extends NeutralPodcastDefaultColors {
  const NeutralPodcastDefaultColorsDark({
    Color title = const Color(0xFFFFFFFF),
    Color metadata = const Color(0xFFB284B5),
  }) : super(title: title, metadata: metadata);

  @override
  NeutralPodcastDefaultColors copyWith({Color? title, Color? metadata}) =>
      NeutralPodcastDefaultColorsDark(
        title: title ?? this.title,
        metadata: metadata ?? this.metadata,
      );
}
