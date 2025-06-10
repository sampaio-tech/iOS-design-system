part of 'colors.dart';

sealed class BooksDecorations {
  const BooksDecorations({
    required this.backgroundColors,
    required this.defaultColors,
  });

  final BooksBackgroundsColors backgroundColors;
  final BooksDefaultColors defaultColors;

  BooksDecorations lerp(BooksDecorations b, double t) {
    if (identical(this, b)) {
      return this;
    }
    final instance = t < 0.5 ? this : b;
    return instance.copyWith(
      backgroundColors: backgroundColors.lerp(b.backgroundColors, t),
      defaultColors: defaultColors.lerp(b.defaultColors, t),
    );
  }

  BooksDecorations copyWith({
    required BooksBackgroundsColors? backgroundColors,
    required BooksDefaultColors? defaultColors,
  });
}

class BooksDecorationsDark extends BooksDecorations {
  BooksDecorationsDark({
    BooksBackgroundsColors backgroundColors =
        const BooksBackgroundsColorsDark(),
    BooksDefaultColors? defaultColors,
  }) : super(
         backgroundColors: backgroundColors,
         defaultColors: defaultColors ?? BooksDefaultColorsDark(),
       );

  @override
  BooksDecorations copyWith({
    required BooksBackgroundsColors? backgroundColors,
    required BooksDefaultColors? defaultColors,
  }) => BooksDecorationsDark(
    backgroundColors: backgroundColors ?? this.backgroundColors,
    defaultColors: defaultColors ?? this.defaultColors,
  );
}

class BooksDecorationsLight extends BooksDecorations {
  BooksDecorationsLight({
    BooksBackgroundsColors backgroundColors =
        const BooksBackgroundsColorsDark(),
    BooksDefaultColors? defaultColors,
  }) : super(
         backgroundColors: backgroundColors,
         defaultColors: defaultColors ?? BooksDefaultColorsDark(),
       );

  @override
  BooksDecorations copyWith({
    required BooksBackgroundsColors? backgroundColors,
    required BooksDefaultColors? defaultColors,
  }) => BooksDecorationsLight(
    backgroundColors: backgroundColors ?? this.backgroundColors,
    defaultColors: defaultColors ?? this.defaultColors,
  );
}

sealed class BooksBackgroundsColors {
  const BooksBackgroundsColors({
    required this.primaryGradient,
    required this.secondaryGradient,
    required this.primaryBackground,
    required this.secondaryBackground,
    required this.iconBackground,
    required this.accent,
  });

  final BoxDecoration primaryGradient;
  final BoxDecoration secondaryGradient;
  final BoxDecoration primaryBackground;
  final BoxDecoration secondaryBackground;
  final BoxDecoration iconBackground;
  final BoxDecoration accent;

  BooksBackgroundsColors lerp(BooksBackgroundsColors b, double t) {
    if (identical(this, b)) {
      return this;
    }
    final instance = t < 0.5 ? this : b;
    return instance.copyWith(
      primaryGradient: BoxDecoration.lerp(
        primaryGradient,
        b.primaryGradient,
        t,
      ),
      secondaryGradient: BoxDecoration.lerp(
        secondaryGradient,
        b.secondaryGradient,
        t,
      ),
      primaryBackground: BoxDecoration.lerp(
        primaryBackground,
        b.primaryBackground,
        t,
      ),
      secondaryBackground: BoxDecoration.lerp(
        secondaryBackground,
        b.secondaryBackground,
        t,
      ),
      iconBackground: BoxDecoration.lerp(iconBackground, b.iconBackground, t),
      accent: BoxDecoration.lerp(accent, b.accent, t),
    );
  }

  BooksBackgroundsColors copyWith({
    BoxDecoration? primaryGradient,
    BoxDecoration? secondaryGradient,
    BoxDecoration? primaryBackground,
    BoxDecoration? secondaryBackground,
    BoxDecoration? iconBackground,
    BoxDecoration? accent,
  });
}

