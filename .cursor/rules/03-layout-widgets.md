---
description: "ScaffoldWidget, GroupedTableWidget, RowWidget, NavigationBar, and ToolBar usage"
alwaysApply: false
---

# Layout Widgets Guide

Complete reference for layout and structural widgets in the iOS Design System.

## Overview

Layout widgets provide the structural foundation for iOS-style screens. They handle navigation bars, toolbars, grouped content, and rows with proper iOS spacing and styling.

## ScaffoldWidget

Primary layout container that combines navigation bars, content, and toolbars.

### File Location
`/lib/src/widgets/scaffold_widget.dart`

### Purpose
- Provides complete screen structure with proper iOS background colors
- Manages navigation bar and toolbar positioning
- Handles keyboard dismissal on tap
- Automatically applies system UI overlay styles

### Constructor

```dart
ScaffoldWidget({
  required CupertinoNavigatorBarWidget? navigationBar,
  required ToolBarWidget? toolBar,
  required Widget child,
  Key? key,
})
```

### Background Colors

**Light Theme:**
- Uses `defaultSystemGroupedBackgroundsColors.primaryLight`

**Dark Theme:**
- Uses `defaultSystemBackgroundsColors.primaryDarkBase`

### Properties

| Property | Type | Description |
|----------|------|-------------|
| `navigationBar` | `CupertinoNavigatorBarWidget?` | Top navigation bar (null for no bar) |
| `toolBar` | `ToolBarWidget?` | Bottom toolbar (null for no toolbar) |
| `child` | `Widget` | Main content area |
| `extendBodyBehindAppBar` | Auto | True when navigation bar has blur enabled |
| `extendBody` | Auto | True when toolbar has blur enabled |

### Example Usage

```dart
// Basic scaffold with navigation and toolbar
ScaffoldWidget(
  navigationBar: CupertinoNavigatorBarWidget(
    title: 'Settings',
    imageFilter: NavigatorBarImageFilter.enabled,
    leading: null,
    trailing: LabelButtonWidget.label(
      label: 'Done',
      onPressed: () => Navigator.pop(context),
    ),
  ),
  toolBar: ToolBarWidget(
    imageFilter: ToolBarImageFilter.enabled,
    child: ButtonWidget.label(
      size: const LargeButtonSize(),
      color: const BlueButtonColor(),
      onPressed: () {},
      label: 'Continue',
    ),
  ),
  child: SingleChildScrollView(
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Your content here
          ],
        ),
      ),
    ),
  ),
)

// Scaffold without toolbar
ScaffoldWidget(
  navigationBar: CupertinoNavigatorBarWidget(
    title: 'Details',
    imageFilter: NavigatorBarImageFilter.disabled,
    leading: null,
    trailing: null,
  ),
  toolBar: null,
  child: ListView(
    children: [
      // List items
    ],
  ),
)
```

---

## CupertinoNavigatorBarWidget

iOS-style navigation bar with blur effects and proper spacing.

### File Location
`/lib/src/widgets/cupertino_navigation_bar_widget.dart`

### Key Features
- Automatic back button when route can pop
- Blur effects with `NavigatorBarImageFilter.enabled`
- Tap to scroll to top functionality
- Proper iOS sizing (44pt height)
- Text scaling support

### Constructor

```dart
CupertinoNavigatorBarWidget({
  required NavigatorBarImageFilter imageFilter,
  required String? title,
  required LabelButtonWidget? trailing,
  required LabelButtonWidget? leading,
  Widget backButtonWidget = _kCupertinoNavigationBackButtonWidget,
  Key? key,
})
```

### Properties

| Property | Type | Description |
|----------|------|-------------|
| `title` | `String?` | Center title text (null for no title) |
| `leading` | `LabelButtonWidget?` | Left button (overrides back button) |
| `trailing` | `LabelButtonWidget?` | Right button |
| `imageFilter` | `NavigatorBarImageFilter` | Enable/disable blur effect |
| `backButtonWidget` | `Widget` | Custom back button (default provided) |

### Image Filter Options

```dart
enum NavigatorBarImageFilter {
  enabled,   // Blur effect with 80% opacity background
  disabled;  // Solid background, 100% opacity
}
```

### Background Colors

