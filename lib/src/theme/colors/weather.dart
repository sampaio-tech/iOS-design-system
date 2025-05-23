part of 'colors.dart';

sealed class WeatherBackgroundsColors {
  const WeatherBackgroundsColors({
    required this.rain,
    required this.night,
    required this.day,
  });

  final BoxDecoration rain;
  final BoxDecoration night;
  final BoxDecoration day;

  WeatherBackgroundsColors lerp(WeatherBackgroundsColors b, double t) {
    if (identical(this, b)) {
      return this;
    }
    final instance = t < 0.5 ? this : b;
    return instance.copyWith(
      rain: BoxDecoration.lerp(rain, b.rain, t),
      night: BoxDecoration.lerp(night, b.night, t),
      day: BoxDecoration.lerp(day, b.day, t),
    );
  }

  WeatherBackgroundsColors copyWith({
    BoxDecoration? rain,
    BoxDecoration? night,
    BoxDecoration? day,
  });
}

final class WeatherBackgroundsColorsLight extends WeatherBackgroundsColors {
  const WeatherBackgroundsColorsLight({
    BoxDecoration rain = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF657688), Color(0xFF4D5E70)],
      ),
    ),
    BoxDecoration night = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF020518), Color(0xFF283555)],
      ),
    ),
    BoxDecoration day = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF1A1A1A), Color(0xFF0D0D0D)],
      ),
    ),
  }) : super(rain: rain, night: night, day: day);

  WeatherBackgroundsColors copyWith({
    BoxDecoration? rain,
    BoxDecoration? night,
    BoxDecoration? day,
  }) => WeatherBackgroundsColorsLight(
    rain: rain ?? this.rain,
    night: night ?? this.night,
    day: day ?? this.day,
  );
}

final class WeatherBackgroundsColorsDark extends WeatherBackgroundsColors {
  const WeatherBackgroundsColorsDark({
    BoxDecoration rain = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF657688), Color(0xFF4D5E70)],
      ),
    ),
    BoxDecoration night = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF020518), Color(0xFF283555)],
      ),
    ),
    BoxDecoration day = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF1A1A1A), Color(0xFF0D0D0D)],
      ),
    ),
  }) : super(rain: rain, night: night, day: day);

  WeatherBackgroundsColors copyWith({
    BoxDecoration? rain,
    BoxDecoration? night,
    BoxDecoration? day,
  }) => WeatherBackgroundsColorsDark(
    rain: rain ?? this.rain,
    night: night ?? this.night,
    day: day ?? this.day,
  );
}