final class BooksBackgroundsColorsLight extends BooksBackgroundsColors {
  const BooksBackgroundsColorsLight({
    BoxDecoration primaryGradient = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFFFFA800), const Color(0xFFE27614)],
      ),
    ),
    BoxDecoration secondaryGradient = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFFFB8219), const Color(0xFFF76720)],
      ),
    ),
    BoxDecoration primaryBackground = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF888888), const Color(0xFF7B7B7B)],
      ),
    ),
    BoxDecoration secondaryBackground = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF888888), const Color(0xFF898989)],
      ),
    ),
    BoxDecoration iconBackground = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF313131), const Color(0xFF141414)],
      ),
    ),
    BoxDecoration accent = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFFEFBA32), const Color(0xFFEF8732)],
      ),
    ),
  }) : super(
         primaryGradient: primaryGradient,
         secondaryGradient: secondaryGradient,
         primaryBackground: primaryBackground,
         secondaryBackground: secondaryBackground,
         iconBackground: iconBackground,
         accent: accent,
       );

  BooksBackgroundsColors copyWith({
    BoxDecoration? primaryGradient,
    BoxDecoration? secondaryGradient,
    BoxDecoration? primaryBackground,
    BoxDecoration? secondaryBackground,
    BoxDecoration? iconBackground,
    BoxDecoration? accent,
  }) => BooksBackgroundsColorsLight(
    primaryGradient: primaryGradient ?? this.primaryGradient,
    secondaryGradient: secondaryGradient ?? this.secondaryGradient,
    primaryBackground: primaryBackground ?? this.primaryBackground,
    secondaryBackground: secondaryBackground ?? this.secondaryBackground,
    iconBackground: iconBackground ?? this.iconBackground,
    accent: accent ?? this.accent,
  );
}

final class BooksBackgroundsColorsDark extends BooksBackgroundsColors {
  const BooksBackgroundsColorsDark({
    BoxDecoration primaryGradient = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFFFFA800), const Color(0xFFE27614)],
      ),
    ),
    BoxDecoration secondaryGradient = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFFFB8219), const Color(0xFFF76720)],
      ),
    ),
    BoxDecoration primaryBackground = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF888888), const Color(0xFF7B7B7B)],
      ),
    ),
    BoxDecoration secondaryBackground = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF888888), const Color(0xFF898989)],
      ),
    ),
    BoxDecoration iconBackground = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF313131), const Color(0xFF141414)],
      ),
    ),
    BoxDecoration accent = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFFEFBA32), const Color(0xFFEF8732)],
      ),
    ),
  }) : super(
         primaryGradient: primaryGradient,
         secondaryGradient: secondaryGradient,
         primaryBackground: primaryBackground,
         secondaryBackground: secondaryBackground,
         iconBackground: iconBackground,
         accent: accent,
       );

  BooksBackgroundsColors copyWith({
    BoxDecoration? primaryGradient,
    BoxDecoration? secondaryGradient,
    BoxDecoration? primaryBackground,
    BoxDecoration? secondaryBackground,
    BoxDecoration? iconBackground,
    BoxDecoration? accent,
  }) => BooksBackgroundsColorsDark(
    primaryGradient: primaryGradient ?? this.primaryGradient,
    secondaryGradient: secondaryGradient ?? this.secondaryGradient,
    primaryBackground: primaryBackground ?? this.primaryBackground,
    secondaryBackground: secondaryBackground ?? this.secondaryBackground,
    iconBackground: iconBackground ?? this.iconBackground,
    accent: accent ?? this.accent,
  );
}

