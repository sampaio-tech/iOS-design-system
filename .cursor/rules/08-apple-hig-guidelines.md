---
description: "iOS spacing, sizing, color conventions, icon standards, and Apple HIG compliance"
alwaysApply: false
---

# Apple HIG Guidelines & Conventions

Design system conventions based on Apple's Human Interface Guidelines for iOS.

## Spacing System

### Standard Spacing Values

```dart
// Micro spacing
4pt   // Between related tags, chips
8pt   // Between buttons, small elements

// Standard spacing
12pt  // Row content vertical padding
16pt  // Screen edge padding, element spacing
24pt  // Section spacing, grouped table separation
32pt  // Large section breaks

// Component-specific
5pt   // Icon background padding
7pt   // Icon border radius
10pt  // Search field border radius, sheet corner radius
11pt  // Text field vertical padding
14pt  // Large rounded button radius, grouped table radius
50pt  // Pill button/tag border radius
```

### Layout Constants

```dart
const kMinimumSafeAreaPadding = EdgeInsets.all(8);
const kAnimationInDuration = Duration(milliseconds: 300);
const kImageFilterBlur = ImageFilter.blur(sigmaX: 20, sigmaY: 20);
const _kNavBarPersistentHeight = 44.0; // kMinInteractiveDimensionCupertino
```

---

## Typography Scale

### San Francisco Font Styles

Based on Apple's SF Pro Text/Display:

```dart
// Large Titles
largeTitle = 34pt

// Titles
title1 = 28pt
title2 = 22pt
title3 = 20pt

// Body
headline = 17pt (semibold)
body = 17pt
callout = 16pt
subheadline = 15pt
footnote = 13pt

// Small Text
caption1 = 12pt
caption2 = 11pt
```

### Font Weights

```dart
Regular    // Default body text
Semibold   // Headlines, buttons
Bold       // Titles, emphasis
```

### Usage in Design System

```dart
// Access typography through theme
final theme = IosTheme.of(context);

theme.typography.largeTitle
theme.typography.title1Regular
theme.typography.title2Bold
theme.typography.title3Bold
theme.typography.headlineRegular
theme.typography.bodyRegular
theme.typography.bodyBold
theme.typography.calloutRegular
theme.typography.subheadlineRegular
theme.typography.subheadlineBold
theme.typography.footnoteRegular
theme.typography.caption1Regular
theme.typography.caption2Regular
theme.typography.caption2Bold
```

---

## Color System

### System Colors

**Semantic Colors:**

```dart
theme.defaultColors.systemBlue     // #007AFF (light) / #0A84FF (dark)
theme.defaultColors.systemGreen    // #34C759 (light) / #30D158 (dark)
theme.defaultColors.systemIndigo   // #5856D6 (light) / #5E5CE6 (dark)
theme.defaultColors.systemOrange   // #FF9500 (light) / #FF9F0A (dark)
theme.defaultColors.systemPink     // #FF2D55 (light) / #FF375F (dark)
theme.defaultColors.systemPurple   // #AF52DE (light) / #BF5AF2 (dark)
theme.defaultColors.systemRed      // #FF3B30 (light) / #FF453A (dark)
theme.defaultColors.systemTeal     // #5AC8FA (light) / #64D2FF (dark)
theme.defaultColors.systemYellow   // #FFCC00 (light) / #FFD60A (dark)
```

**Gray Scale:**

```dart
theme.defaultColors.systemGray01   // Lightest gray
theme.defaultColors.systemGray02
theme.defaultColors.systemGray03
theme.defaultColors.systemGray04
theme.defaultColors.systemGray05
theme.defaultColors.systemGray06   // Darkest gray
```

**Monochrome:**

```dart
theme.defaultColors.systemWhite    // Pure white
theme.defaultColors.systemBlack    // Pure black
```

### Label Colors

Automatically adapt to light/dark mode:

```dart
theme.defaultLabelColors.primary      // Primary text
theme.defaultLabelColors.secondary    // Secondary text (60% opacity)
theme.defaultLabelColors.tertiary     // Tertiary text (30% opacity)
theme.defaultLabelColors.quaternary   // Quaternary text (18% opacity)
```

### Fill Colors

For backgrounds and filled elements:

```dart
theme.defaultFillColors.primary      // Filled elements
theme.defaultFillColors.secondary    // Secondary filled elements
theme.defaultFillColors.tertiary     // Tertiary filled elements
theme.defaultFillColors.quaternary   // Quaternary filled elements
```

### Background Colors

**System Backgrounds (Light):**

```dart
theme.defaultSystemBackgroundsColors.primaryLight
theme.defaultSystemBackgroundsColors.secondaryLight
theme.defaultSystemBackgroundsColors.tertiaryLight
```

**System Backgrounds (Dark):**