**Light Theme:**
- `defaultSystemBackgroundsColors.primaryLight`

**Dark Theme:**
- `defaultSystemBackgroundsColors.primaryDarkElevated`

### Example Usage

```dart
// Standard navigation bar with blur
CupertinoNavigatorBarWidget(
  title: 'Profile',
  imageFilter: NavigatorBarImageFilter.enabled,
  leading: null,  // Shows auto back button if route can pop
  trailing: LabelButtonWidget.label(
    label: 'Edit',
    onPressed: () {},
  ),
)

// Navigation bar with custom leading button
CupertinoNavigatorBarWidget(
  title: 'Messages',
  imageFilter: NavigatorBarImageFilter.disabled,
  leading: LabelButtonWidget.label(
    label: 'Cancel',
    iconLeft: CupertinoIcons.xmark,
    onPressed: () => Navigator.pop(context),
  ),
  trailing: LabelButtonWidget.label(
    label: 'Send',
    onPressed: () {},
  ),
)

// Navigation bar without title
CupertinoNavigatorBarWidget(
  title: null,
  imageFilter: NavigatorBarImageFilter.enabled,
  leading: LabelButtonWidget.label(
    label: 'Back',
    iconLeft: CupertinoIcons.back,
    onPressed: () => Navigator.pop(context),
  ),
  trailing: null,
)

// Navigation for push navigation
CupertinoNavigatorBarWidget(
  title: 'Details',
  imageFilter: NavigatorBarImageFilter.enabled,
  leading: null,
  trailing: LabelButtonWidget.label(
    label: 'Next',
    iconRight: CupertinoIcons.forward,
    onPressed: () => Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => NextScreen(),
      ),
    ),
  ),
)
```

### Tap to Scroll Behavior

The navigation bar automatically scrolls the primary scroll controller to the top when tapped:

```dart
// This happens automatically when you tap the nav bar
primaryScrollController?.animateTo(
  0,
  duration: const Duration(milliseconds: 500),
  curve: Curves.linearToEaseOut,
);
```

---

## ToolBarWidget

Bottom toolbar with optional blur effects, typically used for actions.

### File Location
`/lib/src/widgets/tool_bar_widget.dart`

### Constructor

```dart
ToolBarWidget({
  required Widget child,
  EdgeInsets padding = const EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 5,
  ),
  ToolBarImageFilter imageFilter = ToolBarImageFilter.disabled,
  Key? key,
})
```

### Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `child` | `Widget` | Required | Content inside toolbar |
| `padding` | `EdgeInsets` | `h:16, v:5` | Internal padding |
| `imageFilter` | `ToolBarImageFilter` | `disabled` | Blur effect toggle |

### Image Filter Options

```dart
enum ToolBarImageFilter {
  enabled,   // Blur effect with 80% opacity
  disabled;  // Solid background, 100% opacity
}
```

### Example Usage

```dart
// Toolbar with single button
ToolBarWidget(
  imageFilter: ToolBarImageFilter.enabled,
  child: ButtonWidget.label(
    size: const LargeButtonSize(),
    color: const BlueButtonColor(),
    onPressed: () {},
    label: 'Continue',
  ),
)

// Toolbar with multiple buttons
ToolBarWidget(
  imageFilter: ToolBarImageFilter.disabled,
  child: Row(
    children: [
      Expanded(
        child: ButtonWidget.label(
          size: const LargeButtonSize(),
          color: const GreyTransparentButtonColor(),
          onPressed: () {},
          label: 'Cancel',
        ),
      ),
      const SizedBox(width: 8),
      Expanded(
        child: ButtonWidget.label(
          size: const LargeButtonSize(),
          color: const BlueButtonColor(),
          onPressed: () {},
          label: 'Save',
        ),
      ),
    ],
  ),
)

// Toolbar with tags
ToolBarWidget(
  imageFilter: ToolBarImageFilter.enabled,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      ButtonWidget.label(
        size: const LargeButtonSize(),
        color: const BlueButtonColor(),
        onPressed: () {},
        label: 'Apply Filters',
      ),
      const SizedBox(height: 8),
      Row(
        children: [
          TagWidget(
            label: 'sports',
            selected: true,
            onPressed: () {},
            imageFilter: TagImageFilter.enabled,
          ),
          const SizedBox(width: 4),
          TagWidget(
            label: 'news',
            selected: false,
            onPressed: () {},
            imageFilter: TagImageFilter.enabled,
          ),
        ],
      ),
    ],
  ),
)
```

