import 'package:flutter/cupertino.dart';
import 'package:ios_design_system/ios_design_system.dart';

/// Sidebar navigation component for the documentation website
class NavigationSidebar extends StatelessWidget {
  final String? currentPath;

  const NavigationSidebar({
    this.currentPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);

    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: theme.defaultSystemGroupedBackgroundsColors.secondaryLight,
        border: Border(
          right: BorderSide(
            color: theme.defaultSeparatorColors.opaque,
            width: 0.5,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection(
                context,
                title: 'Getting Started',
                items: const [
                  _NavItem(title: 'Introduction', path: '/'),
                  _NavItem(title: 'Installation', path: '/getting-started/installation'),
                  _NavItem(title: 'Quick Start', path: '/getting-started/quick-start'),
                ],
              ),
              const SizedBox(height: 24),
              _buildSection(
                context,
                title: 'Foundation',
                items: const [
                  _NavItem(title: 'Theme System', path: '/foundation/theme'),
                  _NavItem(title: 'Colors', path: '/foundation/colors'),
                  _NavItem(title: 'Typography', path: '/foundation/typography'),
                ],
              ),
              const SizedBox(height: 24),
              _buildSection(
                context,
                title: 'Components',
                items: const [
                  _NavItem(title: 'Buttons', path: '/components/button'),
                  _NavItem(title: 'Text Fields', path: '/components/text-fields'),
                  _NavItem(title: 'Navigation Bar', path: '/components/navigation-bar'),
                  _NavItem(title: 'Modal Sheet', path: '/components/modal-sheet'),
                  _NavItem(title: 'Grouped Table', path: '/components/grouped-table'),
                ],
              ),
              const SizedBox(height: 24),
              _buildSection(
                context,
                title: 'Patterns',
                items: const [
                  _NavItem(title: 'Forms', path: '/patterns/forms'),
                  _NavItem(title: 'Lists', path: '/patterns/lists'),
                  _NavItem(title: 'Navigation', path: '/patterns/navigation'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required List<_NavItem> items,
  }) {
    final theme = IosTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.typography.subheadlineBold.copyWith(
            color: theme.defaultLabelColors.primary,
          ),
        ),
        const SizedBox(height: 12),
        ...items.map(
          (item) => _buildNavItem(context, item),
        ),
      ],
    );
  }

  Widget _buildNavItem(BuildContext context, _NavItem item) {
    final theme = IosTheme.of(context);
    final isActive = currentPath == item.path;

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        // TODO: Implement navigation
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        margin: const EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(
          color: isActive
              ? theme.defaultColors.systemBlue.withValues(alpha: 0.1)
              : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          item.title,
          style: theme.typography.bodyRegular.copyWith(
            color: isActive
                ? theme.defaultColors.systemBlue
                : theme.defaultLabelColors.primary,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final String title;
  final String path;

  const _NavItem({
    required this.title,
    required this.path,
  });
}
