---
description: "Neutral Music, App Store, Books, Stocks, and custom app-themed widgets"
alwaysApply: false
---

# Specialized Widgets Guide

Reference for app-specific widgets including Neutral Music, App Store, and custom themed components.

## Overview

Specialized widgets provide pre-built components for specific app styles. They include custom decorations, gradients, and styling that extends the base design system.

---

## Neutral Music Widgets

Custom widgets for music player interfaces with gradient backgrounds and glassmorphism effects.

### File Locations
- `/lib/src/widgets/neutral_music/neutral_card_widget.dart`
- `/lib/src/widgets/neutral_music/neutral_circular_button_widget.dart`
- `/lib/src/widgets/neutral_music/neutral_pill_button_widget.dart`
- `/lib/src/widgets/neutral_music/neutral_decorations_style.dart`

### NeutralCardWidget

Music-themed card with gradient background.

```dart
NeutralCardWidget({
  required Widget child,
  EdgeInsets? padding,
  Key? key,
})
```

### NeutralCircularButtonWidget

Circular button with glassmorphism effect for music controls.

```dart
NeutralCircularButtonWidget({
  required IconData iconData,
  required VoidCallback? onPressed,
  double? iconSize,
  Key? key,
})
```

### NeutralPillButtonWidget

Pill-shaped button with gradient styling for music actions.

```dart
NeutralPillButtonWidget({
  required String label,
  required VoidCallback? onPressed,
  IconData? leftIcon,
  IconData? rightIcon,
  Key? key,
})
```

### Example Usage

```dart
// Music player screen
Column(
  children: [
    NeutralCardWidget(
      child: Column(
        children: [
          // Album art
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              albumArtUrl,
              height: 300,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 24),
          // Song info
          Text(
            'Song Title',
            style: theme.typography.title2Bold,
          ),
          Text(
            'Artist Name',
            style: theme.typography.bodyRegular,
          ),
        ],
      ),
    ),
    const SizedBox(height: 32),
    // Playback controls
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        NeutralCircularButtonWidget(
          iconData: CupertinoIcons.backward_fill,
          onPressed: () {
            // Previous track
          },
        ),
        NeutralCircularButtonWidget(
          iconData: _isPlaying
            ? CupertinoIcons.pause_fill
            : CupertinoIcons.play_fill,
          iconSize: 32,
          onPressed: () {
            setState(() => _isPlaying = !_isPlaying);
          },
        ),
        NeutralCircularButtonWidget(
          iconData: CupertinoIcons.forward_fill,
          onPressed: () {
            // Next track
          },
        ),
      ],
    ),
    const SizedBox(height: 24),
    // Action buttons
    NeutralPillButtonWidget(
      label: 'Add to Playlist',
      leftIcon: CupertinoIcons.add,
      onPressed: () {
        // Add to playlist
      },
    ),
  ],
)
```

---

## App Store Widgets

Widgets styled for App Store-like interfaces.

### File Location
`/lib/src/widgets/app_store/`

### AppIconWidget

App icon with proper sizing and rounded corners.

### File Location
`/lib/src/widgets/app_icon_widget.dart`

```dart
AppIconWidget({
  required String imageUrl,
  double size = 60,
  double borderRadius = 12,
  Key? key,
})
```

### Example Usage

```dart
// App Store list item
RowWidget.standard(
  title: 'My App',
  description: 'A great application',
  leftWidget: AppIconWidget(
    imageUrl: 'https://example.com/icon.png',
    size: 60,
    borderRadius: 12,
  ),
  rightWidget: ButtonWidget.label(
    size: const SmallButtonSize(),
    color: const BlueButtonColor(),
    label: 'GET',
    onPressed: () {
      // Download app
    },
  ),
  displayDivider: true,
  onPressed: () {
    // View app details
  },
  onLongPress: null,
  decorationCallback: null,
)

// Featured app card
Container(
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: theme.defaultSystemBackgroundsColors.primaryDarkElevated,
    borderRadius: BorderRadius.circular(12),
  ),
  child: Row(
    children: [
      AppIconWidget(
        imageUrl: appIconUrl,
        size: 80,
        borderRadius: 16,
      ),
      const SizedBox(width: 16),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Featured App',
              style: theme.typography.caption1Regular.copyWith(
                color: theme.defaultLabelColors.secondary,
              ),
            ),
            Text(
              appName,
              style: theme.typography.title3Bold,
            ),
            Text(
              appDescription,
              style: theme.typography.bodyRegular,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    ],
  ),
)
```

---

## Custom Theme Variants

### Stocks Theme

Financial app styling with gradient backgrounds and custom colors.

**Available in:**
- `RowWidget.stocks()`
- `GroupedTableWidget.stocks()`
- `SwitchWidget.stocks()`
- `DividerWidget.stocks`

