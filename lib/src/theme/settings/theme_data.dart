import 'package:flutter/material.dart';

import '../../../ios_design_system.dart';

final class AppThemeData {
  const AppThemeData._();
  static ThemeData kTextFieldThemeData(Brightness brightness) => ThemeData(
        brightness: brightness,
        splashColor: switch (brightness) {
          Brightness.light => DefaultColors.systemBlueLight,
          Brightness.dark => DefaultColors.systemBlueDark,
        },
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: switch (brightness) {
            Brightness.light => DefaultColors.systemBlueLight,
            Brightness.dark => DefaultColors.systemBlueDark,
          },
          selectionColor: switch (brightness) {
            Brightness.light => DefaultColors.systemBlueLight.withOpacity(.2),
            Brightness.dark => DefaultLabelColors.primaryDark.withOpacity(.2),
          },
          selectionHandleColor: switch (brightness) {
            Brightness.light => DefaultColors.systemBlueLight.withOpacity(.2),
            Brightness.dark => DefaultColors.systemBlueDark.withOpacity(.2),
          },
        ),
      );
}
