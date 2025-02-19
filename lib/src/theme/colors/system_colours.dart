part of 'colors.dart';

sealed class SystemColoursSeparatorColors {
  const SystemColoursSeparatorColors({
    required this.nonOpaque,
  });

  final Color nonOpaque;

  SystemColoursSeparatorColors lerp(
    SystemColoursSeparatorColors b,
    double t,
  ) {
    if (identical(this, b)) {
      return this;
    }
    final instance = t < 0.5 ? this : b;
    return instance.copyWith(
      nonOpaque: Color.lerp(nonOpaque, b.nonOpaque, t),
    );
  }

  SystemColoursSeparatorColors copyWith({
    Color? nonOpaque,
  });
}

final class SystemColoursSeparatorColorsLight
    extends SystemColoursSeparatorColors {
  const SystemColoursSeparatorColorsLight({
    Color? nonOpaque,
  }) : super(
          nonOpaque: nonOpaque ?? const Color(0xFFC6C6C8),
        );

  @override
  SystemColoursSeparatorColors copyWith({
    Color? nonOpaque,
  }) =>
      SystemColoursSeparatorColorsLight(
        nonOpaque: nonOpaque,
      );
}

final class SystemColoursSeparatorColorsDark
    extends SystemColoursSeparatorColors {
  const SystemColoursSeparatorColorsDark({
    Color? nonOpaque,
  }) : super(
          nonOpaque: nonOpaque ?? const Color(0xFF38383A),
        );

  @override
  SystemColoursSeparatorColors copyWith({
    Color? nonOpaque,
  }) =>
      SystemColoursSeparatorColorsDark(
        nonOpaque: nonOpaque,
      );
}
