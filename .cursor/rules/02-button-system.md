---
description: "CupertinoButtonWidget and ButtonWidget with all sizes, colors, and variants"
alwaysApply: false
---

# Button System - Complete Guide

## Overview

The button system has a 2-layer architecture:
1. **CupertinoButtonWidget** - Low-level base widget for all interactions
2. **ButtonWidget** - High-level themed button with variants

## Layer 1: CupertinoButtonWidget

Location: `/lib/src/widgets/cupertino_button_widget.dart` (359 lines)

### Purpose
Base widget for **all interactive elements** in the design system. Provides:
- Opacity animation on press (configurable, default 0.8)
- Support for tap, long press, double tap, drag gestures
- Loading state with CupertinoActivityIndicator
- Automatic focus management
- Smooth animations (180ms in, 120ms out)

### Full API

```dart
CupertinoButtonWidget({
  required Widget child,
  required VoidCallback? onPressed,

  // Optional callbacks
  VoidCallback? onLongPress,
  VoidCallback? onDoubleTap,
  void Function(DragUpdateDetails)? onHorizontalDragUpdate,
  void Function(DragUpdateDetails)? onVerticalDragUpdate,
  void Function(DragUpdateDetails)? onPanUpdate,
  void Function(DragStartDetails)? onPanStart,

  // Styling
  Color? color,                    // Background color
  Color? disabledColor,            // Disabled background
  Gradient? backgroundGradient,    // Gradient background
  EdgeInsetsGeometry padding = kCupertinoButtonPadding,
  BoxConstraints? constraints,
  BorderRadius borderRadius = kCupertinoButtonBorderRadius,
  AlignmentGeometry alignment = Alignment.center,
  BoxBorder? border,
  BoxShape shape = BoxShape.rectangle,

  // Animation
  double pressedOpacity = kCupertinoButtonPressedOpacity, // 0.8

  // Loading state
  bool displayCupertinoActivityIndicator = false,
  CupertinoActivityIndicator cupertinoActivityIndicator = const CupertinoActivityIndicator(),

  Key? key,
})
```

### Usage Examples

**Basic Button**:
```dart
CupertinoButtonWidget(
  onPressed: () {},
  color: theme.defaultColors.systemBlue,
  child: Text('Tap Me'),
)
```

**With Long Press**:
```dart
CupertinoButtonWidget(
  onPressed: () => print('Tap'),
  onLongPress: () => print('Long press'),
  color: theme.defaultColors.systemGreen,
  child: Icon(CupertinoIcons.add),
)
```

**Loading State**:
```dart
CupertinoButtonWidget(
  onPressed: isLoading ? null : () => submit(),
  displayCupertinoActivityIndicator: isLoading,
  cupertinoActivityIndicator: CupertinoActivityIndicator(radius: 10),
  color: theme.defaultColors.systemBlue,
  child: Text('Submit'),
)
```

**Gradient Background**:
```dart
CupertinoButtonWidget(
  onPressed: () {},
  backgroundGradient: LinearGradient(
    colors: [
      theme.defaultColors.systemPurple,
      theme.defaultColors.systemPink,
    ],
  ),
  child: Text('Premium'),
)
```

**Custom Press Opacity**:
```dart
CupertinoButtonWidget(
  onPressed: () {},
  pressedOpacity: 0.6, // More transparent when pressed
  color: theme.defaultColors.systemRed,
  child: Text('Delete'),
)
```

**Drag Gesture**:
```dart
CupertinoButtonWidget(
  onPressed: null, // No tap
  onHorizontalDragUpdate: (details) {
    // Handle horizontal drag
    setState(() {
      offset += details.delta.dx;
    });
  },
  color: theme.defaultColors.systemGray05,
  child: Text('Drag Me'),
)
```

### Implementation Details

**Animation Timing**:
- Press down: 180ms with `Curves.easeInOutCubicEmphasized`
- Release: 120ms with `Curves.easeOutCubic`
- Implemented using `AnimationController` and `FadeTransition`

**Focus Management**:
- Automatically unfocuses text fields on tap: `FocusManager.instance.primaryFocus?.unfocus()`
- Called in all gesture callbacks (tap, long press, double tap, drag)

