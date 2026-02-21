---
name: theme-system
description: iOS Design System theme architecture - colors, typography, and usage patterns
---

## Theme System Overview

This iOS Design System uses a centralized theme system with 8 color palettes, 22 typography styles, and automatic light/dark mode support.

## Theme Access Pattern

Always access theme via context:

```dart
final theme = IosTheme.of(context);
```

## Color Systems

### 1. System Colors (`theme.defaultColors`)
Standard iOS colors that adapt to brightness:
- `systemBlue`, `systemRed`, `systemGreen`, `systemYellow`, `systemOrange`
- `systemPink`, `systemPurple`, `systemTeal`, `systemIndigo`
- `systemGray01` through `systemGray06`
- `systemBlack`, `systemWhite`

### 2. Label Colors (`theme.defaultLabelColors`)
Semantic text colors:
- `primary` - Main text (100% opacity)
- `secondary` - Secondary text (60% opacity)
- `tertiary` - Disabled text (30% opacity)
- `quartenary` - Placeholder (18% opacity)

### 3. Fill Colors (`theme.defaultFillColors`)
Background fills for UI elements:
- `primary`, `secondary`, `tertiary`, `quartenary`
- Auto-adapting opacity for light/dark

### 4. System Backgrounds (`theme.defaultSystemBackgroundsColors`)
Screen-level backgrounds:
- `primaryLight`, `primaryDarkBase`, `primaryDarkElevated`
- `secondaryLight`, `secondaryDarkBase`, `secondaryDarkElevated`
- `tertiaryLight`, `tertiaryDarkBase`, `tertiaryDarkElevated`

### 5. Grouped Backgrounds (`theme.defaultSystemGroupedBackgroundsColors`)
For Settings-style grouped lists (same structure as System Backgrounds)

### 6. Separator Colors (`theme.defaultSeparatorColors`)
- `opaque` - Prominent borders
- `nonOpaque` - List dividers (default)

### 7. System Materials
Colors for blur effects:
- `systemMaterialsBackgroundsColors`
- `systemMaterialsLabelsTextColors`
- `systemMaterialsFillColors`

### 8. App Decorations
Pre-built themes:
- `weatherDecorations` - Weather app gradients
- `stocksDecorations` - Stocks dark theme
- `neutralMusicDecorations` - Apple Music theme
- `neutralPodcastDecorations` - Podcast theme
- `appStoreDecorations` - App Store theme
- `booksDecorations` - Books theme

## Typography System

22 text styles using SF Pro Text font:

### Titles
- `largeTitleRegular/Bold` - 34pt (Page headers)
- `title1Regular/Bold` - 28pt
- `title2Regular/Bold` - 22pt
- `title3Regular/Bold` - 20pt

### Body
- `headlineRegular/Bold` - 17pt semibold
- `bodyRegular/Bold` - 17pt (default text)
- `calloutRegular/Bold` - 16pt
- `subheadlineRegular/Bold` - 15pt

### Small
- `footnoteRegular/Bold` - 13pt
- `caption1Regular/Bold` - 12pt
- `caption2Regular/Bold` - 11pt (smallest)

## Usage Examples

### Basic Theme Access
```dart
@override
Widget build(BuildContext context) {
  final theme = IosTheme.of(context);

  return Container(
    color: theme.defaultColors.systemBlue,
    child: Text(
      'Hello',
      style: theme.typography.bodyRegular.copyWith(
        color: theme.defaultLabelColors.primary,
      ),
    ),
  );
}
```

### Brightness-Specific Styling
```dart
final backgroundColor = switch (theme) {
  IosLightThemeData() => theme.defaultSystemBackgroundsColors.primaryLight,
  IosDarkThemeData() => theme.defaultSystemBackgroundsColors.primaryDarkBase,
};
```

### Theme Injection
```dart
void main() {
  runApp(
    IosAnimatedTheme(
      data: IosLightThemeData(), // or IosDarkThemeData()
      duration: Duration(milliseconds: 180),
      child: CupertinoApp(home: MyApp()),
    ),
  );
}
```

## Critical Rules

1. **ALWAYS** access via `IosTheme.of(context)`
2. **NEVER** hardcode colors (`Color(0x...)` or `Colors.*`)
3. **NEVER** hardcode text styles (use `theme.typography.*`)
4. **ALWAYS** test both light and dark modes
5. **ALWAYS** use theme for ALL visual properties

## Common Theme Patterns

**Primary action color:**
```dart
theme.defaultColors.systemBlue
```

**Main text:**
```dart
theme.defaultLabelColors.primary
```

**Button background:**
```dart
theme.defaultFillColors.secondary
```

**Screen background:**
```dart
theme.defaultSystemBackgroundsColors.primaryLight // light mode
theme.defaultSystemBackgroundsColors.primaryDarkBase // dark mode
```

**Divider:**
```dart
theme.defaultSeparatorColors.nonOpaque
```

## File Locations

- Theme implementation: `/lib/src/theme/settings/theme.dart`
- Colors: `/lib/src/theme/colors/default.dart`
- Typography: `/lib/src/theme/typography/typography.dart`
- Constants: `/lib/src/theme/settings/constants.dart`
