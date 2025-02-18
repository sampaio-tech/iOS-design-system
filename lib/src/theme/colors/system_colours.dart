part of 'colors.dart';

sealed class SystemColoursSeparatorColors {
  const SystemColoursSeparatorColors({
    required this.nonOpaque,
  });

  final Color nonOpaque;
}

final class SystemColoursSeparatorColorsLight
    extends SystemColoursSeparatorColors {
  const SystemColoursSeparatorColorsLight()
      : super(
          nonOpaque: const Color(0xFFC6C6C8),
        );
}

final class SystemColoursSeparatorColorsDark
    extends SystemColoursSeparatorColors {
  const SystemColoursSeparatorColorsDark()
      : super(
          nonOpaque: const Color(0xFF38383A),
        );
}