**Enabled State**:
```dart
bool get enabled =>
  onPressed != null ||
  onLongPress != null ||
  onDoubleTap != null ||
  onHorizontalDragUpdate != null ||
  onVerticalDragUpdate != null ||
  onPanUpdate != null;
```

**Mouse Cursor** (Web):
- Shows pointer cursor when enabled and on web
- Uses `MouseRegion` with `SystemMouseCursors.click`

**Loading Behavior**:
- When `displayCupertinoActivityIndicator` is true:
  - Child is replaced with activity indicator
  - Uses `AnimatedSwitcher` with fade transition
  - Widget becomes non-interactive via `IgnorePointer`

## Layer 2: ButtonWidget

Location: `/lib/src/widgets/button_widget.dart` (455 lines)

### Purpose
High-level button with automatic theming, sizing, and icon support. Built on top of CupertinoButtonWidget.

### API

```dart
// Label button
ButtonWidget.label({
  required ButtonSize size,
  required ButtonColor color,
  required String label,

  // Icons
  IconData? leftIcon,
  IconData? rigthIcon,

  // Custom widgets
  Widget? leftWidget,
  Widget? rigthWidget,

  // Styling
  LabelFontWeight labelFontWeight = const RegularLabelFontWeight(),
  double spacing = 3,
  BoxBorder? border,
  BoxShape shape = BoxShape.rectangle,

  // Loading
  bool displayCupertinoActivityIndicator = false,
  CupertinoActivityIndicator? cupertinoActivityIndicator,

  // Action
  void Function()? onPressed,

  Key? key,
})

// Icon-only button
ButtonWidget.icon({
  required ButtonSize size,
  required ButtonColor color,
  required IconData leftIcon,

  double spacing = 3,
  BoxBorder? border,
  BoxShape shape = BoxShape.rectangle,
  bool displayCupertinoActivityIndicator = false,
  CupertinoActivityIndicator? cupertinoActivityIndicator,
  void Function()? onPressed,

  Key? key,
})
```

### Button Sizes (Sealed Class)

```dart
sealed class ButtonSize {
  const ButtonSize({
    required BorderRadius borderRadius,
    required EdgeInsets padding,
    required double iconSize,
    required BoxConstraints? boxConstraints,
  });

  double iconSize(String? label);     // 26pt for icon-only
  BorderRadius borderRadius(String? label); // 50pt radius for icon-only
  EdgeInsets padding(String? label);  // Adjusted for icon-only
}
```

**SmallButtonSize**:
```dart
const SmallButtonSize()
  : super(
      borderRadius: const BorderRadius.all(Radius.circular(14)),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      iconSize: 18,
      boxConstraints: const BoxConstraints(minHeight: 28, minWidth: 28),
    );
```
- **Use for**: Secondary actions, compact UIs
- **Min height**: 28pt
- **Border radius**: 14pt
- **Typography**: `subheadlineRegular/Bold` (15pt)

**MediumButtonSize**:
```dart
const MediumButtonSize()
  : super(
      borderRadius: const BorderRadius.all(Radius.circular(50)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      iconSize: 18,
      boxConstraints: const BoxConstraints(minHeight: 34, minWidth: 34),
    );
```
- **Use for**: Standard buttons, toolbars
- **Min height**: 34pt
- **Border radius**: 50pt (pill shape)
- **Typography**: `bodyRegular/Bold` (17pt)

**LargeButtonSize**:
```dart
const LargeButtonSize()
  : super(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 20.5, vertical: 15),
      iconSize: 18,
      boxConstraints: const BoxConstraints(minHeight: 50, minWidth: 50),
    );
```
- **Use for**: Primary actions, CTAs
- **Min height**: 50pt
- **Border radius**: 12pt
- **Typography**: `bodyRegular/Bold` (17pt)

**CustomButtonSize**:
```dart
const CustomButtonSize({
  required BorderRadius borderRadius,
  required EdgeInsets padding,
  required double iconSize,
  required BoxConstraints? boxConstraints,
})
```
- Define your own dimensions

### Button Colors (Sealed Class)

