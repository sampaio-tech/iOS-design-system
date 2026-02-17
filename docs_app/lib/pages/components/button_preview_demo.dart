import 'package:flutter/cupertino.dart';
import 'package:ios_design_system/ios_design_system.dart';
import '../../data/models/component_variation.dart';
import '../../data/models/component_state.dart';
import '../../shared/widgets/component_preview.dart';

/// Demo page showcasing the ComponentPreview widget with ButtonWidget examples.
class ButtonPreviewDemo extends StatelessWidget {
  const ButtonPreviewDemo({super.key});

  static final List<ComponentVariation> _variations = [
    const ComponentVariation(
      id: 'small-blue',
      name: 'Small Blue',
      description: 'Small button with blue color',
      properties: {
        'size': 'small',
        'color': 'blue',
      },
    ),
    const ComponentVariation(
      id: 'medium-blue',
      name: 'Medium Blue',
      description: 'Medium button with blue color',
      properties: {
        'size': 'medium',
        'color': 'blue',
      },
    ),
    const ComponentVariation(
      id: 'large-blue',
      name: 'Large Blue',
      description: 'Large button with blue color',
      properties: {
        'size': 'large',
        'color': 'blue',
      },
    ),
    const ComponentVariation(
      id: 'medium-grey',
      name: 'Medium Grey',
      description: 'Medium button with grey transparent color',
      properties: {
        'size': 'medium',
        'color': 'grey',
      },
    ),
  ];

  static final List<ComponentState> _states = [
    const ComponentState(
      id: 'enabled',
      name: 'Enabled',
      enabled: true,
    ),
    const ComponentState(
      id: 'disabled',
      name: 'Disabled',
      enabled: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);

    return CupertinoPageScaffold(
      backgroundColor: theme.defaultSystemGroupedBackgroundsColors.primaryLight,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Component Preview Demo',
                style: theme.typography.largeTitleBold.copyWith(
                  color: theme.defaultLabelColors.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Interactive preview system for components with variations and states',
                style: theme.typography.bodyRegular.copyWith(
                  color: theme.defaultLabelColors.secondary,
                ),
              ),
              const SizedBox(height: 32),
              ComponentPreview(
                componentName: 'ButtonWidget',
                variations: _variations,
                states: _states,
                height: 200,
                builder: (context, config) {
                  final sizeType = config.variation.properties['size'] as String;
                  final colorType = config.variation.properties['color'] as String;
                  final isEnabled = config.state?.enabled ?? true;

                  final ButtonSize size = switch (sizeType) {
                    'small' => const SmallButtonSize(),
                    'large' => const LargeButtonSize(),
                    _ => const MediumButtonSize(),
                  };

                  return ButtonWidget.label(
                    label: 'Tap Me',
                    size: size,
                    color: colorType == 'blue'
                        ? const BlueButtonColor()
                        : const GreyTransparentButtonColor(),
                    onPressed: isEnabled ? () {} : null,
                  );
                },
              ),
              const SizedBox(height: 24),
              Text(
                'Features',
                style: theme.typography.title3Bold.copyWith(
                  color: theme.defaultLabelColors.primary,
                ),
              ),
              const SizedBox(height: 16),
              _buildFeatureList(theme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureList(IosThemeData theme) {
    final features = [
      'Switch between different component variations',
      'Toggle component states (enabled/disabled)',
      'Independent theme toggle (light/dark)',
      'Isolated preview canvas',
      'Responsive control layout',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: features.map((feature) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 6,
                height: 6,
                margin: const EdgeInsets.only(top: 8, right: 12),
                decoration: BoxDecoration(
                  color: theme.defaultColors.systemBlue,
                  shape: BoxShape.circle,
                ),
              ),
              Expanded(
                child: Text(
                  feature,
                  style: theme.typography.bodyRegular.copyWith(
                    color: theme.defaultLabelColors.primary,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