sealed class BooksDefaultColors {
  BooksDefaultColors({
    required this.baseWhite,
    required this.baseBlack,
    required this.progressUpcomingText,
    required this.progressUpcomingTrack,
    required this.progressInProgressText,
    required this.progressInProgressTrack,
    required this.progressCompleteText,
    required this.progressCompleteTrack,
    required this.progressSkippedText,
    required this.progressSkippedTrack,
    required this.primaryText,
    required this.secondaryText,
    required this.backgroundCover,
    required this.backgroundDark,
    required this.componentBorderDark,
    required this.componentBorderDarkVariant,
    required this.componentBorderDarkTinted,
    required this.outlineDark,
    required this.componentBorderLight,
    required this.labelDark,
    required this.progressChartTrack,
  });

  final Color baseWhite;
  final Color baseBlack;
  final Color progressUpcomingText;
  final Color progressUpcomingTrack;
  final Color progressInProgressText;
  final Color progressInProgressTrack;
  final Color progressCompleteText;
  final Color progressCompleteTrack;
  final Color progressSkippedText;
  final Color progressSkippedTrack;
  final Color primaryText;
  final Color secondaryText;
  final Color backgroundCover;
  final Color backgroundDark;
  final Color componentBorderDark;
  final Color componentBorderDarkVariant;
  final Color componentBorderDarkTinted;
  final Color outlineDark;
  final Color componentBorderLight;
  final Color labelDark;
  final Color progressChartTrack;

  BooksDefaultColors lerp(BooksDefaultColors b, double t) {
    if (identical(this, b)) {
      return this;
    }
    final instance = t < 0.5 ? this : b;
    return instance.copyWith(
      baseWhite: Color.lerp(baseWhite, b.baseWhite, t),
      baseBlack: Color.lerp(baseBlack, b.baseBlack, t),
      progressUpcomingText: Color.lerp(
        progressUpcomingText,
        b.progressUpcomingText,
        t,
      ),
      progressUpcomingTrack: Color.lerp(
        progressUpcomingTrack,
        b.progressUpcomingTrack,
        t,
      ),
      progressInProgressText: Color.lerp(
        progressInProgressText,
        b.progressInProgressText,
        t,
      ),
      progressInProgressTrack: Color.lerp(
        progressInProgressTrack,
        b.progressInProgressTrack,
        t,
      ),
      progressCompleteText: Color.lerp(
        progressCompleteText,
        b.progressCompleteText,
        t,
      ),
      progressCompleteTrack: Color.lerp(
        progressCompleteTrack,
        b.progressCompleteTrack,
        t,
      ),
      progressSkippedText: Color.lerp(
        progressSkippedText,
        b.progressSkippedText,
        t,
      ),
      progressSkippedTrack: Color.lerp(
        progressSkippedTrack,
        b.progressSkippedTrack,
        t,
      ),
      primaryText: Color.lerp(primaryText, b.primaryText, t),
      secondaryText: Color.lerp(secondaryText, b.secondaryText, t),
      backgroundCover: Color.lerp(backgroundCover, b.backgroundCover, t),
      backgroundDark: Color.lerp(backgroundDark, b.backgroundDark, t),
      componentBorderDark: Color.lerp(
        componentBorderDark,
        b.componentBorderDark,
        t,
      ),
      componentBorderDarkVariant: Color.lerp(
        componentBorderDarkVariant,
        b.componentBorderDarkVariant,
        t,
      ),
      componentBorderDarkTinted: Color.lerp(
        componentBorderDarkTinted,
        b.componentBorderDarkTinted,
        t,
      ),
      outlineDark: Color.lerp(outlineDark, b.outlineDark, t),
      componentBorderLight: Color.lerp(
        componentBorderLight,
        b.componentBorderLight,
        t,
      ),
      labelDark: Color.lerp(labelDark, b.labelDark, t),
      progressChartTrack: Color.lerp(
        progressChartTrack,
        b.progressChartTrack,
        t,
      ),
    );
  }