```dart
sealed class ButtonColor {
  const ButtonColor();

  Color? background({required BuildContext context, required bool enabled});
  Gradient? backgroundGradient({required BuildContext context, required bool enabled});
  Color label({required BuildContext context, required bool enabled});

  Color? backgroundEnabled({required BuildContext context});
  Color? backgroundDisabled({required BuildContext context});
  Gradient? backgroundGradientEnabled({required BuildContext context}) => null;
  Color labelEnabled({required BuildContext context});
  Color labelDisabled({required BuildContext context});
}
```

**BlueButtonColor** (Primary Action):
```dart
class BlueButtonColor extends ButtonColor {
  const BlueButtonColor();

  @override
  Color? backgroundEnabled({required BuildContext context}) {
    final theme = IosTheme.of(context);
    return theme.defaultColors.systemBlue;
  }

  @override
  Color labelEnabled({required BuildContext context}) {
    final theme = IosTheme.of(context);
    return switch (theme) {
      IosLightThemeData() => const DefaultLabelColorsDark().primary, // White
      IosDarkThemeData() => theme.defaultLabelColors.primary, // White
    };
  }
}
```
- **Background**: systemBlue (#007AFF → #0A84FF)
- **Label**: White in both modes
- **Use for**: Primary actions (Continue, Submit, Save)

**GreyTransparentButtonColor** (Secondary):
```dart
class GreyTransparentButtonColor extends ButtonColor {
  const GreyTransparentButtonColor();

  @override
  Color? backgroundEnabled({required BuildContext context}) {
    final theme = IosTheme.of(context);
    return theme.defaultFillColors.secondary;
  }

  @override
  Color labelEnabled({required BuildContext context}) {
    final theme = IosTheme.of(context);
    return theme.defaultColors.systemBlue;
  }
}
```
- **Background**: Fill secondary (grey, adapts to light/dark)
- **Label**: systemBlue
- **Use for**: Secondary actions, toolbar buttons

**BlueTransparentButtonColor** (Tertiary):
```dart
class BlueTransparentButtonColor extends ButtonColor {
  const BlueTransparentButtonColor();

  @override
  Color? backgroundEnabled({required BuildContext context}) {
    final theme = IosTheme.of(context);
    return theme.defaultColors.systemBlue.withValues(alpha: .15);
  }

  @override
  Color labelEnabled({required BuildContext context}) {
    final theme = IosTheme.of(context);
    return theme.defaultColors.systemBlue;
  }
}
```
- **Background**: Blue tint (15% opacity)
- **Label**: systemBlue
- **Use for**: Tertiary actions, suggestions

**CustomButtonColor**:
```dart
const CustomButtonColor({
  required Color? backgroundEnabled,
  required Color? backgroundDisabled,
  required Color labelEnabled,
  required Color? labelDisabled,
  Gradient? backgroundGradientEnabled,
})
```
- Define custom colors
- Optional gradient support

### Label Font Weights (Sealed Class)

```dart
sealed class LabelFontWeight {
  const LabelFontWeight();

  TextStyle textStyle({
    required BuildContext context,
    required ButtonSize buttonSize,
    required ButtonColor buttonColor,
    required bool enabled,
    double? height = 1.0,
    double? letterSpacing = 0,
  });
}
```

**RegularLabelFontWeight**:
- Small buttons: `subheadlineRegular` (15pt, 400 weight)
- Other buttons: `bodyRegular` (17pt, 400 weight)

**BoldLabelFontWeight**:
- Small buttons: `subheadlineBold` (15pt, 600 weight)
- Other buttons: `bodyBold` (17pt, 600 weight)

### Usage Examples

**Primary Action Button**:
```dart
ButtonWidget.label(
  size: const LargeButtonSize(),
  color: const BlueButtonColor(),
  label: 'Continue',
  onPressed: () => submit(),
)
```

**Secondary Button with Icon**:
```dart
ButtonWidget.label(
  size: const MediumButtonSize(),
  color: const GreyTransparentButtonColor(),
  label: 'Share',
  leftIcon: CupertinoIcons.share,
  onPressed: () => share(),
)
```

**Icon-Only Button**:
```dart
ButtonWidget.icon(
  size: const MediumButtonSize(),
  color: const GreyTransparentButtonColor(),
  leftIcon: CupertinoIcons.add,
  onPressed: () => add(),
)
```

**Bold Label**:
```dart
ButtonWidget.label(
  size: const LargeButtonSize(),
  color: const BlueButtonColor(),
  label: 'Buy Now',
  labelFontWeight: const BoldLabelFontWeight(),
  onPressed: () => purchase(),
)
```

**With Custom Widgets**:
```dart
ButtonWidget.label(
  size: const MediumButtonSize(),
  color: const BlueTransparentButtonColor(),
  label: 'Premium',
  leftWidget: Icon(CupertinoIcons.star_fill, color: Colors.yellow),
  onPressed: () => upgrade(),
)
```

**Loading State**:
```dart
ButtonWidget.label(
  size: const LargeButtonSize(),
  color: const BlueButtonColor(),
  label: 'Processing...',
  displayCupertinoActivityIndicator: isLoading,
  onPressed: isLoading ? null : () => process(),
)
```

## Creating Custom Button Variants

### Custom Button Color

```dart
class RedButtonColor extends ButtonColor {
  const RedButtonColor();

  @override
  Color? backgroundEnabled({required BuildContext context}) {
    final theme = IosTheme.of(context);
    return theme.defaultColors.systemRed;
  }

  @override
  Color labelEnabled({required BuildContext context}) {
    final theme = IosTheme.of(context);
    return theme.defaultColors.systemWhite;
  }
}

// Usage
ButtonWidget.label(
  size: const LargeButtonSize(),
  color: const RedButtonColor(),
  label: 'Delete',
  onPressed: () {},
)
```

### Custom Button Size

```dart
class ExtraLargeButtonSize extends ButtonSize {
  const ExtraLargeButtonSize()
    : super(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        iconSize: 22,
        boxConstraints: const BoxConstraints(minHeight: 56, minWidth: 56),
      );
}

// Usage
ButtonWidget.label(
  size: const ExtraLargeButtonSize(),
  color: const BlueButtonColor(),
  label: 'Get Started',
  onPressed: () {},
)
```

### Gradient Button

```dart
class GradientButtonColor extends ButtonColor {
  const GradientButtonColor();

  @override
  Color? backgroundEnabled({required BuildContext context}) => null;

  @override
  Gradient? backgroundGradientEnabled({required BuildContext context}) {
    final theme = IosTheme.of(context);
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        theme.defaultColors.systemPurple,
        theme.defaultColors.systemPink,
      ],
    );
  }

  @override
  Color labelEnabled({required BuildContext context}) {
    final theme = IosTheme.of(context);
    return theme.defaultColors.systemWhite;
  }
}
```

## Best Practices

### 1. Choose Appropriate Size
- **Small** - Compact UIs, secondary toolbar actions
- **Medium** - Standard buttons, most common
- **Large** - Primary CTAs, bottom of forms

### 2. Choose Appropriate Color
- **Blue** - Primary actions (continue, save, submit)
- **GreyTransparent** - Secondary actions (cancel, back)
- **BlueTransparent** - Tertiary actions (learn more, info)
- **Red** - Destructive actions (delete, remove)

### 3. Icon Usage
- Left icon for actions (add, share, edit)
- Right icon for navigation (chevron, arrow)
- Icon-only for toolbars, compact UIs

### 4. Loading States
- Disable button when loading: `onPressed: isLoading ? null : () {}`
- Show activity indicator: `displayCupertinoActivityIndicator: isLoading`
- Keep label or change to "Loading..."

### 5. Disabled States
- Set `onPressed: null`
- Automatically shows `backgroundDisabled` and `labelDisabled` colors
- Uses `defaultFillColors.secondary` and `defaultLabelColors.tertiary` by default

## Apple HIG Alignment

- **Minimum target size**: 44×44pt (system-wide)
- **Button spacing**: 8-12pt between buttons
- **Border radius**: Varies by size (6-50pt)
- **Press feedback**: 0.8 opacity (standard)
- **Animation timing**: 180ms in, 120ms out

## Testing Checklist

- [ ] Works in both light and dark modes
- [ ] Correct size and spacing
- [ ] Icon scales properly
- [ ] Loading state works
- [ ] Disabled state shows correctly
- [ ] Press animation smooth
- [ ] Text doesn't overflow
- [ ] Accessible (minimum 44pt target)