```dart
theme.defaultSystemBackgroundsColors.primaryDarkBase      // Base level
theme.defaultSystemBackgroundsColors.secondaryDarkBase    // Elevated
theme.defaultSystemBackgroundsColors.tertiaryDarkBase
theme.defaultSystemBackgroundsColors.primaryDarkElevated
theme.defaultSystemBackgroundsColors.secondaryDarkElevated
theme.defaultSystemBackgroundsColors.tertiaryDarkElevated
```

**Grouped Backgrounds:**

```dart
theme.defaultSystemGroupedBackgroundsColors.primaryLight
theme.defaultSystemGroupedBackgroundsColors.secondaryLight
theme.defaultSystemGroupedBackgroundsColors.tertiaryLight
theme.defaultSystemGroupedBackgroundsColors.primaryDarkBase
theme.defaultSystemGroupedBackgroundsColors.secondaryDarkBase
theme.defaultSystemGroupedBackgroundsColors.tertiaryDarkBase
```

### Separator Colors

```dart
theme.systemColoursSeparatorColors.opaque
theme.systemColoursSeparatorColors.nonOpaque
```

---

## Icon Guidelines

### Icon Sizes

```dart
// Small icons (in buttons, accessories)
14pt  // Tag close icon
18pt  // Small/Medium button icons
20pt  // Standard icon in IconWidget.background
26pt  // IconWidget.transparentBackground

// Large icons (standalone)
32pt  // Large player controls
40pt+ // Hero icons
```

### Icon Colors by Context

**Navigation:**
- Use `systemBlue` for interactive elements
- Use `primary` label color for titles

**Actions:**
- Destructive: `systemRed`
- Positive: `systemGreen`
- Warning: `systemOrange`
- Info: `systemBlue`

**Status:**
- Active: `systemGreen`
- Inactive: `systemGray03`
- Error: `systemRed`
- Warning: `systemYellow`

### Common Icon Background Colors

```dart
// By function
Messages: systemGreen
Mail: systemBlue
Phone: systemGreen
FaceTime: systemGreen
Calendar: systemRed
Photos: systemPink or multicolor gradient
Camera: systemGray
Maps: systemTeal
Settings: systemGray
Health: systemRed or systemPink
Wallet: systemBlue or systemIndigo
```

---

## Component Sizing

### Buttons

```dart
// Small
SmallButtonSize()
  minHeight: 28pt
  minWidth: 28pt
  borderRadius: 14pt
  padding: h:10pt, v:5pt
  iconSize: 18pt

// Medium
MediumButtonSize()
  minHeight: 34pt
  minWidth: 34pt
  borderRadius: 50pt (pill)
  padding: h:12pt, v:7pt
  iconSize: 18pt

// Large
LargeButtonSize()
  minHeight: 50pt
  minWidth: 50pt
  borderRadius: 12pt
  padding: h:20.5pt, v:15pt
  iconSize: 18pt
```

### Touch Targets

**Minimum:** 44pt x 44pt (iOS standard)

```dart
kMinInteractiveDimensionCupertino = 44.0
```

All interactive elements should meet this minimum:
- Navigation bar height: 44pt
- Row tap areas
- Button minimum sizes

### Text Fields

```dart
// Standard
padding: EdgeInsets.only(left: 16, top: 11, bottom: 11)
minHeight: ~44pt (with padding)

// Search field
padding: EdgeInsets.only(top: 7, bottom: 7)
borderRadius: 10pt
```

---

## Animation Guidelines

### Standard Durations

```dart
const kAnimationInDuration = Duration(milliseconds: 300);
const kAnimationOutDuration = Duration(milliseconds: 200);
```

### Curves

```dart
Curves.easeInOut        // Default for most animations
Curves.decelerate       // For appearing elements
Curves.linearToEaseOut  // For scroll-to-top
```

### Animated Elements

- Button press: Instant opacity change to 0.4
- Tag selection: 300ms with SizeTransition
- Sheet presentation: System-controlled spring animation
- Navigation transitions: System-controlled slide

---

## Blur Effects

### When to Use Blur

**Enabled (80% opacity + blur):**
- Navigation bars with scrolling content
- Toolbars with scrolling content
- Modal barriers for important sheets
- Tags in toolbar overlays

**Disabled (100% opacity, no blur):**
- Static navigation bars
- Static toolbars
- Simple modal sheets
- Standard tags

### Implementation

```dart
// Blur filter
ImageFilter? imageFilter = ImageFilter.blur(sigmaX: 20, sigmaY: 20);

// Background opacity
double backgroundOpacity = 0.8;

// Apply to container
ClipRect(
  child: BackdropFilter(
    filter: kImageFilterBlur,
    child: Container(
      color: backgroundColor.withValues(alpha: 0.8),
      child: child,
    ),
  ),
)
```

---

## Safe Areas

### Standard Safe Area Usage

```dart
SafeArea(
  top: true,              // Respect notch/status bar
  bottom: true,           // Respect home indicator
  maintainBottomViewPadding: true,
  minimum: kMinimumSafeAreaPadding,
  child: child,
)
```

### When to Extend Behind Safe Areas

**Navigation Bar:**
```dart
extendBodyBehindAppBar: imageFilter == NavigatorBarImageFilter.enabled
```