  BooksDefaultColors copyWith({
    Color? baseWhite,
    Color? baseBlack,
    Color? progressUpcomingText,
    Color? progressUpcomingTrack,
    Color? progressInProgressText,
    Color? progressInProgressTrack,
    Color? progressCompleteText,
    Color? progressCompleteTrack,
    Color? progressSkippedText,
    Color? progressSkippedTrack,
    Color? primaryText,
    Color? secondaryText,
    Color? backgroundCover,
    Color? backgroundDark,
    Color? componentBorderDark,
    Color? componentBorderDarkVariant,
    Color? componentBorderDarkTinted,
    Color? outlineDark,
    Color? componentBorderLight,
    Color? labelDark,
    Color? progressChartTrack,
  });
}

final class BooksDefaultColorsLight extends BooksDefaultColors {
  BooksDefaultColorsLight({
    Color baseWhite = const Color(0xFFFFFFFF),
    Color baseBlack = const Color(0xFF000000),
    Color? progressUpcomingText,
    Color? progressUpcomingTrack,
    Color progressInProgressText = const Color(0xFFFFFFFF),
    Color? progressInProgressTrack,
    Color? progressCompleteText,
    Color? progressCompleteTrack,
    Color? progressSkippedText,
    Color? progressSkippedTrack,
    Color primaryText = const Color(0xFFFFFFFF),
    Color? secondaryText,
    Color backgroundCover = const Color(0xFF111518),
    Color backgroundDark = const Color(0xFF141414),
    Color componentBorderDark = const Color(0xFF1D1D1F),
    Color componentBorderDarkVariant = const Color(0xFF242424),
    Color componentBorderDarkTinted = const Color(0xFF181818),
    Color outlineDark = const Color(0xFF48484A),
    Color componentBorderLight = const Color(0xFFF5F5F5),
    Color labelDark = const Color(0xFFF5F5F7),
    Color? progressChartTrack,
  }) : super(
         baseWhite: baseWhite,
         baseBlack: baseBlack,
         progressUpcomingText:
             progressUpcomingText ??
             Color.alphaBlend(const Color(0x7D565454), const Color(0xFF605F5F)),
         progressUpcomingTrack:
             progressUpcomingTrack ??
             Color.alphaBlend(const Color(0x80737373), const Color(0x665F5E5E)),
         progressInProgressText: progressInProgressText,
         progressInProgressTrack:
             progressInProgressTrack ??
             Color.alphaBlend(const Color(0x54FFFFFF), const Color(0x63C3C3C3)),
         progressCompleteText:
             progressCompleteText ??
             Color.alphaBlend(const Color(0x80343434), const Color(0xFF5C5C5C)),
         progressCompleteTrack:
             progressCompleteTrack ??
             Color.alphaBlend(const Color(0x7AFFFFFF), const Color(0x63C8C8C8)),
         progressSkippedText:
             progressSkippedText ??
             Color.alphaBlend(const Color(0x7AC5C5C5), const Color(0x63C8C8C8)),
         progressSkippedTrack:
             progressSkippedTrack ??
             Color.alphaBlend(const Color(0x80737373), const Color(0x665F5E5E)),
         primaryText: primaryText,
         secondaryText:
             secondaryText ??
             Color.alphaBlend(const Color(0xFFFFFFFF), const Color(0x6ADEDEDE)),
         backgroundCover: backgroundCover,
         backgroundDark: backgroundDark,
         componentBorderDark: componentBorderDark,
         componentBorderDarkVariant: componentBorderDarkVariant,
         componentBorderDarkTinted: componentBorderDarkTinted,
         outlineDark: outlineDark,
         componentBorderLight: componentBorderLight,
         labelDark: labelDark,
         progressChartTrack:
             progressChartTrack ??
             Color.alphaBlend(const Color(0x54FFFFFF), const Color(0x63DEDEDE)),
       );