---

## GroupedTableWidget

iOS Settings-style grouped table container with title and description.

### File Location
`/lib/src/widgets/grouped_table_widget.dart`

### Variants

1. **Default** - Full width with dividers
2. **Rounded** - 14pt border radius
3. **Stocks** - Custom decoration for stock-style apps

### Constructors

```dart
// Default constructor
GroupedTableWidget({
  required List<Widget> rows,
  required Widget? title,
  required Widget? description,
  double rowsSpacing = 0,
  BoxDecoration Function(IosThemeData theme)? decorationCallback,
  BorderRadiusGeometry? borderRadius,
  Key? key,
})

// Rounded variant
GroupedTableWidget.rounded({
  required List<Widget> rows,
  required Widget? title,
  required Widget? description,
  BoxDecoration Function(IosThemeData)? decorationCallback,
  double rowsSpacing = 0,
})

// Stocks variant
GroupedTableWidget.stocks({
  required List<Widget> rows,
  required Widget? title,
  required Widget? description,
  BoxDecoration Function(IosThemeData)? decorationCallback,
  double rowsSpacing = 0,
})
```

### Properties

| Property | Type | Description |
|----------|------|-------------|
| `rows` | `List<Widget>` | List of row widgets (typically RowWidget) |
| `title` | `Widget?` | Header widget (typically TitleWidget) |
| `description` | `Widget?` | Footer widget (typically DescriptionWidget) |
| `rowsSpacing` | `double` | Vertical spacing between rows |
| `decorationCallback` | `Function?` | Custom background decoration |
| `borderRadius` | `BorderRadiusGeometry?` | Corner radius |

### Decoration Callbacks

```dart
// Default decoration
BoxDecoration defaultDecorationCallback(IosThemeData theme) => BoxDecoration(
  color: switch (theme) {
    IosLightThemeData() => theme.defaultSystemBackgroundsColors.primaryLight,
    IosDarkThemeData() => theme.defaultSystemBackgroundsColors.primaryDarkElevated,
  },
);

// Stocks decoration (with gradient in dark mode)
BoxDecoration stocksDecorationCallback(IosThemeData theme) => switch (theme) {
  IosLightThemeData() => BoxDecoration(
    color: theme.defaultSystemBackgroundsColors.primaryLight,
  ),
  IosDarkThemeData() => theme.stocksDecorations.gradients.background,
};
```

### Example Usage