```dart
// Stocks-styled list
GroupedTableWidget.stocks(
  title: const TitleWidget(
    text: 'WATCHLIST',
    size: TitleSize.small,
  ),
  rows: [
    RowWidget.stocks(
      title: 'AAPL',
      description: 'Apple Inc.',
      leftWidget: null,
      rightWidget: Text(
        '+2.5%',
        style: theme.typography.bodyBold.copyWith(
          color: theme.stocksDecorations.defaultColors.positiveTrend,
        ),
      ),
      displayDivider: true,
      onPressed: () {},
      onLongPress: null,
      decorationCallback: stocksDecorationCallback,
    ),
    RowWidget.stocks(
      title: 'GOOGL',
      description: 'Alphabet Inc.',
      leftWidget: null,
      rightWidget: Text(
        '-1.2%',
        style: theme.typography.bodyBold.copyWith(
          color: theme.stocksDecorations.defaultColors.negativeTrend,
        ),
      ),
      displayDivider: false,
      onPressed: () {},
      onLongPress: null,
      decorationCallback: stocksDecorationCallback,
    ),
  ],
  description: null,
)
```

### Books Theme

Book reader styling with custom typography and colors.

```dart
// Available through theme
final theme = IosTheme.of(context);
final booksColors = theme.booksDecorations; // If using books theme
```

### Weather Theme

Weather app colors and gradients.

```dart
// Available through theme
final theme = IosTheme.of(context);
final weatherColors = theme.weatherDecorations; // If using weather theme
```

---

## ButtonWidget Advanced

Additional button features and custom styles.

### File Location
`/lib/src/widgets/button_widget.dart`

### Custom Button Colors

```dart
// Custom color button
ButtonWidget.label(
  size: const LargeButtonSize(),
  color: CustomButtonColor(
    backgroundEnabled: Colors.purple,
    backgroundDisabled: Colors.grey,
    labelEnabled: Colors.white,
    labelDisabled: Colors.grey.shade400,
  ),
  label: 'Custom Button',
  onPressed: () {},
)

// Gradient button
ButtonWidget.label(
  size: const LargeButtonSize(),
  color: CustomButtonColor(
    backgroundEnabled: null, // Use gradient instead
    backgroundDisabled: Colors.grey,
    labelEnabled: Colors.white,
    labelDisabled: Colors.grey.shade400,
    backgroundGradientEnabled: LinearGradient(
      colors: [Colors.purple, Colors.blue],
    ),
  ),
  label: 'Gradient Button',
  onPressed: () {},
)
```

### Custom Button Sizes

```dart
// Tiny button
ButtonWidget.label(
  size: const CustomButtonSize(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    iconSize: 14,
    boxConstraints: BoxConstraints(minHeight: 24, minWidth: 24),
  ),
  color: const BlueButtonColor(),
  label: 'Tiny',
  onPressed: () {},
)

// Extra large button
ButtonWidget.label(
  size: const CustomButtonSize(
    borderRadius: BorderRadius.all(Radius.circular(16)),
    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
    iconSize: 24,
    boxConstraints: BoxConstraints(minHeight: 60, minWidth: 60),
  ),
  color: const BlueButtonColor(),
  label: 'Extra Large',
  onPressed: () {},
)
```

### Loading Button

```dart
ButtonWidget.label(
  size: const LargeButtonSize(),
  color: const BlueButtonColor(),
  label: 'Submit',
  displayCupertinoActivityIndicator: _isLoading,
  onPressed: _isLoading ? null : () async {
    setState(() => _isLoading = true);
    await _performAction();
    setState(() => _isLoading = false);
  },
)
```

### Button with Custom Widgets

```dart
ButtonWidget.label(
  size: const MediumButtonSize(),
  color: const BlueButtonColor(),
  label: 'Badge Button',
  leftWidget: Container(
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Colors.red,
      shape: BoxShape.circle,
    ),
    child: Text(
      '3',
      style: theme.typography.caption2Bold.copyWith(
        color: Colors.white,
      ),
    ),
  ),
  onPressed: () {},
)
```

---

## CloseButtonWidget

Standard iOS close button (X in circle).

### File Location
`/lib/src/widgets/close_button_widget.dart`

```dart
CloseButtonWidget({
  required VoidCallback? onPressed,
  Key? key,
})
```

### Example Usage

```dart
// In sheet title
TitleSheetWidget.standard(
  title: 'Modal',
  leading: CloseButtonWidget(
    onPressed: () => Navigator.pop(context),
  ),
)

// Custom position
Positioned(
  top: 16,
  right: 16,
  child: CloseButtonWidget(
    onPressed: () => Navigator.pop(context),
  ),
)
```