  BooksDefaultColors copyWith({
    Color? baseWhite,
    Color? baseBlack,
    Color? progressUpcomingText,
    Color? progressUpcomingTrack,
    Color? progressInProgressText,
    Color? progressInProgressTrack,
    Color? progressCompleteText,
    Color? progressCompleteTrack,
    Color? progressSkippedText,
    Color? progressSkippedTrack,
    Color? primaryText,
    Color? secondaryText,
    Color? backgroundCover,
    Color? backgroundDark,
    Color? componentBorderDark,
    Color? componentBorderDarkVariant,
    Color? componentBorderDarkTinted,
    Color? outlineDark,
    Color? componentBorderLight,
    Color? labelDark,
    Color? progressChartTrack,
  }) => BooksDefaultColorsLight(
    baseWhite: baseWhite ?? this.baseWhite,
    baseBlack: baseBlack ?? this.baseBlack,
    progressUpcomingText: progressUpcomingText ?? this.progressUpcomingText,
    progressUpcomingTrack: progressUpcomingTrack ?? this.progressUpcomingTrack,
    progressInProgressText:
        progressInProgressText ?? this.progressInProgressText,
    progressInProgressTrack:
        progressInProgressTrack ?? this.progressInProgressTrack,
    progressCompleteText: progressCompleteText ?? this.progressCompleteText,
    progressCompleteTrack: progressCompleteTrack ?? this.progressCompleteTrack,
    progressSkippedText: progressSkippedText ?? this.progressSkippedText,
    progressSkippedTrack: progressSkippedTrack ?? this.progressSkippedTrack,
    primaryText: primaryText ?? this.primaryText,
    secondaryText: secondaryText ?? this.secondaryText,
    backgroundCover: backgroundCover ?? this.backgroundCover,
    backgroundDark: backgroundDark ?? this.backgroundDark,
    componentBorderDark: componentBorderDark ?? this.componentBorderDark,
    componentBorderDarkVariant:
        componentBorderDarkVariant ?? this.componentBorderDarkVariant,
    componentBorderDarkTinted:
        componentBorderDarkTinted ?? this.componentBorderDarkTinted,
    outlineDark: outlineDark ?? this.outlineDark,
    componentBorderLight: componentBorderLight ?? this.componentBorderLight,
    labelDark: labelDark ?? this.labelDark,
    progressChartTrack: progressChartTrack ?? this.progressChartTrack,
  );
}

final class BooksDefaultColorsDark extends BooksDefaultColors {
  BooksDefaultColorsDark({
    Color baseWhite = const Color(0xFFFFFFFF),
    Color baseBlack = const Color(0xFF000000),
    Color? progressUpcomingText,
    Color? progressUpcomingTrack,
    Color progressInProgressText = const Color(0xFFFFFFFF),
    Color? progressInProgressTrack,
    Color? progressCompleteText,
    Color? progressCompleteTrack,
    Color? progressSkippedText,
    Color? progressSkippedTrack,
    Color primaryText = const Color(0xFFFFFFFF),
    Color? secondaryText,
    Color backgroundCover = const Color(0xFF111518),
    Color backgroundDark = const Color(0xFF141414),
    Color componentBorderDark = const Color(0xFF1D1D1F),
    Color componentBorderDarkVariant = const Color(0xFF242424),
    Color componentBorderDarkTinted = const Color(0xFF181818),
    Color outlineDark = const Color(0xFF48484A),
    Color componentBorderLight = const Color(0xFFF5F5F5),
    Color labelDark = const Color(0xFFF5F5F7),
    Color? progressChartTrack,
  }) : super(
         baseWhite: baseWhite,
         baseBlack: baseBlack,
         progressUpcomingText:
             progressUpcomingText ??
             Color.alphaBlend(const Color(0x7D565454), const Color(0xFF605F5F)),
         progressUpcomingTrack:
             progressUpcomingTrack ??
             Color.alphaBlend(const Color(0x80737373), const Color(0x665F5E5E)),
         progressInProgressText: progressInProgressText,
         progressInProgressTrack:
             progressInProgressTrack ??
             Color.alphaBlend(const Color(0x54FFFFFF), const Color(0x63C3C3C3)),
         progressCompleteText:
             progressCompleteText ??
             Color.alphaBlend(const Color(0x80343434), const Color(0xFF5C5C5C)),
         progressCompleteTrack:
             progressCompleteTrack ??
             Color.alphaBlend(const Color(0x7AFFFFFF), const Color(0x63C8C8C8)),
         progressSkippedText:
             progressSkippedText ??
             Color.alphaBlend(const Color(0x7AC5C5C5), const Color(0x63C8C8C8)),
         progressSkippedTrack:
             progressSkippedTrack ??
             Color.alphaBlend(const Color(0x80737373), const Color(0x665F5E5E)),
         primaryText: primaryText,
         secondaryText:
             secondaryText ??
             Color.alphaBlend(const Color(0xFFFFFFFF), const Color(0x6ADEDEDE)),
         backgroundCover: backgroundCover,
         backgroundDark: backgroundDark,
         componentBorderDark: componentBorderDark,
         componentBorderDarkVariant: componentBorderDarkVariant,
         componentBorderDarkTinted: componentBorderDarkTinted,
         outlineDark: outlineDark,
         componentBorderLight: componentBorderLight,
         labelDark: labelDark,
         progressChartTrack:
             progressChartTrack ??
             Color.alphaBlend(const Color(0x54FFFFFF), const Color(0x63DEDEDE)),
       );

