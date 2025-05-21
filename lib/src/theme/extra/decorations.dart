import 'package:flutter/material.dart';

import '../../../ios_design_system.dart';

BoxDecoration neutralWeatherRainBackgroundDecorationCallback(
  IosThemeData theme,
) => switch (theme) {
  IosLightThemeData() => const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFF657688), Color(0xFF4D5E70)],
    ),
  ),
  IosDarkThemeData() => const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFF657688), Color(0xFF4D5E70)],
    ),
  ),
};

BoxDecoration neutralWeatherNightBackgroundDecorationCallback(
  IosThemeData theme,
) => switch (theme) {
  IosLightThemeData() => const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFF020518), Color(0xFF283555)],
    ),
  ),
  IosDarkThemeData() => const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFF020518), Color(0xFF283555)],
    ),
  ),
};

BoxDecoration neutralWeatherDayBackgroundDecorationCallback(
  IosThemeData theme,
) => switch (theme) {
  IosLightThemeData() => const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFF074A8E), Color(0xFF5596D8)],
    ),
  ),
  IosDarkThemeData() => const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFF074A8E), Color(0xFF5596D8)],
    ),
  ),
};
