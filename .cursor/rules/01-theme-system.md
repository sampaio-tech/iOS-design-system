---
description: "Complete theme architecture including all 8 color palettes and 22 typography styles"
alwaysApply: false
---

# Theme System Architecture

## Overview

The theme system is the **foundation** of the entire design system. Every visual property in every widget derives from the theme. Understanding this system is critical.

## Core Components

### 1. IosThemeData (Sealed Class)

Location: `/lib/src/theme/settings/theme.dart`

The root theme class that contains all design tokens:

```dart
sealed class IosThemeData {
  const IosThemeData({
    required this.acessibleColors,           // Accessible color variants
    required this.defaultColors,             // System colors (blue, red, etc.)
    required this.defaultSystemBackgroundsColors,  // Screen backgrounds
    required this.defaultSystemGroupedBackgroundsColors, // Grouped backgrounds
    required this.defaultFillColors,         // Fill colors for UI elements
    required this.defaultLabelColors,        // Text colors
    required this.defaultSeparatorColors,    // Divider colors
    required this.systemColoursSeparatorColors, // System separator
    required this.systemMaterialsBackgroundsColors, // Material backgrounds
    required this.systemMaterialsLabelsTextColors, // Material text
    required this.systemMaterialsFillColors, // Material fills
    required this.typography,                // Text styles
    required this.weatherDecorations,        // Weather app theme
    required this.stocksDecorations,         // Stocks app theme
    required this.neutralMusicDecorations,   // Music app theme
    required this.neutralPodcastDecorations, // Podcast theme
    required this.appStoreDecorations,       // App Store theme
    required this.booksDecorations,          // Books theme
  });

  // Properties...
  Brightness get brightness; // Returns light or dark
  ThemeData textFieldThemeData(...); // Material theme for text fields
  CupertinoThemeData textFieldCupertinoThemeData(...);
}
```

### 2. Light and Dark Implementations

```dart
class IosLightThemeData extends IosThemeData {
  IosLightThemeData({
    // All parameters are optional with defaults
    AcessibleColors? acessibleColors,
    DefaultColors? defaultColors,
    // ... more
  }) : super(
    acessibleColors: acessibleColors ?? const AcessibleColorsLight(),
    defaultColors: defaultColors ?? const DefaultColorsLight(),
    // ... more with Light defaults
  );
}

class IosDarkThemeData extends IosThemeData {
  IosDarkThemeData({
    // Same parameters
  }) : super(
    acessibleColors: acessibleColors ?? const AcessibleColorsDark(),
    defaultColors: defaultColors ?? const DefaultColorsDark(),
    // ... more with Dark defaults
  );
}
```

### 3. IosTheme (InheritedWidget)

The widget that provides theme access down the tree:

```dart
class IosTheme extends StatelessWidget {
  const IosTheme({
    required this.data,
    required this.child,
    super.key,
  });

  final IosThemeData data;
  final Widget child;

  // Access method
  static IosThemeData of(BuildContext context) {
    final inheritedTheme = context.dependOnInheritedWidgetOfExactType<IosInheritedTheme>();
    return inheritedTheme?.theme.data ?? _kFallbackTheme(context);
  }

  @override
  Widget build(BuildContext context) => IosInheritedTheme(theme: this, child: child);
}
```

### 4. IosAnimatedTheme (Animated Transitions)

For smooth theme transitions:

```dart
class IosAnimatedTheme extends ImplicitlyAnimatedWidget {
  const IosAnimatedTheme({
    required this.data,
    required this.child,
    super.key,
    super.curve,
    super.duration = constants.kThemeAnimationDuration, // 180ms
  });

  final IosThemeData data;
  final Widget child;
}
```

## Color Systems (8 Palettes)

### 1. Default Colors (`theme.defaultColors`)

Location: `/lib/src/theme/colors/default.dart`

System colors that adapt between light/dark:

**Light Mode → Dark Mode**:
```dart
systemRed      #FF3B30 → #FF453A
systemOrange   #FF9500 → #FF9F0A
systemYellow   #FFCC00 → #FFD60A
systemGreen    #34C759 → #32D74B
systemTeal     #5AC8FA → #64D2FF
systemBlue     #007AFF → #0A84FF
systemIndigo   #5856D6 → #5E5CE6
systemPurple   #AF52DE → #BF5AF2
systemPink     #FF2D55 → #FF2D55
systemBlack    #000000 → #000000
systemWhite    #FFFFFF → #FFFFFF
systemGray01   #8E8E93 → #8E8E93
systemGray02   #AEAEB2 → #636366
systemGray03   #C7C7CC → #48484A
systemGray04   #D1D1D6 → #3A3A3C
systemGray05   #E5E5EA → #2C2C2E
systemGray06   #F2F2F7 → #1C1C1E
```

**When to use**:
- Action buttons (systemBlue for primary)
- Status indicators (systemGreen for success, systemRed for error)
- Icons (colored backgrounds)
- Accent colors

### 2. Label Colors (`theme.defaultLabelColors`)

Semantic text colors with opacity:

```dart
// Light Mode
primary    #000000 (100%)  // Main text
secondary  rgba(60,60,67,0.6) (60%)  // Secondary text
tertiary   rgba(60,60,67,0.3) (30%)  // Disabled text
quartenary rgba(60,60,67,0.18) (18%) // Placeholder

// Dark Mode
primary    #FFFFFF (100%)
secondary  rgba(235,235,245,0.6) (60%)
tertiary   rgba(235,235,245,0.3) (30%)
quartenary rgba(235,235,245,0.18) (18%)
```

**When to use**:
- `primary` - Body text, titles, main content
- `secondary` - Subtitles, secondary info, descriptions
- `tertiary` - Disabled labels, placeholder hints
- `quartenary` - Very light placeholder text

### 3. Fill Colors (`theme.defaultFillColors`)

Background fills for UI elements:

```dart
// Light Mode
primary    rgba(120,120,128,0.2)
secondary  rgba(120,120,128,0.16)
tertiary   rgba(120,120,128,0.12)
quartenary rgba(120,120,128,0.8)

// Dark Mode
primary    rgba(120,120,128,0.36)
secondary  rgba(120,120,128,0.32)
tertiary   rgba(120,120,128,0.24)
quartenary rgba(120,120,128,0.18)
```

**When to use**:
- Button backgrounds (secondary for grey buttons)
- Input field backgrounds
- Cell backgrounds
- Card backgrounds

### 4. System Backgrounds (`theme.defaultSystemBackgroundsColors`)

Screen-level backgrounds:

```dart
// Light Mode
primaryLight   #FFFFFF
secondaryLight #F2F2F7
tertiaryLight  #FFFFFF

// Dark Mode - Base (default)
primaryDarkBase   #000000
secondaryDarkBase #1C1C1E
tertiaryDarkBase  #2C2C2E

// Dark Mode - Elevated (modal, sheet)
primaryDarkElevated   #1C1C1E
secondaryDarkElevated #2C2C2E
tertiaryDarkElevated  #3A3A3C
```

**When to use**:
- Main screen backgrounds (`primaryLight` or `primaryDarkBase`)
- Content areas (`secondaryLight` or `secondaryDarkBase`)
- Nested containers (`tertiaryLight` or `tertiaryDarkBase`)
- Modals/sheets (use Elevated variants in dark mode)

### 5. Grouped Backgrounds (`theme.defaultSystemGroupedBackgroundsColors`)

Settings-style grouped list backgrounds:

```dart
// Light Mode
primaryLight   #F2F2F7  // Screen background
secondaryLight #FFFFFF  // Group background
tertiaryLight  #F2F2F7  // Nested group

// Dark Mode - Same structure as System Backgrounds
```

**When to use**:
- Settings screens (GroupedTableWidget)
- Forms with grouped sections
- Any grouped list view

### 6. Separator Colors (`theme.defaultSeparatorColors`)

