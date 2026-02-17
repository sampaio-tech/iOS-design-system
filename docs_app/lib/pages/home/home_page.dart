import 'package:flutter/cupertino.dart';
import 'package:ios_design_system/ios_design_system.dart';
import '../components/button_preview_demo.dart';

/// Home page for the documentation website
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Hero section
        Center(
          child: Column(
            children: [
              Icon(
                CupertinoIcons.cube_box_fill,
                size: 80,
                color: theme.defaultColors.systemBlue,
              ),
              const SizedBox(height: 24),
              Text(
                'iOS Design System',
                style: theme.typography.largeTitleBold.copyWith(
                  color: theme.defaultLabelColors.primary,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'A comprehensive Flutter design system inspired by iOS',
                style: theme.typography.title3Regular.copyWith(
                  color: theme.defaultLabelColors.secondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // CTA buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonWidget.label(
                    size: const LargeButtonSize(),
                    color: const BlueButtonColor(),
                    onPressed: () {
                      // TODO: Navigate to getting started
                    },
                    label: 'Get Started',
                  ),
                  const SizedBox(width: 16),
                  ButtonWidget.label(
                    size: const LargeButtonSize(),
                    color: const GreyTransparentButtonColor(),
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (_) => const ButtonPreviewDemo(),
                        ),
                      );
                    },
                    label: 'Preview Demo',
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 80),

        // Features section
        Text(
          'Features',
          style: theme.typography.title1Bold.copyWith(
            color: theme.defaultLabelColors.primary,
          ),
        ),
        const SizedBox(height: 32),

        _buildFeatureGrid(context),
      ],
    );
  }

  Widget _buildFeatureGrid(BuildContext context) {
    final features = [
      const _Feature(
        icon: CupertinoIcons.paintbrush_fill,
        title: 'iOS-Inspired Design',
        description: 'Authentic iOS design language with native-feeling components',
      ),
      const _Feature(
        icon: CupertinoIcons.moon_stars_fill,
        title: 'Light & Dark Themes',
        description: 'Built-in support for light and dark modes with smooth transitions',
      ),
      const _Feature(
        icon: CupertinoIcons.square_stack_3d_up_fill,
        title: 'Rich Component Library',
        description: 'Comprehensive set of pre-built, customizable components',
      ),
      const _Feature(
        icon: CupertinoIcons.wand_stars,
        title: 'Extensible',
        description: 'Easy to customize and extend with your own components',
      ),
      const _Feature(
        icon: CupertinoIcons.textformat_size,
        title: 'Typography System',
        description: 'SF Pro font stack with iOS-standard text styles',
      ),
      const _Feature(
        icon: CupertinoIcons.color_filter_fill,
        title: 'Color Palette',
        description: 'Complete iOS color palette with semantic colors',
      ),
    ];

    return Wrap(
      spacing: 24,
      runSpacing: 24,
      children: features.map((feature) => _buildFeatureCard(context, feature)).toList(),
    );
  }

  Widget _buildFeatureCard(BuildContext context, _Feature feature) {
    final theme = IosTheme.of(context);

    return Container(
      width: 350,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.defaultSystemBackgroundsColors.secondaryLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.defaultSeparatorColors.opaque,
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            feature.icon,
            size: 32,
            color: theme.defaultColors.systemBlue,
          ),
          const SizedBox(height: 16),
          Text(
            feature.title,
            style: theme.typography.headlineRegular.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.defaultLabelColors.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            feature.description,
            style: theme.typography.bodyRegular.copyWith(
              color: theme.defaultLabelColors.secondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _Feature {
  final IconData icon;
  final String title;
  final String description;

  const _Feature({
    required this.icon,
    required this.title,
    required this.description,
  });
}
