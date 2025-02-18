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
}

final class AcessibleColorsLight extends AcessibleColors {
  const AcessibleColorsLight()
      : super(
          systemRed: const Color(0xFFD70015),
          systemOrange: const Color(0xFFC93400),
          systemYellow: const Color(0xFFB25000),
          systemGreen: const Color(0xFF248A3D),
          systemTeal: const Color(0xFF0071A4),
          systemBlue: const Color(0xFF0040DD),
          systemIndigo: const Color(0xFF3634A3),
          systemPurple: const Color(0xFF8944AB),
          systemPink: const Color(0xFFD30F45),
          systemGray01: const Color(0xFF6C6C70),
          systemGray02: const Color(0xFF8E8E93),
          systemGray03: const Color(0xFFAEAEB2),
          systemGray04: const Color(0xFFBCBCC0),
          systemGray05: const Color(0xFFD8D8DC),
          systemGray06: const Color(0xFFEBEBF0),
        );
}

final class AcessibleColorsDark extends AcessibleColors {
  const AcessibleColorsDark()
      : super(
          systemRed: const Color(0xFFFF6961),
          systemOrange: const Color(0xFFFFB340),
          systemYellow: const Color(0xFFFFD426),
          systemGreen: const Color(0xFF30DB5B),
          systemTeal: const Color(0xFF70D7FF),
          systemBlue: const Color(0xFF409CFF),
          systemIndigo: const Color(0xFF7D7AFF),
          systemPurple: const Color(0xFFDA8FFF),
          systemPink: const Color(0xFFFF6482),
          systemGray01: const Color(0xFFAEAEB2),
          systemGray02: const Color(0xFF7C7C80),
          systemGray03: const Color(0xFF545456),
          systemGray04: const Color(0xFF444446),
          systemGray05: const Color(0xFF363638),
          systemGray06: const Color(0xFF242426),
        );
}
