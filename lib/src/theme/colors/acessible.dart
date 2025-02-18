part of 'colors.dart';

sealed class AcessibleColors {
  const AcessibleColors({
    required this.systemRed,
    required this.systemOrange,
    required this.systemYellow,
    required this.systemGreen,
    required this.systemTeal,
    required this.systemBlue,
    required this.systemIndigo,
    required this.systemPurple,
    required this.systemPink,
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
  final Color systemGray01;
  final Color systemGray02;
  final Color systemGray03;
  final Color systemGray04;
  final Color systemGray05;
  final Color systemGray06;

  AcessibleColors lerp(
    AcessibleColors b,
    double t,
  ) {
    final instance = switch (t) {
      < 0.5 => this,
      _ => b,
    };
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
      systemGray01: Color.lerp(systemGray01, b.systemGray01, t),
      systemGray02: Color.lerp(systemGray02, b.systemGray02, t),
      systemGray03: Color.lerp(systemGray03, b.systemGray03, t),
      systemGray04: Color.lerp(systemGray04, b.systemGray04, t),
      systemGray05: Color.lerp(systemGray05, b.systemGray05, t),
      systemGray06: Color.lerp(systemGray06, b.systemGray06, t),
    );
  }

  AcessibleColors copyWith({
    Color? systemRed,
    Color? systemOrange,
    Color? systemYellow,
    Color? systemGreen,
    Color? systemTeal,
    Color? systemBlue,
    Color? systemIndigo,
    Color? systemPurple,
    Color? systemPink,
    Color? systemGray01,
    Color? systemGray02,
    Color? systemGray03,
    Color? systemGray04,
    Color? systemGray05,
    Color? systemGray06,
  });
}

final class AcessibleColorsLight extends AcessibleColors {
  const AcessibleColorsLight({
    Color? systemRed,
    Color? systemOrange,
    Color? systemYellow,
    Color? systemGreen,
    Color? systemTeal,
    Color? systemBlue,
    Color? systemIndigo,
    Color? systemPurple,
    Color? systemPink,
    Color? systemGray01,
    Color? systemGray02,
    Color? systemGray03,
    Color? systemGray04,
    Color? systemGray05,
    Color? systemGray06,
  }) : super(
          systemRed: systemRed ?? const Color(0xFFD70015),
          systemOrange: systemOrange ?? const Color(0xFFC93400),
          systemYellow: systemYellow ?? const Color(0xFFB25000),
          systemGreen: systemGreen ?? const Color(0xFF248A3D),
          systemTeal: systemTeal ?? const Color(0xFF0071A4),
          systemBlue: systemBlue ?? const Color(0xFF0040DD),
          systemIndigo: systemIndigo ?? const Color(0xFF3634A3),
          systemPurple: systemPurple ?? const Color(0xFF8944AB),
          systemPink: systemPink ?? const Color(0xFFD30F45),
          systemGray01: systemGray01 ?? const Color(0xFF6C6C70),
          systemGray02: systemGray02 ?? const Color(0xFF8E8E93),
          systemGray03: systemGray03 ?? const Color(0xFFAEAEB2),
          systemGray04: systemGray04 ?? const Color(0xFFBCBCC0),
          systemGray05: systemGray05 ?? const Color(0xFFD8D8DC),
          systemGray06: systemGray06 ?? const Color(0xFFEBEBF0),
        );

  @override
  AcessibleColors copyWith({
    Color? systemRed,
    Color? systemOrange,
    Color? systemYellow,
    Color? systemGreen,
    Color? systemTeal,
    Color? systemBlue,
    Color? systemIndigo,
    Color? systemPurple,
    Color? systemPink,
    Color? systemGray01,
    Color? systemGray02,
    Color? systemGray03,
    Color? systemGray04,
    Color? systemGray05,
    Color? systemGray06,
  }) =>
      AcessibleColorsLight(
        systemRed: systemRed,
        systemOrange: systemOrange,
        systemYellow: systemYellow,
        systemGreen: systemGreen,
        systemTeal: systemTeal,
        systemBlue: systemBlue,
        systemIndigo: systemIndigo,
        systemPurple: systemPurple,
        systemPink: systemPink,
        systemGray01: systemGray01,
        systemGray02: systemGray02,
        systemGray03: systemGray03,
        systemGray04: systemGray04,
        systemGray05: systemGray05,
        systemGray06: systemGray06,
      );
}

final class AcessibleColorsDark extends AcessibleColors {
  const AcessibleColorsDark({
    Color? systemRed,
    Color? systemOrange,
    Color? systemYellow,
    Color? systemGreen,
    Color? systemTeal,
    Color? systemBlue,
    Color? systemIndigo,
    Color? systemPurple,
    Color? systemPink,
    Color? systemGray01,
    Color? systemGray02,
    Color? systemGray03,
    Color? systemGray04,
    Color? systemGray05,
    Color? systemGray06,
  }) : super(
          systemRed: systemRed ?? const Color(0xFFFF6961),
          systemOrange: systemOrange ?? const Color(0xFFFFB340),
          systemYellow: systemYellow ?? const Color(0xFFFFD426),
          systemGreen: systemGreen ?? const Color(0xFF30DB5B),
          systemTeal: systemTeal ?? const Color(0xFF70D7FF),
          systemBlue: systemBlue ?? const Color(0xFF409CFF),
          systemIndigo: systemIndigo ?? const Color(0xFF7D7AFF),
          systemPurple: systemPurple ?? const Color(0xFFDA8FFF),
          systemPink: systemPink ?? const Color(0xFFFF6482),
          systemGray01: systemGray01 ?? const Color(0xFFAEAEB2),
          systemGray02: systemGray02 ?? const Color(0xFF7C7C80),
          systemGray03: systemGray03 ?? const Color(0xFF545456),
          systemGray04: systemGray04 ?? const Color(0xFF444446),
          systemGray05: systemGray05 ?? const Color(0xFF363638),
          systemGray06: systemGray06 ?? const Color(0xFF242426),
        );

  @override
  AcessibleColors copyWith({
    Color? systemRed,
    Color? systemOrange,
    Color? systemYellow,
    Color? systemGreen,
    Color? systemTeal,
    Color? systemBlue,
    Color? systemIndigo,
    Color? systemPurple,
    Color? systemPink,
    Color? systemGray01,
    Color? systemGray02,
    Color? systemGray03,
    Color? systemGray04,
    Color? systemGray05,
    Color? systemGray06,
  }) =>
      AcessibleColorsDark(
        systemRed: systemRed,
        systemOrange: systemOrange,
        systemYellow: systemYellow,
        systemGreen: systemGreen,
        systemTeal: systemTeal,
        systemBlue: systemBlue,
        systemIndigo: systemIndigo,
        systemPurple: systemPurple,
        systemPink: systemPink,
        systemGray01: systemGray01,
        systemGray02: systemGray02,
        systemGray03: systemGray03,
        systemGray04: systemGray04,
        systemGray05: systemGray05,
        systemGray06: systemGray06,
      );
}
