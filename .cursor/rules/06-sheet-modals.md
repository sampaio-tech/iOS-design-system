---
description: "Bottom sheets, modals, action sheets, and title sheets with search capabilities"
alwaysApply: false
---

# Sheet & Modal Widgets Guide

Complete reference for modal sheets, action sheets, and popup presentations in the iOS Design System.

## Overview

Sheet widgets provide iOS-style bottom sheets and modal presentations with blur effects, drag handles, search capabilities, and custom styling. All sheets support nested navigation and proper keyboard handling.

---

## CupertinoSheetWidget

Versatile bottom sheet with multiple presentation styles.

### File Location
`/lib/src/widgets/cupertino_sheet_widget.dart`

### Key Features
- Draggable sheet with swipe-to-dismiss
- Nested navigation support
- Multiple styled variants (Standard, Apple Pay)
- Custom background colors
- Blur barrier options

### Static Methods

```dart
// Standard modal sheet (draggable from bottom)
CupertinoSheetWidget.showModalSheet<T>({
  required BuildContext context,
  required Widget? title,
  required List<Widget> Function(BuildContext)? children,
  Color? Function(IosThemeData)? colorCallback,
  bool useNestedNavigation = false,
  bool enableDrag = true,
})

// Full-screen modal popup
CupertinoSheetWidget.showCupertinoModalSheet<T>({
  required BuildContext context,
  required Widget? title,
  required List<Widget> Function(BuildContext)? children,
  Color? Function(IosThemeData)? colorCallback,
  ImageFilter? filter,
  Color barrierColor = kCupertinoModalBarrierColor,
  bool barrierDismissible = true,
  bool useRootNavigator = true,
  bool semanticsDismissible = false,
  RouteSettings? routeSettings,
  Offset? anchorPoint,
})

// Standard sheet with title widget
CupertinoSheetWidget.showStandardModalSheet<T>({
  required BuildContext context,
  required String title,
  required List<Widget> Function(BuildContext)? children,
  Widget? leading,
  Widget? separator = const DividerWidget(),
  bool useNestedNavigation = false,
})

// Apple Pay styled sheets
CupertinoSheetWidget.showApplePayModalSheet01<T>({...})
CupertinoSheetWidget.showApplePayModalSheet02<T>({...})
CupertinoSheetWidget.showCupertinoModalSheetApplePayModalSheet01<T>({...})
CupertinoSheetWidget.showCupertinoModalSheetApplePayModalSheet02<T>({...})
```

### Background Colors

**Light Theme:**
- Default: `systemWhite`
- Apple Pay: Custom white

**Dark Theme:**
- Default: `secondaryDarkBase`
- Apple Pay: Custom dark background

### Example Usage