```dart
// Light Mode
opaque    rgba(60,60,67,0.36)
nonOpaque #C6C6C8

// Dark Mode
opaque    rgba(84,84,88,0.65)
nonOpaque #38383A
```

**When to use**:
- `nonOpaque` - List row dividers (default)
- `opaque` - Borders, prominent separators

### 7. System Materials (Blur Effects)

Colors for use with backdrop filters:

```dart
theme.systemMaterialsBackgroundsColors.primary
theme.systemMaterialsLabelsTextColors.primary
theme.systemMaterialsFillColors.primary
```

**When to use**:
- Navigation bars with blur
- Toolbars with blur
- Sheets with blur background

### 8. App-Specific Decorations

Pre-built themes for specific iOS apps:

**Weather** (`theme.weatherDecorations`):
```dart
weatherDayGradient    // Blue gradient for day
weatherNightGradient  // Dark gradient for night
weatherRainGradient   // Grey gradient for rain
```

**Stocks** (`theme.stocksDecorations`):
```dart
stocksGradient // Dark gradient background
```

**Music** (`theme.neutralMusicDecorations`):
```dart
primaryBackground   // Card background
secondaryBackground // Secondary section
accentColor        // Accent highlights
```

**Podcast** (`theme.neutralPodcastDecorations`):
```dart
// Similar structure to Music
```

**App Store** (`theme.appStoreDecorations`):
```dart
// App Store specific colors
```

**Books** (`theme.booksDecorations`):
```dart
// Books app specific colors
```

## Typography System

Location: `/lib/src/theme/typography/typography.dart`

### Text Style Scale (22 Styles)

All use **SF Pro Text** font family:

```dart
// Large Titles (Page headers)
largeTitleRegular  // 34pt, 400, 41/34 line, 0.37 spacing
largeTitleBold     // 34pt, 700, 41/34 line, 0.37 spacing

// Titles
title1Regular      // 28pt, 400, 34/28 line, 0.36 spacing
title1Bold         // 28pt, 700, 34/28 line, 0.36 spacing
title2Regular      // 22pt, 400, 28/22 line, 0.35 spacing
title2Bold         // 22pt, 700, 28/22 line, 0.35 spacing
title3Regular      // 20pt, 400, 25/20 line, 0.38 spacing
title3Bold         // 20pt, 600, 25/20 line, 0.38 spacing

// Body (Most common)
headlineRegular    // 17pt, 600, 22/17 line, -0.41 spacing
headlineBold       // 17pt, 600, 22/17 line, -0.41 spacing
bodyRegular        // 17pt, 400, 22/17 line, -0.41 spacing (DEFAULT)
bodyBold           // 17pt, 600, 22/17 line, -0.41 spacing

// Small Text
calloutRegular     // 16pt, 400, 21/16 line, -0.32 spacing
calloutBold        // 16pt, 600, 21/16 line, -0.32 spacing
subheadlineRegular // 15pt, 400, 20/15 line, -0.24 spacing
subheadlineBold    // 15pt, 600, 18/15 line, -0.5 spacing

// Captions
footnoteRegular    // 13pt, 400, 18/13 line, -0.08 spacing
footnoteBold       // 13pt, 600, 18/13 line, -0.08 spacing
caption1Regular    // 12pt, 400, 16/12 line
caption1Bold       // 12pt, 500, 16/12 line
caption2Regular    // 11pt, 400, 13/11 line, 0.07 spacing
caption2Bold       // 11pt, 600, 13/11 line, 0.06 spacing
```

### Typography Usage

```dart
// Access typography
final theme = IosTheme.of(context);

// Apply to text
Text(
  'Hello World',
  style: theme.typography.bodyRegular,
)

// Modify with copyWith
Text(
  'Hello World',
  style: theme.typography.title1Bold.copyWith(
    color: theme.defaultLabelColors.primary,
  ),
)
```

## Theme Access Pattern

### Required Pattern (ALWAYS use this)

