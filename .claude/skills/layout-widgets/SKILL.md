---
name: layout-widgets
description: ScaffoldWidget, GroupedTableWidget, RowWidget, NavigationBar, and ToolBar for iOS Design System
---

## Layout Widgets Reference

Core structural widgets for building iOS-style screens with proper spacing and navigation.

## ScaffoldWidget

Main screen container with navigation bar and toolbar.

```dart
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
      label: 'Continue',
      onPressed: () {},
    ),
  ),
  child: SingleChildScrollView(
    child: SafeArea(
      child: Column(
        children: [
          // Content
        ],
      ),
    ),
  ),
)
```

**Background Colors:**
- Light: `defaultSystemGroupedBackgroundsColors.primaryLight`
- Dark: `defaultSystemBackgroundsColors.primaryDarkBase`

## CupertinoNavigatorBarWidget

iOS navigation bar with blur effects and auto back button.

```dart
CupertinoNavigatorBarWidget(
  title: 'Profile',
  imageFilter: NavigatorBarImageFilter.enabled, // or .disabled
  leading: LabelButtonWidget.label(
    label: 'Cancel',
    onPressed: () => Navigator.pop(context),
  ),
  trailing: LabelButtonWidget.label(
    label: 'Save',
    onPressed: () {},
  ),
)
```

**Features:**
- Auto back button when route can pop
- Tap title to scroll to top
- 44pt height (Apple HIG standard)
- Blur with 80% opacity when enabled

## ToolBarWidget

Bottom toolbar for actions and buttons.

```dart
ToolBarWidget(
  imageFilter: ToolBarImageFilter.enabled,
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
  child: ButtonWidget.label(
    size: const LargeButtonSize(),
    color: const BlueButtonColor(),
    label: 'Continue',
    onPressed: () {},
  ),
)

// Multiple buttons
ToolBarWidget(
  child: Row(
    children: [
      Expanded(
        child: ButtonWidget.label(
          size: const LargeButtonSize(),
          color: const GreyTransparentButtonColor(),
          label: 'Cancel',
          onPressed: () {},
        ),
      ),
      const SizedBox(width: 8),
      Expanded(
        child: ButtonWidget.label(
          size: const LargeButtonSize(),
          color: const BlueButtonColor(),
          label: 'Save',
          onPressed: () {},
        ),
      ),
    ],
  ),
)
```

## GroupedTableWidget

Settings-style grouped list container.

```dart
// Standard variant (full width)
GroupedTableWidget(
  title: const TitleWidget(
    text: 'ACCOUNT',
    size: TitleSize.small,
  ),
  rows: [
    RowWidget.standard(
      title: 'Username',
      description: 'john.doe@example.com',
      leftWidget: IconWidget.background(
        iconData: CupertinoIcons.person,
      ),
      rightWidget: const Icon(CupertinoIcons.chevron_right),
      displayDivider: true,
      onPressed: () {},
      onLongPress: null,
      decorationCallback: null,
    ),
  ],
  description: const DescriptionWidget(
    text: 'Your account information is encrypted.',
  ),
)

// Rounded variant (14pt radius)
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

// Stocks variant (gradient in dark mode)
GroupedTableWidget.stocks(
  title: const TitleWidget(
    text: 'WATCHLIST',
    size: TitleSize.small,
  ),
  rows: [/* rows */],
  description: null,
)
```

## RowWidget

Individual row for grouped tables.

```dart
RowWidget.standard(
  title: 'Privacy',
  description: 'Manage your privacy settings',
  leftWidget: IconWidget.background(
    iconData: CupertinoIcons.lock_shield,
    backgroundColorCallback: (theme) => theme.defaultColors.systemGreen,
  ),
  rightWidget: const Icon(CupertinoIcons.chevron_right),
  displayDivider: true,
  onPressed: () {
    // Navigate to privacy settings
  },
  onLongPress: () {
    // Show context menu
  },
  decorationCallback: null,
)

// With switch
RowWidget.standard(
  title: 'Notifications',
  description: null,
  leftWidget: null,
  rightWidget: SwitchWidget(
    value: true,
    onChanged: (value) {},
  ),
  displayDivider: false,
  onPressed: null, // Non-interactive
  onLongPress: null,
  decorationCallback: null,
)

// Stocks variant
RowWidget.stocks(
  title: 'AAPL',
  description: 'Apple Inc.',
  leftWidget: null,
  rightWidget: Text('+2.5%'),
  displayDivider: true,
  onPressed: () {},
  onLongPress: null,
  decorationCallback: stocksDecorationCallback,
)
```

**Layout:**
- Left padding: 16pt
- Left widget spacing: 16pt
- Content: Expands to fill
- Right widget spacing: 16pt
- Right padding: 16pt
- Vertical padding: 12pt

## Common Patterns

### Settings Screen
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

### Form Screen
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

### List Screen
```dart
ScaffoldWidget(
  navigationBar: CupertinoNavigatorBarWidget(
    title: 'List',
    imageFilter: NavigatorBarImageFilter.enabled,
    leading: null,
    trailing: LabelButtonWidget.label(
      label: 'Add',
      iconRight: CupertinoIcons.add,
      onPressed: () {},
    ),
  ),
  toolBar: null,
  child: CupertinoScrollbar(
    child: ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return RowWidget.standard(
          title: items[index].title,
          description: items[index].subtitle,
          leftWidget: IconWidget.background(
            iconData: CupertinoIcons.doc,
          ),
          rightWidget: const Icon(CupertinoIcons.chevron_right),
          displayDivider: index < items.length - 1,
          onPressed: () {},
          onLongPress: null,
          decorationCallback: null,
        );
      },
    ),
  ),
)
```

## Best Practices

1. **Always use SafeArea** for content respecting device notches
2. **Set displayDivider: false** on last row in group
3. **Use TitleSize.small** for grouped table headers
4. **Add 24pt spacing** between grouped tables
5. **Enable blur on nav bars** for scrolling content
6. **Use null for onPressed** to make rows non-interactive
7. **Wrap content in SingleChildScrollView** when it might overflow
8. **Test with both blur enabled/disabled**

## Spacing Guide

```dart
const SizedBox(height: 8)   // Between title and table
const SizedBox(height: 8)   // Between table and description
const SizedBox(height: 24)  // Between grouped sections
const SizedBox(height: 32)  // Between major sections
```

## File Locations

- ScaffoldWidget: `/lib/src/widgets/scaffold_widget.dart`
- CupertinoNavigatorBarWidget: `/lib/src/widgets/cupertino_navigation_bar_widget.dart`
- ToolBarWidget: `/lib/src/widgets/tool_bar_widget.dart`
- GroupedTableWidget: `/lib/src/widgets/grouped_table_widget.dart`
- RowWidget: `/lib/src/widgets/row_widget.dart`
