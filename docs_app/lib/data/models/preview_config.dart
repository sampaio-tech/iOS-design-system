import 'package:ios_design_system/ios_design_system.dart';
import 'component_variation.dart';
import 'component_state.dart';

/// Configuration for a component preview, including theme, variation, and state.
class PreviewConfig {
  final IosThemeData theme;
  final ComponentVariation variation;
  final ComponentState? state;

  const PreviewConfig({
    required this.theme,
    required this.variation,
    this.state,
  });

  /// Creates a copy of this config with the given fields replaced.
  PreviewConfig copyWith({
    IosThemeData? theme,
    ComponentVariation? variation,
    ComponentState? state,
  }) {
    return PreviewConfig(
      theme: theme ?? this.theme,
      variation: variation ?? this.variation,
      state: state ?? this.state,
    );
  }
}
