import 'package:flutter/material.dart';
import 'package:ios_design_system/ios_design_system.dart';
import '../../data/models/preview_config.dart';
import '../../data/models/component_variation.dart';
import '../../data/models/component_state.dart';

/// A widget that displays an interactive preview of a component with controls
/// for switching variations, states, and themes.
class ComponentPreview extends StatefulWidget {
  final String componentName;
  final Widget Function(BuildContext, PreviewConfig) builder;
  final List<ComponentVariation> variations;
  final List<ComponentState> states;
  final bool showThemeToggle;
  final bool showDeviceFrame;
  final double? height;

  const ComponentPreview({
    super.key,
    required this.componentName,
    required this.builder,
    required this.variations,
    this.states = const [],
    this.showThemeToggle = true,
    this.showDeviceFrame = false,
    this.height,
  });

  @override
  State<ComponentPreview> createState() => _ComponentPreviewState();
}

class _ComponentPreviewState extends State<ComponentPreview> {
  late ComponentVariation _selectedVariation;
  ComponentState? _selectedState;
  bool _isDarkTheme = false;

  @override
  void initState() {
    super.initState();
    _selectedVariation = widget.variations.first;
    _selectedState = widget.states.isNotEmpty ? widget.states.first : null;
  }

  IosThemeData get _previewTheme =>
      _isDarkTheme ? IosDarkThemeData() : IosLightThemeData();

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.defaultSeparatorColors.opaque,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Controls
          _buildControls(theme),

          // Preview canvas
          _buildPreviewCanvas(),
        ],
      ),
    );
  }

  Widget _buildControls(IosThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.defaultSystemGroupedBackgroundsColors.secondaryLight,
        border: Border(
          bottom: BorderSide(
            color: theme.defaultSeparatorColors.opaque,
          ),
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Wrap(
        spacing: 16,
        runSpacing: 8,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          // Variation selector
          if (widget.variations.length > 1) _buildVariationSelector(theme),

          // State selector
          if (widget.states.isNotEmpty) _buildStateSelector(theme),

          const Spacer(),

          // Theme toggle
          if (widget.showThemeToggle) _buildThemeToggle(theme),
        ],
      ),
    );
  }

  Widget _buildVariationSelector(IosThemeData theme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Variation:',
          style: theme.typography.bodyRegular.copyWith(
            color: theme.defaultLabelColors.secondary,
          ),
        ),
        const SizedBox(width: 8),
        DropdownButton<ComponentVariation>(
          value: _selectedVariation,
          items: widget.variations.map((variation) {
            return DropdownMenuItem(
              value: variation,
              child: Text(variation.name),
            );
          }).toList(),
          onChanged: (variation) {
            if (variation != null) {
              setState(() {
                _selectedVariation = variation;
              });
            }
          },
        ),
      ],
    );
  }

  Widget _buildStateSelector(IosThemeData theme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'State:',
          style: theme.typography.bodyRegular.copyWith(
            color: theme.defaultLabelColors.secondary,
          ),
        ),
        const SizedBox(width: 8),
        DropdownButton<ComponentState>(
          value: _selectedState,
          items: widget.states.map((state) {
            return DropdownMenuItem(
              value: state,
              child: Text(state.name),
            );
          }).toList(),
          onChanged: (state) {
            setState(() {
              _selectedState = state;
            });
          },
        ),
      ],
    );
  }

  Widget _buildThemeToggle(IosThemeData theme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.light_mode,
          size: 16,
          color: !_isDarkTheme
              ? theme.defaultColors.systemBlue
              : theme.defaultLabelColors.tertiary,
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              _isDarkTheme = !_isDarkTheme;
            });
          },
          child: Container(
            width: 44,
            height: 26,
            decoration: BoxDecoration(
              color: _isDarkTheme
                  ? theme.defaultColors.systemGreen
                  : theme.defaultColors.systemGray05,
              borderRadius: BorderRadius.circular(13),
            ),
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              alignment:
                  _isDarkTheme ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 22,
                height: 22,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Icon(
          Icons.dark_mode,
          size: 16,
          color: _isDarkTheme
              ? theme.defaultColors.systemBlue
              : theme.defaultLabelColors.tertiary,
        ),
      ],
    );
  }

  Widget _buildPreviewCanvas() {
    final config = PreviewConfig(
      theme: _previewTheme,
      variation: _selectedVariation,
      state: _selectedState,
    );

    return IosAnimatedTheme(
      data: _previewTheme,
      child: Container(
        height: widget.height ?? 300,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: _previewTheme.defaultSystemGroupedBackgroundsColors.primaryLight,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: Center(
          child: widget.builder(context, config),
        ),
      ),
    );
  }
}