```dart
// Basic grouped table
GroupedTableWidget(
  title: const TitleWidget(
    text: 'ACCOUNT',
    size: TitleSize.small,
  ),
  rows: [
    RowWidget.standard(
      onPressed: () {},
      displayDivider: true,
      title: 'Username',
      description: 'john.doe@example.com',
      leftWidget: IconWidget.background(
        iconData: CupertinoIcons.person,
      ),
      rightWidget: const Icon(CupertinoIcons.chevron_right),
      onLongPress: null,
      decorationCallback: null,
    ),
    RowWidget.standard(
      onPressed: () {},
      displayDivider: false,
      title: 'Password',
      description: 'Last changed 30 days ago',
      leftWidget: IconWidget.background(
        iconData: CupertinoIcons.lock,
      ),
      rightWidget: const Icon(CupertinoIcons.chevron_right),
      onLongPress: null,
      decorationCallback: null,
    ),
  ],
  description: const DescriptionWidget(
    text: 'Your account information is encrypted.',
  ),
)

// Rounded grouped table with text field
GroupedTableWidget.rounded(
  title: const TitleWidget(
    text: 'NAME',
    size: TitleSize.small,
  ),
  rows: [
    const CupertinoTextFieldWidget(
      placeholder: 'First Name',
    ),
    const DividerWidget(),
    const CupertinoTextFieldWidget(
      placeholder: 'Last Name',
    ),
  ],
  description: null,
)

// Table with switches
GroupedTableWidget.rounded(
  title: const TitleWidget(
    text: 'PREFERENCES',
    size: TitleSize.small,
  ),
  rows: [
    RowWidget.standard(
      onPressed: null,
      displayDivider: true,
      title: 'Notifications',
      description: null,
      leftWidget: null,
      rightWidget: SwitchWidget(
        value: true,
        onChanged: (value) {},
      ),
      onLongPress: null,
      decorationCallback: null,
    ),
    RowWidget.standard(
      onPressed: null,
      displayDivider: false,
      title: 'Dark Mode',
      description: null,
      leftWidget: null,
      rightWidget: SwitchWidget(
        value: false,
        onChanged: (value) {},
      ),
      onLongPress: null,
      decorationCallback: null,
    ),
  ],
  description: const DescriptionWidget(
    text: 'Changes take effect immediately.',
  ),
)

// Table with picker buttons
GroupedTableWidget.rounded(
  title: const TitleWidget(
    text: 'DETAILS',
    size: TitleSize.small,
  ),
  rows: [
    RowWidget.standard(
      onPressed: null,
      displayDivider: true,
      title: 'Birthday',
      description: null,
      leftWidget: IconWidget.background(
        iconData: CupertinoIcons.calendar,
      ),
      rightWidget: PickerButtonWidget.dateTime(
        dateTime: DateTime(2020, 6, 20),
        dateFormat: DateFormat.yMMMMd('en_US'),
        onPressed: () {},
      ),
      onLongPress: null,
      decorationCallback: null,
    ),
    RowWidget.standard(
      onPressed: null,
      displayDivider: false,
      title: 'Reminder',
      description: null,
      leftWidget: IconWidget.background(
        iconData: CupertinoIcons.bell,
      ),
      rightWidget: PickerButtonWidget.dateTime(
        dateTime: DateTime(2020, 6, 20, 13, 30),
        dateFormat: DateFormat.jm(),
        onPressed: () {},
      ),
      onLongPress: null,
      decorationCallback: null,
    ),
  ],
  description: null,
)
```

---

## RowWidget

Individual row component for grouped tables with iOS styling.

### File Location
`/lib/src/widgets/row_widget.dart`

### Constructors

```dart
// Standard row
RowWidget.standard({
  required String title,
  required String? description,
  required Widget? leftWidget,
  required Widget? rightWidget,
  required bool displayDivider,
  required VoidCallback? onPressed,
  required VoidCallback? onLongPress,
  required BoxDecoration Function(IosThemeData)? decorationCallback,
  EdgeInsets? contentPadding,
})

// Stocks variant (different text colors in dark mode)
RowWidget.stocks({
  required String title,
  required String? description,
  required Widget? leftWidget,
  required Widget? rightWidget,
  required bool displayDivider,
  required VoidCallback? onPressed,
  required VoidCallback? onLongPress,
  required BoxDecoration Function(IosThemeData)? decorationCallback,
  EdgeInsets? contentPadding,
})
```

### Properties

| Property | Type | Description |
|----------|------|-------------|
| `title` | `String` | Main text |
| `description` | `String?` | Secondary text below title |
| `leftWidget` | `Widget?` | Widget on the left (e.g., IconWidget) |
| `rightWidget` | `Widget?` | Widget on the right (e.g., chevron, switch) |
| `displayDivider` | `bool` | Show bottom divider |
| `onPressed` | `VoidCallback?` | Tap handler (null = non-interactive) |
| `onLongPress` | `VoidCallback?` | Long press handler |
| `decorationCallback` | `Function?` | Custom background |
| `contentPadding` | `EdgeInsets?` | Override default padding |

### Layout Rules

1. **Left Widget:** 16pt left padding, 16pt spacing after widget
2. **Content:** Expands to fill available space
3. **Right Widget:** 16pt spacing before widget, 16pt right padding
4. **Vertical Padding:** Default 12pt top/bottom

### Typography

**Title:**
- Style: `typography.bodyRegular`
- Color: `defaultLabelColors.primary`

**Description:**
- Style: `typography.caption1Regular`
- Color: `defaultLabelColors.secondary`

### Example Usage