**Toolbar:**
```dart
extendBody: imageFilter == ToolBarImageFilter.enabled
```

**Full-Screen Content:**
- Videos
- Images
- Maps
- Games

---

## Dark Mode Considerations

### Automatic Adaptation

Design system automatically handles:
- Text color inversion
- Background elevation
- Separator opacity
- Fill color adjustments

### Color Selection

**Light Mode:**
- Brighter backgrounds
- Higher contrast
- Opaque separators option

**Dark Mode:**
- Darker backgrounds with elevation
- Reduced contrast (easier on eyes)
- Non-opaque separators preferred

### Testing

```dart
// Force light mode for testing
IosAnimatedTheme(
  data: IosLightThemeData(),
  child: child,
)

// Force dark mode for testing
IosAnimatedTheme(
  data: IosDarkThemeData(),
  child: child,
)

// System mode (automatic)
IosAnimatedTheme(
  data: IosDarkThemeData(), // or IosLightThemeData()
  child: CupertinoApp(
    theme: CupertinoThemeData(
      brightness: Brightness.dark, // or Brightness.light
    ),
    child: child,
  ),
)
```

---

## Accessibility

### Text Scaling

All text automatically respects user text size preferences:

```dart
final textScaler = MediaQuery.textScalerOf(context);

// Applied automatically in typography
Text(
  'Text',
  textScaler: textScaler,
)

// For custom elements
Icon(
  CupertinoIcons.star,
  size: textScaler.scale(20),
)
```

### Color Contrast

Maintain minimum contrast ratios:
- Normal text: 4.5:1
- Large text (18pt+): 3:1
- Interactive elements: 3:1

Label color system ensures proper contrast:
```dart
primary     // 100% opacity - highest contrast
secondary   // 60% opacity
tertiary    // 30% opacity
quaternary  // 18% opacity - minimum readable
```

### Touch Targets

All interactive elements meet 44pt minimum:
```dart
// Button sizes enforce this
SmallButtonSize() // 28pt × 28pt (use in larger containers)
MediumButtonSize() // 34pt × 34pt (close to minimum)
LargeButtonSize() // 50pt × 50pt (exceeds minimum) ✓

// Navigation bar height
const _kNavBarPersistentHeight = 44.0; // ✓

// Rows have minimum tap area
RowWidget // Automatically meets 44pt height ✓
```

---

## Layout Patterns

### Screen Edge Insets

```dart
// Standard
horizontal: 16pt
vertical: 16pt (top) / 24pt (between sections)

// Grouped tables
horizontal: 16pt (titles/descriptions)
horizontal: 0pt (table content - full width)

// Modal sheets
horizontal: 16pt
vertical: 4pt (top for resize indicator)
```

### Section Spacing

```dart
const SizedBox(height: 8)   // Between title and table
const SizedBox(height: 8)   // Between table and description
const SizedBox(height: 24)  // Between grouped sections
const SizedBox(height: 32)  // Between major sections
```

### Row Spacing

```dart
// Internal row spacing
leftPadding: 16pt
leftWidget spacing: 16pt
contentPadding: EdgeInsets.symmetric(vertical: 12)
rightWidget spacing: 16pt
rightPadding: 16pt

// Between elements in row
iconToText: 16pt
textToAccessory: 16pt
```

---

## Common Mistakes to Avoid

1. **Wrong spacing values** - Use standard 4pt, 8pt, 16pt, 24pt multiples
2. **Missing safe areas** - Always wrap content in SafeArea
3. **Hardcoded colors** - Always use theme colors
4. **Wrong font sizes** - Use typography scale
5. **Small touch targets** - Ensure 44pt minimum
6. **Inconsistent blur** - Use imageFilter consistently
7. **Wrong separator in last row** - Set displayDivider: false
8. **Not testing dark mode** - Always test both modes
9. **Ignoring text scaling** - Use textScaler for custom sizes
10. **Wrong button sizes** - Use appropriate ButtonSize class

---

## Quick Reference

### Most Common Values

```dart
// Padding
EdgeInsets.all(16)                    // Screen edges
EdgeInsets.symmetric(horizontal: 16)  // Side padding only
EdgeInsets.symmetric(vertical: 12)    // Row content

// Spacing
const SizedBox(height: 8)    // Small gaps
const SizedBox(height: 16)   // Standard gaps
const SizedBox(height: 24)   // Section gaps
const SizedBox(width: 4)     // Between tags
const SizedBox(width: 8)     // Between buttons

// Border Radius
BorderRadius.circular(7)     // Icon backgrounds
BorderRadius.circular(10)    // Search fields
BorderRadius.circular(12)    // Large buttons, cards
BorderRadius.circular(14)    // Grouped tables, small buttons
BorderRadius.circular(50)    // Pills, tags, medium buttons

// Colors
theme.defaultColors.systemBlue        // Primary actions
theme.defaultLabelColors.primary      // Primary text
theme.defaultLabelColors.secondary    // Secondary text
```