  BooksDefaultColors copyWith({
    Color? baseWhite,
    Color? baseBlack,
    Color? progressUpcomingText,
    Color? progressUpcomingTrack,
    Color? progressInProgressText,
    Color? progressInProgressTrack,
    Color? progressCompleteText,
    Color? progressCompleteTrack,
    Color? progressSkippedText,
    Color? progressSkippedTrack,
    Color? primaryText,
    Color? secondaryText,
    Color? backgroundCover,
    Color? backgroundDark,
    Color? componentBorderDark,
    Color? componentBorderDarkVariant,
    Color? componentBorderDarkTinted,
    Color? outlineDark,
    Color? componentBorderLight,
    Color? labelDark,
    Color? progressChartTrack,
  }) => BooksDefaultColorsDark(
    baseWhite: baseWhite ?? this.baseWhite,
    baseBlack: baseBlack ?? this.baseBlack,
    progressUpcomingText: progressUpcomingText ?? this.progressUpcomingText,
    progressUpcomingTrack: progressUpcomingTrack ?? this.progressUpcomingTrack,
    progressInProgressText:
        progressInProgressText ?? this.progressInProgressText,
    progressInProgressTrack:
        progressInProgressTrack ?? this.progressInProgressTrack,
    progressCompleteText: progressCompleteText ?? this.progressCompleteText,
    progressCompleteTrack: progressCompleteTrack ?? this.progressCompleteTrack,
    progressSkippedText: progressSkippedText ?? this.progressSkippedText,
    progressSkippedTrack: progressSkippedTrack ?? this.progressSkippedTrack,
    primaryText: primaryText ?? this.primaryText,
    secondaryText: secondaryText ?? this.secondaryText,
    backgroundCover: backgroundCover ?? this.backgroundCover,
    backgroundDark: backgroundDark ?? this.backgroundDark,
    componentBorderDark: componentBorderDark ?? this.componentBorderDark,
    componentBorderDarkVariant:
        componentBorderDarkVariant ?? this.componentBorderDarkVariant,
    componentBorderDarkTinted:
        componentBorderDarkTinted ?? this.componentBorderDarkTinted,
    outlineDark: outlineDark ?? this.outlineDark,
    componentBorderLight: componentBorderLight ?? this.componentBorderLight,
    labelDark: labelDark ?? this.labelDark,
    progressChartTrack: progressChartTrack ?? this.progressChartTrack,
  );
}