```dart
// Simple clickable row
RowWidget.standard(
  title: 'Privacy',
  description: null,
  leftWidget: IconWidget.background(
    iconData: CupertinoIcons.lock_shield,
  ),
  rightWidget: const Icon(
    CupertinoIcons.chevron_right,
    color: Colors.grey,
  ),
  displayDivider: true,
  onPressed: () {},
  onLongPress: null,
  decorationCallback: null,
)

// Row with description
RowWidget.standard(
  title: 'Automatic Updates',
  description: 'Download new versions automatically when available',
  leftWidget: null,
  rightWidget: SwitchWidget(
    value: true,
    onChanged: (value) {},
  ),
  displayDivider: false,
  onPressed: null,
  onLongPress: null,
  decorationCallback: null,
)

// Interactive row with long press
RowWidget.standard(
  title: 'John Doe',
  description: 'john.doe@example.com',
  leftWidget: IconWidget.background(
    iconData: CupertinoIcons.person_circle,
    backgroundColorCallback: (theme) => theme.defaultColors.systemGreen,
  ),
  rightWidget: null,
  displayDivider: true,
  onPressed: () {
    // Handle tap
  },
  onLongPress: () {
    // Show context menu
  },
  decorationCallback: null,
)

// Row with custom padding
RowWidget.standard(
  title: 'Special Row',
  description: null,
  leftWidget: null,
  rightWidget: const Text('Value'),
  displayDivider: false,
  onPressed: null,
  onLongPress: null,
  decorationCallback: null,
  contentPadding: const EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 16,
  ),
)
```

---

## Common Patterns

### Settings Screen Pattern

```dart
ScaffoldWidget(
  navigationBar: CupertinoNavigatorBarWidget(
    title: 'Settings',
    imageFilter: NavigatorBarImageFilter.enabled,
    leading: null,
    trailing: null,
  ),
  toolBar: null,
  child: CupertinoScrollbar(
    child: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            GroupedTableWidget.rounded(
              title: const TitleWidget(
                text: 'ACCOUNT',
                size: TitleSize.small,
              ),
              rows: [/* rows */],
              description: null,
            ),
            const SizedBox(height: 24),
            GroupedTableWidget.rounded(
              title: const TitleWidget(
                text: 'PREFERENCES',
                size: TitleSize.small,
              ),
              rows: [/* rows */],
              description: null,
            ),
          ],
        ),
      ),
    ),
  ),
)
```

### Form Screen Pattern

```dart
ScaffoldWidget(
  navigationBar: CupertinoNavigatorBarWidget(
    title: 'New Contact',
    imageFilter: NavigatorBarImageFilter.enabled,
    leading: LabelButtonWidget.label(
      label: 'Cancel',
      onPressed: () => Navigator.pop(context),
    ),
    trailing: LabelButtonWidget.label(
      label: 'Save',
      onPressed: () {
        // Save logic
      },
    ),
  ),
  toolBar: null,
  child: SingleChildScrollView(
    child: SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 24),
          GroupedTableWidget.rounded(
            title: const TitleWidget(
              text: 'NAME',
              size: TitleSize.small,
            ),
            rows: [
              const CupertinoTextFieldWidget(
                placeholder: 'First Name',
              ),
            ],
            description: null,
          ),
        ],
      ),
    ),
  ),
)
```

---

## Best Practices

1. **Always use SafeArea** for content that should respect device notches
2. **Use const** for widgets where possible to improve performance
3. **Set displayDivider: false** on the last row in a group
4. **Use TitleSize.small** for grouped table titles
5. **Add spacing** between grouped tables (typically 24pt)
6. **Enable blur** on navigation bars for scrolling content
7. **Use null** for onPressed to make rows non-interactive
8. **Wrap content in SingleChildScrollView** when it might overflow

---

## Troubleshooting

### Navigation bar title not visible
- Check if title string is null
- Verify theme is properly applied with IosAnimatedTheme

### Toolbar not showing
- Ensure toolBar property is not null
- Check if SafeArea is cutting off the toolbar

### Rows not clickable
- Verify onPressed is not null
- Check if parent widget is intercepting touches

### Blur effect not working
- Set imageFilter to .enabled
- Ensure extendBody/extendBodyBehindAppBar are properly configured in ScaffoldWidget

### Divider showing on last row
- Set displayDivider: false on the last row in the group
