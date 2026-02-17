import 'package:flutter/cupertino.dart';
import 'package:ios_design_system/ios_design_system.dart';
import 'package:url_launcher/url_launcher.dart';

/// Footer component for the documentation website
class DocumentationFooter extends StatelessWidget {
  const DocumentationFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: theme.defaultSystemGroupedBackgroundsColors.secondaryLight,
        border: Border(
          top: BorderSide(
            color: theme.defaultSeparatorColors.opaque,
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        children: [
          // Links row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLink(
                context,
                'GitHub',
                'https://github.com/pedrohsampaioo/ios_design_system',
              ),
              const SizedBox(width: 24),
              _buildLink(
                context,
                'pub.dev',
                'https://pub.dev/packages/ios_design_system',
              ),
              const SizedBox(width: 24),
              _buildLink(
                context,
                'Issues',
                'https://github.com/pedrohsampaioo/ios_design_system/issues',
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Copyright
          Text(
            '© 2025 iOS Design System. Built with Flutter.',
            style: theme.typography.caption1Regular.copyWith(
              color: theme.defaultLabelColors.secondary,
            ),
          ),
          const SizedBox(height: 4),

          // Version
          Text(
            'v1.0.0',
            style: theme.typography.caption2Regular.copyWith(
              color: theme.defaultLabelColors.tertiary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLink(BuildContext context, String label, String url) {
    final theme = IosTheme.of(context);

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        launchUrl(
          Uri.parse(url),
          mode: LaunchMode.externalApplication,
        );
      },
      child: Text(
        label,
        style: theme.typography.bodyRegular.copyWith(
          color: theme.defaultColors.systemBlue,
        ),
      ),
    );
  }
}