```dart
// Basic bottom sheet
await CupertinoSheetWidget.showModalSheet(
  context: context,
  title: TitleSheetWidget.standard(
    title: 'Select Option',
    leading: CloseButtonWidget(
      onPressed: () => Navigator.pop(context),
    ),
    separator: const DividerWidget(),
  ),
  children: (context) => [
    RowWidget.standard(
      title: 'Option 1',
      description: null,
      leftWidget: null,
      rightWidget: null,
      displayDivider: true,
      onPressed: () {
        Navigator.pop(context, 'option1');
      },
      onLongPress: null,
      decorationCallback: null,
    ),
    RowWidget.standard(
      title: 'Option 2',
      description: null,
      leftWidget: null,
      rightWidget: null,
      displayDivider: false,
      onPressed: () {
        Navigator.pop(context, 'option2');
      },
      onLongPress: null,
      decorationCallback: null,
    ),
  ],
)

// Full-screen modal with blur
await CupertinoSheetWidget.showCupertinoModalSheet(
  context: context,
  filter: kImageFilterBlur,
  barrierColor: const SystemMaterialsBackgroundsColorsDark().thick,
  title: TitleSheetWidget.standard(
    title: 'Details',
    leading: CloseButtonWidget(
      onPressed: () => Navigator.pop(context),
    ),
  ),
  children: (context) => [
    Padding(
      padding: const EdgeInsets.all(16),
      child: Text('Content here'),
    ),
  ],
)

// Standard sheet with title
await CupertinoSheetWidget.showStandardModalSheet(
  context: context,
  title: 'Choose a category',
  leading: CloseButtonWidget(
    onPressed: () => Navigator.pop(context),
  ),
  children: (context) => [
    RowWidget.standard(
      title: 'Sports',
      description: null,
      leftWidget: IconWidget.background(
        iconData: CupertinoIcons.sportscourt,
      ),
      rightWidget: null,
      displayDivider: true,
      onPressed: () => Navigator.pop(context, 'sports'),
      onLongPress: null,
      decorationCallback: null,
    ),
    RowWidget.standard(
      title: 'News',
      description: null,
      leftWidget: IconWidget.background(
        iconData: CupertinoIcons.news,
      ),
      rightWidget: null,
      displayDivider: false,
      onPressed: () => Navigator.pop(context, 'news'),
      onLongPress: null,
      decorationCallback: null,
    ),
  ],
)

// Sheet with nested navigation
await CupertinoSheetWidget.showModalSheet(
  context: context,
  useNestedNavigation: true,
  title: TitleSheetWidget.standard(
    title: 'Settings',
    leading: null,
  ),
  children: (context) => [
    RowWidget.standard(
      title: 'Account',
      description: null,
      leftWidget: null,
      rightWidget: const Icon(CupertinoIcons.chevron_right),
      displayDivider: true,
      onPressed: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => AccountSettingsScreen(),
          ),
        );
      },
      onLongPress: null,
      decorationCallback: null,
    ),
  ],
)

// Apple Pay styled sheet
await CupertinoSheetWidget.showApplePayModalSheet02(
  context: context,
  title: 'Confirm Payment',
  children: (context) => [
    Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text('Amount: \$99.99'),
          const SizedBox(height: 16),
          ButtonWidget.label(
            size: const LargeButtonSize(),
            color: const BlueButtonColor(),
            label: 'Pay with Apple Pay',
            onPressed: () {
              // Process payment
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
  ],
)

// Sheet with custom background
await CupertinoSheetWidget.showModalSheet(
  context: context,
  colorCallback: (theme) => switch (theme) {
    IosLightThemeData() => theme.defaultColors.systemGray06,
    IosDarkThemeData() => theme.defaultSystemBackgroundsColors.primaryDarkBase,
  },
  title: TitleSheetWidget.standard(
    title: 'Custom Sheet',
    leading: null,
  ),
  children: (context) => [
    // Content
  ],
)

// Non-dismissible sheet
await CupertinoSheetWidget.showCupertinoModalSheet(
  context: context,
  barrierDismissible: false,
  enableDrag: false,
  title: TitleSheetWidget.standard(
    title: 'Loading',
    leading: null,
  ),
  children: (context) => [
    const Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: CupertinoActivityIndicator(),
      ),
    ),
  ],
)
```

---

## ModalSheetWidget

Advanced modal sheet with integrated search and title bar.

### File Location
`/lib/src/widgets/modal_sheet_widget.dart`

### Key Features
- Integrated search field
- Resize indicator (drag handle)
- Prompt message support
- Custom title with buttons
- Keyboard-aware layout

### Static Method

```dart
ModalSheetWidget.showModalSheet<T>({
  required BuildContext context,
  required PromptWidget? prompt,
  required ModalTitleWidget? title,
  required CupertinoSearchTextFieldWidget? cupertinoSearchTextFieldWidget,
  bool useRootNavigator = true,
  BarrierFilter barrierFilter = BarrierFilter.disabled,
  Color? barrierColor,
  bool barrierDismissible = true,
  bool semanticsDismissible = false,
  RouteSettings? routeSettings,
  Offset? anchorPoint,
  String barrierLabel = 'Dismiss',
})
```

### Components

**ModalTitleWidget:**
```dart
ModalTitleWidget({
  required String title,
  required LabelButtonWidget? leftLabelButton,
  required LabelButtonWidget? rightLabelButton,
})
```

**PromptWidget:**
```dart
PromptWidget({
  required String message,
})
```

### Barrier Filter Options

```dart
enum BarrierFilter {
  enabled,   // Blur effect with thick barrier
  disabled;  // No blur, ultra-thin barrier
}
```

### Example Usage

