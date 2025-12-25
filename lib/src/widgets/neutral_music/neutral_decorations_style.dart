import 'package:flutter/material.dart';

import '../../theme/settings/theme.dart';

/// A style class that allows choosing between neutral music decorations,
/// neutral podcast decorations, or custom decorations.
sealed class NeutralDecorationsStyle {
  const NeutralDecorationsStyle();

  /// Returns the primary background decoration for large widgets.
  BoxDecoration primaryBackgroundLargeWidget(IosThemeData theme);

  /// Returns the secondary background decoration for large widgets.
  BoxDecoration secondaryBackgroundLargeWidget(IosThemeData theme);

  /// Returns the default background decoration.
  BoxDecoration backgroundDefault(IosThemeData theme);

  /// Returns the background decoration for pill buttons.
  BoxDecoration backgroundPillButton(IosThemeData theme);

  /// Returns the background decoration for circular buttons.
  BoxDecoration backgroundCircularButton(IosThemeData theme);

  /// Returns the title color.
  Color titleColor(IosThemeData theme);

  /// Returns the metadata color.
  Color metadataColor(IosThemeData theme);
}

/// Style that uses neutral music decorations from the theme.
class NeutralMusicDecorationsStyle extends NeutralDecorationsStyle {
  const NeutralMusicDecorationsStyle();

  @override
  BoxDecoration primaryBackgroundLargeWidget(IosThemeData theme) =>
      theme.neutralMusicDecorations.gradients.primaryBackgroundLargeWidget;

  @override
  BoxDecoration secondaryBackgroundLargeWidget(IosThemeData theme) =>
      theme.neutralMusicDecorations.gradients.secondaryBackgroundLargeWidget;

  @override
  BoxDecoration backgroundDefault(IosThemeData theme) =>
      theme.neutralMusicDecorations.gradients.backgroundDefault;

  @override
  BoxDecoration backgroundPillButton(IosThemeData theme) =>
      theme.neutralMusicDecorations.gradients.backgroundPillButton;

  @override
  BoxDecoration backgroundCircularButton(IosThemeData theme) =>
      theme.neutralMusicDecorations.gradients.backgroundCircularButton;

  @override
  Color titleColor(IosThemeData theme) =>
      theme.neutralMusicDecorations.defaultColors.title;

  @override
  Color metadataColor(IosThemeData theme) =>
      theme.neutralMusicDecorations.defaultColors.metadata;
}

/// Style that uses neutral podcast decorations from the theme.
class NeutralPodcastDecorationsStyle extends NeutralDecorationsStyle {
  const NeutralPodcastDecorationsStyle();

  @override
  BoxDecoration primaryBackgroundLargeWidget(IosThemeData theme) =>
      theme.neutralPodcastDecorations.gradients.primaryBackgroundLargeWidget;

  @override
  BoxDecoration secondaryBackgroundLargeWidget(IosThemeData theme) =>
      theme.neutralPodcastDecorations.gradients.secondaryBackgroundLargeWidget;

  @override
  BoxDecoration backgroundDefault(IosThemeData theme) =>
      theme.neutralPodcastDecorations.gradients.backgroundDefault;

  @override
  BoxDecoration backgroundPillButton(IosThemeData theme) =>
      theme.neutralPodcastDecorations.gradients.backgroundPillButton;

  @override
  BoxDecoration backgroundCircularButton(IosThemeData theme) =>
      theme.neutralPodcastDecorations.gradients.backgroundCircularButton;

  @override
  Color titleColor(IosThemeData theme) =>
      theme.neutralPodcastDecorations.defaultColors.title;

  @override
  Color metadataColor(IosThemeData theme) =>
      theme.neutralPodcastDecorations.defaultColors.metadata;
}

/// Style with custom decorations.
class CustomNeutralDecorationsStyle extends NeutralDecorationsStyle {
  const CustomNeutralDecorationsStyle({
    required this.primaryBackgroundLargeWidgetCallback,
    required this.secondaryBackgroundLargeWidgetCallback,
    required this.backgroundDefaultCallback,
    required this.backgroundPillButtonCallback,
    required this.backgroundCircularButtonCallback,
    required this.titleColorCallback,
    required this.metadataColorCallback,
  });

  final BoxDecoration Function(IosThemeData theme)
  primaryBackgroundLargeWidgetCallback;
  final BoxDecoration Function(IosThemeData theme)
  secondaryBackgroundLargeWidgetCallback;
  final BoxDecoration Function(IosThemeData theme) backgroundDefaultCallback;
  final BoxDecoration Function(IosThemeData theme) backgroundPillButtonCallback;
  final BoxDecoration Function(IosThemeData theme)
  backgroundCircularButtonCallback;
  final Color Function(IosThemeData theme) titleColorCallback;
  final Color Function(IosThemeData theme) metadataColorCallback;

  @override
  BoxDecoration primaryBackgroundLargeWidget(IosThemeData theme) =>
      primaryBackgroundLargeWidgetCallback(theme);

  @override
  BoxDecoration secondaryBackgroundLargeWidget(IosThemeData theme) =>
      secondaryBackgroundLargeWidgetCallback(theme);

  @override
  BoxDecoration backgroundDefault(IosThemeData theme) =>
      backgroundDefaultCallback(theme);

  @override
  BoxDecoration backgroundPillButton(IosThemeData theme) =>
      backgroundPillButtonCallback(theme);

  @override
  BoxDecoration backgroundCircularButton(IosThemeData theme) =>
      backgroundCircularButtonCallback(theme);

  @override
  Color titleColor(IosThemeData theme) => titleColorCallback(theme);

  @override
  Color metadataColor(IosThemeData theme) => metadataColorCallback(theme);
}
