# Memories

## Patterns

### mem-1771341014-b9f5
> ComponentVariation properties should use primitive types (String, int, bool) for const constructors, not complex objects like ButtonSize
<!-- tags: flutter, architecture, data-models | created: 2026-02-17 -->

### mem-1771341011-9c1f
> iOS Design System theme API structure: defaultColors.* for system colors, defaultLabelColors.* for labels (primary/secondary/tertiary), defaultSystemGroupedBackgroundsColors.* for backgrounds, defaultSeparatorColors.* for separators
<!-- tags: ios-design-system, theme, colors | created: 2026-02-17 -->

### mem-1771341010-7adc
> iOS Design System ButtonSize uses concrete classes: SmallButtonSize, MediumButtonSize, LargeButtonSize (not enum values)
<!-- tags: ios-design-system, widgets, button | created: 2026-02-17 -->

### mem-1771340106-87f1
> Documentation app uses organized directory structure: lib/core/ for theme/routing/services, lib/shared/ for reusable components, lib/pages/ for page components, lib/data/ for models and content. This pattern separates concerns clearly.
<!-- tags: architecture, documentation | created: 2026-02-17 -->

## Decisions

## Fixes

### mem-1771340100-e425
> Flutter create generates code with experimental dot-shorthand syntax that fails to compile in Flutter 3.11.0. Fix by replacing .fromSeed() with ColorScheme.fromSeed() and .center with MainAxisAlignment.center
<!-- tags: flutter, tooling | created: 2026-02-17 -->

## Context