```dart
// Search modal
await ModalSheetWidget.showModalSheet(
  context: context,
  barrierFilter: BarrierFilter.enabled,
  title: ModalTitleWidget(
    title: 'Select Contact',
    leftLabelButton: LabelButtonWidget.label(
      label: 'Cancel',
      onPressed: () => Navigator.pop(context),
    ),
    rightLabelButton: null,
  ),
  cupertinoSearchTextFieldWidget: CupertinoSearchTextFieldWidget(
    placeholder: 'Search contacts',
    onChanged: (value) {
      // Filter list
    },
  ),
  prompt: null,
)

// Modal with prompt message
await ModalSheetWidget.showModalSheet(
  context: context,
  prompt: const PromptWidget(
    message: 'Select one or more items from the list below.',
  ),
  title: ModalTitleWidget(
    title: 'Choose Items',
    leftLabelButton: LabelButtonWidget.label(
      label: 'Cancel',
      onPressed: () => Navigator.pop(context),
    ),
    rightLabelButton: LabelButtonWidget.label(
      label: 'Done',
      onPressed: () {
        // Save selection
        Navigator.pop(context);
      },
    ),
  ),
  cupertinoSearchTextFieldWidget: null,
)

// Full featured modal
await ModalSheetWidget.showModalSheet(
  context: context,
  barrierFilter: BarrierFilter.enabled,
  prompt: const PromptWidget(
    message: 'Search for contacts to add to your group.',
  ),
  title: ModalTitleWidget(
    title: 'Add Members',
    leftLabelButton: LabelButtonWidget.label(
      label: 'Back',
      iconLeft: CupertinoIcons.back,
      onPressed: () => Navigator.pop(context),
    ),
    rightLabelButton: LabelButtonWidget.label(
      label: 'Add',
      iconRight: CupertinoIcons.add,
      onPressed: () {
        // Add members
      },
    ),
  ),
  cupertinoSearchTextFieldWidget: CupertinoSearchTextFieldWidget(
    onChanged: (value) {
      // Filter contacts
    },
  ),
)

// Searchable list modal
class SelectableListModal extends StatefulWidget {
  final List<String> items;

  const SelectableListModal({required this.items});

  static Future<String?> show(BuildContext context, List<String> items) {
    return ModalSheetWidget.showModalSheet<String>(
      context: context,
      barrierFilter: BarrierFilter.enabled,
      title: ModalTitleWidget(
        title: 'Select Item',
        leftLabelButton: LabelButtonWidget.label(
          label: 'Cancel',
          onPressed: () => Navigator.pop(context),
        ),
        rightLabelButton: null,
      ),
      cupertinoSearchTextFieldWidget: const CupertinoSearchTextFieldWidget(),
      prompt: null,
    );
  }

  @override
  State<SelectableListModal> createState() => _SelectableListModalState();
}

class _SelectableListModalState extends State<SelectableListModal> {
  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;
  }

  void _filter(String query) {
    setState(() {
      _filteredItems = widget.items
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _filteredItems.length,
      itemBuilder: (context, index) {
        return RowWidget.standard(
          title: _filteredItems[index],
          description: null,
          leftWidget: null,
          rightWidget: null,
          displayDivider: index < _filteredItems.length - 1,
          onPressed: () => Navigator.pop(context, _filteredItems[index]),
          onLongPress: null,
          decorationCallback: null,
        );
      },
    );
  }
}
```

---

## TitleSheetWidget

Title header for sheets with leading widget and separator.

### File Location
`/lib/src/widgets/title_sheet_widget.dart`

### Constructors

```dart
// Standard title
TitleSheetWidget.standard({
  required String title,
  Widget? leading,
  Widget? separator,
})

// Apple Pay variant 1
TitleSheetWidget.applePay01({
  required String title,
  Widget? leading,
  Widget? separator,
})

// Apple Pay variant 2
TitleSheetWidget.applePay02({
  required String title,
  Widget? leading,
  Widget? separator,
})
```

### Example Usage

```dart
// Standard title with close button
TitleSheetWidget.standard(
  title: 'Options',
  leading: CloseButtonWidget(
    onPressed: () => Navigator.pop(context),
  ),
  separator: const DividerWidget(),
)

// Title without leading widget
TitleSheetWidget.standard(
  title: 'Select One',
  leading: null,
  separator: const DividerWidget(),
)

// Apple Pay styled title
TitleSheetWidget.applePay01(
  title: 'Confirm Purchase',
  leading: CloseButtonWidget(
    onPressed: () => Navigator.pop(context),
  ),
  separator: DividerWidget.applePay,
)
```

---

## Common Modal Patterns

### Action Sheet