---

## LabelButtonWidget

Text button with optional icons.

### File Location
`/lib/src/widgets/label_button_widget.dart`

```dart
LabelButtonWidget.label({
  required String label,
  required VoidCallback? onPressed,
  IconData? iconLeft,
  IconData? iconRight,
  EdgeInsets? padding,
  Key? key,
})
```

### Example Usage

```dart
// Navigation bar buttons
LabelButtonWidget.label(
  label: 'Cancel',
  onPressed: () => Navigator.pop(context),
)

LabelButtonWidget.label(
  label: 'Done',
  onPressed: () {
    // Save changes
  },
)

LabelButtonWidget.label(
  label: 'Back',
  iconLeft: CupertinoIcons.back,
  onPressed: () => Navigator.pop(context),
)

LabelButtonWidget.label(
  label: 'Next',
  iconRight: CupertinoIcons.forward,
  onPressed: () {
    // Go to next screen
  },
)
```

---

## CupertinoButtonWidget

Base button widget with press animation.

### File Location
`/lib/src/widgets/cupertino_button_widget.dart`

Low-level button used internally by other button widgets. Provides consistent iOS press feedback.

```dart
CupertinoButtonWidget({
  required Widget child,
  required VoidCallback? onPressed,
  VoidCallback? onLongPress,
  Color? color,
  Gradient? backgroundGradient,
  BorderRadius? borderRadius,
  EdgeInsets? padding,
  BoxConstraints? constraints,
  BoxBorder? border,
  BoxShape? shape,
  bool displayCupertinoActivityIndicator = false,
  CupertinoActivityIndicator? cupertinoActivityIndicator,
  Key? key,
})
```

---

## Common Specialized Patterns

### Music Player Interface

```dart
ScaffoldWidget(
  navigationBar: CupertinoNavigatorBarWidget(
    title: 'Now Playing',
    imageFilter: NavigatorBarImageFilter.enabled,
    leading: LabelButtonWidget.label(
      label: 'Library',
      iconLeft: CupertinoIcons.chevron_down,
      onPressed: () => Navigator.pop(context),
    ),
    trailing: LabelButtonWidget.label(
      label: 'More',
      iconRight: CupertinoIcons.ellipsis,
      onPressed: () {
        // Show more options
      },
    ),
  ),
  toolBar: null,
  child: Column(
    children: [
      Expanded(
        child: NeutralCardWidget(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Album art, song info, controls
            ],
          ),
        ),
      ),
    ],
  ),
)
```

### App Store Search Results

```dart
ListView.builder(
  itemCount: apps.length,
  itemBuilder: (context, index) {
    final app = apps[index];
    return RowWidget.standard(
      title: app.name,
      description: app.category,
      leftWidget: AppIconWidget(
        imageUrl: app.iconUrl,
        size: 60,
        borderRadius: 12,
      ),
      rightWidget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ButtonWidget.label(
            size: const SmallButtonSize(),
            color: const BlueButtonColor(),
            label: app.isInstalled ? 'OPEN' : 'GET',
            onPressed: () {},
          ),
          if (!app.isInstalled)
            Text(
              'In-App Purchases',
              style: theme.typography.caption2Regular.copyWith(
                color: theme.defaultLabelColors.tertiary,
              ),
            ),
        ],
      ),
      displayDivider: index < apps.length - 1,
      onPressed: () {
        // Navigate to app details
      },
      onLongPress: null,
      decorationCallback: null,
    );
  },
)
```

---

## Best Practices

1. **Use specialized widgets** only when you need their specific styling
2. **Start with standard widgets** and customize only when necessary
3. **Test custom themes** in both light and dark modes
4. **Keep gradient colors** consistent with iOS design guidelines
5. **Use AppIconWidget** for all app icon displays
6. **Provide loading states** for async button actions
7. **Test button press feedback** on actual devices
8. **Use CloseButtonWidget** for consistent dismiss UI
9. **Maintain accessibility** with proper contrast ratios
10. **Document custom color schemes** for team consistency

---

## Troubleshooting

### Gradient not showing
- Ensure backgroundGradientEnabled is set
- Verify backgroundEnabled is null (not transparent)
- Check gradient colors are not identical

### Custom button size issues
- Verify boxConstraints min values
- Check padding doesn't cause overflow
- Ensure parent container has enough space

### Music widgets not themed correctly
- Import neutral_music theme decorations
- Apply proper theme data to IosAnimatedTheme
- Check decoration callbacks are implemented

### App icons not loading
- Verify image URLs are valid
- Check network permissions
- Use cached_network_image for better loading

### Close button not visible
- Check z-index/positioning
- Verify color contrasts with background
- Ensure button is not clipped by parent