```dart
@override
Widget build(BuildContext context) {
  // Step 1: Get theme
  final theme = IosTheme.of(context);

  // Step 2: Extract values
  final backgroundColor = theme.defaultColors.systemBlue;
  final textColor = theme.defaultLabelColors.primary;
  final textStyle = theme.typography.bodyRegular;

  // Step 3: Use in widget
  return Container(
    color: backgroundColor,
    child: Text('Text', style: textStyle.copyWith(color: textColor)),
  );
}
```

### Theme Switching

```dart
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  IosThemeData _theme = IosLightThemeData();

  void _toggleTheme() {
    setState(() {
      _theme = switch (_theme) {
        IosLightThemeData() => IosDarkThemeData(),
        IosDarkThemeData() => IosLightThemeData(),
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return IosAnimatedTheme(
      data: _theme,
      duration: const Duration(milliseconds: 180),
      child: CupertinoApp(home: MyHome()),
    );
  }
}
```

### Brightness-Specific Styling

When you need different styling for light/dark:

```dart
final color = switch (theme) {
  IosLightThemeData() => theme.defaultColors.systemBlack,
  IosDarkThemeData() => theme.defaultColors.systemWhite,
};

// Or use brightness
final color = switch (theme.brightness) {
  Brightness.light => lightColor,
  Brightness.dark => darkColor,
};
```

## Constants

Location: `/lib/src/theme/settings/constants.dart`

```dart
// Animation Durations
const kAnimationInDuration = Duration(milliseconds: 180);
const kAnimationOutDuration = Duration(milliseconds: 120);
const kThemeAnimationDuration = kAnimationInDuration;

// Button
const kCupertinoButtonPressedOpacity = 0.8;
const kCupertinoButtonBorderRadius = BorderRadius.all(Radius.circular(6));
const kCupertinoButtonPadding = EdgeInsets.all(0);

// Safe Area
const kMinimumSafeAreaPadding = EdgeInsets.only(bottom: 34);

// Blur
final kImageFilterBlur = ImageFilter.blur(sigmaY: 10, sigmaX: 10);
```

## Theme Customization

### Override Specific Colors

```dart
IosLightThemeData(
  defaultColors: DefaultColorsLight(
    systemBlue: Color(0xFF0066FF), // Custom blue
  ),
)
```

### Override Typography

```dart
IosLightThemeData(
  typography: IosTypography(
    bodyRegular: TextStyle(
      fontFamily: 'SF',
      fontSize: 18, // Larger default
      fontWeight: FontWeight.w400,
    ),
  ),
)
```

### Custom App Decoration

See `.cursor/rules/06-app-themes.md` for creating new app decorations.

## CRITICAL Rules

1. **ALWAYS access via `IosTheme.of(context)`**
   - Never cache theme reference in state
   - Always get fresh reference in build method

2. **NEVER hardcode colors**
   - No `Color(0xFF...)` outside theme files
   - No `Colors.*` from Material

3. **NEVER hardcode text styles**
   - No `TextStyle(fontSize: ...)` from scratch
   - Always start from `theme.typography.*`

4. **ALWAYS support both modes**
   - Test in IosLightThemeData
   - Test in IosDarkThemeData
   - Use theme colors that adapt automatically

5. **ALWAYS use theme for ALL visual properties**
   - Colors
   - Typography
   - Spacing (use constants where applicable)
   - Decorations

## Troubleshooting

**Theme not found error**:
```dart
// ❌ Bad - no theme wrapper
CupertinoApp(home: MyWidget())

// ✅ Good
IosAnimatedTheme(
  data: IosLightThemeData(),
  child: CupertinoApp(home: MyWidget()),
)
```

**Colors not adapting**:
```dart
// ❌ Bad - hardcoded
color: Color(0xFF007AFF)

// ✅ Good - adapts automatically
color: theme.defaultColors.systemBlue
```

**Wrong text color**:
```dart
// ❌ Bad - using system color for text
color: theme.defaultColors.systemBlue

// ✅ Good - using label color
color: theme.defaultLabelColors.primary
```