```dart
await CupertinoSheetWidget.showModalSheet(
  context: context,
  title: null,
  children: (context) => [
    RowWidget.standard(
      title: 'Share',
      description: null,
      leftWidget: IconWidget.background(
        iconData: CupertinoIcons.share,
      ),
      rightWidget: null,
      displayDivider: true,
      onPressed: () {
        Navigator.pop(context, 'share');
      },
      onLongPress: null,
      decorationCallback: null,
    ),
    RowWidget.standard(
      title: 'Save',
      description: null,
      leftWidget: IconWidget.background(
        iconData: CupertinoIcons.square_arrow_down,
      ),
      rightWidget: null,
      displayDivider: true,
      onPressed: () {
        Navigator.pop(context, 'save');
      },
      onLongPress: null,
      decorationCallback: null,
    ),
    RowWidget.standard(
      title: 'Delete',
      description: null,
      leftWidget: IconWidget.background(
        iconData: CupertinoIcons.trash,
        backgroundColorCallback: (theme) => theme.defaultColors.systemRed,
      ),
      rightWidget: null,
      displayDivider: false,
      onPressed: () {
        Navigator.pop(context, 'delete');
      },
      onLongPress: null,
      decorationCallback: null,
    ),
    const SizedBox(height: 8),
    RowWidget.standard(
      title: 'Cancel',
      description: null,
      leftWidget: null,
      rightWidget: null,
      displayDivider: false,
      onPressed: () => Navigator.pop(context),
      onLongPress: null,
      decorationCallback: null,
    ),
  ],
)
```

### Selection Modal with Search

```dart
Future<String?> _showSelectionModal() async {
  return await ModalSheetWidget.showModalSheet<String>(
    context: context,
    barrierFilter: BarrierFilter.enabled,
    prompt: const PromptWidget(
      message: 'Select your preferred option',
    ),
    title: ModalTitleWidget(
      title: 'Choose Option',
      leftLabelButton: LabelButtonWidget.label(
        label: 'Cancel',
        onPressed: () => Navigator.pop(context),
      ),
      rightLabelButton: null,
    ),
    cupertinoSearchTextFieldWidget: CupertinoSearchTextFieldWidget(
      onChanged: (value) {
        // Update filtered list
      },
    ),
  );
}
```

### Confirmation Sheet

```dart
await CupertinoSheetWidget.showStandardModalSheet(
  context: context,
  title: 'Confirm Action',
  leading: null,
  children: (context) => [
    const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        'Are you sure you want to continue? This action cannot be undone.',
        textAlign: TextAlign.center,
      ),
    ),
    const DividerWidget(),
    RowWidget.standard(
      title: 'Continue',
      description: null,
      leftWidget: null,
      rightWidget: null,
      displayDivider: true,
      onPressed: () {
        Navigator.pop(context, true);
      },
      onLongPress: null,
      decorationCallback: null,
    ),
    RowWidget.standard(
      title: 'Cancel',
      description: null,
      leftWidget: null,
      rightWidget: null,
      displayDivider: false,
      onPressed: () {
        Navigator.pop(context, false);
      },
      onLongPress: null,
      decorationCallback: null,
    ),
  ],
)
```

### Loading Modal

```dart
// Show loading
showCupertinoModalPopup(
  context: context,
  barrierDismissible: false,
  builder: (context) => Container(
    decoration: BoxDecoration(
      color: theme.defaultSystemBackgroundsColors.secondaryDarkBase,
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(10),
      ),
    ),
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CupertinoActivityIndicator(radius: 20),
            const SizedBox(height: 16),
            Text(
              'Loading...',
              style: theme.typography.bodyRegular,
            ),
          ],
        ),
      ),
    ),
  ),
);

// Dismiss after operation
await Future.delayed(const Duration(seconds: 2));
Navigator.pop(context);
```

---

## Best Practices

1. **Always provide a way to dismiss** sheets (leading button or drag)
2. **Use BarrierFilter.enabled** for important modals
3. **Set barrierDismissible: false** for loading states
4. **Use PromptWidget** to explain complex selections
5. **Add search** for lists with more than 10 items
6. **Return values** from modals with Navigator.pop(context, value)
7. **Use nested navigation** for multi-step flows
8. **Set enableDrag: false** for non-dismissible sheets
9. **Test keyboard behavior** with search fields
10. **Keep action sheets simple** (max 5-7 actions)

---

## Troubleshooting

### Sheet not dismissing on swipe
- Check enableDrag is true
- Verify barrierDismissible is not false
- Ensure no parent widget is intercepting gestures

### Keyboard covering content
- ModalSheetWidget handles this automatically
- Add SizedBox with viewInsets.bottom for custom sheets

### Search not filtering
- Verify onChanged callback is implemented
- Check setState is called when updating filtered list
- Ensure filtered list is used in builder

### Blur effect not showing
- Set barrierFilter to BarrierFilter.enabled
- Check filter parameter is set to kImageFilterBlur
- Verify device supports blur effects

### Modal appearing behind keyboard
- Use MediaQuery.viewInsetsOf(context).bottom
- ModalSheetWidget handles this automatically
- Wrap content in SingleChildScrollView if needed
