---
name: sheet-modals
description: Bottom sheets, modals, action sheets, and title sheets with search and navigation
---

## Sheet & Modal Widgets Reference

iOS-style bottom sheets and modal presentations with blur effects, drag handling, and search capabilities.

## CupertinoSheetWidget

Versatile bottom sheet with draggable swipe-to-dismiss.

### showModalSheet - Draggable Bottom Sheet

```dart
await CupertinoSheetWidget.showModalSheet(
  context: context,
  enableDrag: true, // Default true
  useNestedNavigation: false,
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
      leftWidget: IconWidget.background(
        iconData: CupertinoIcons.star,
      ),
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
```

### showCupertinoModalSheet - Full-Screen Modal

```dart
await CupertinoSheetWidget.showCupertinoModalSheet(
  context: context,
  filter: kImageFilterBlur, // Blur background
  barrierColor: const SystemMaterialsBackgroundsColorsDark().thick,
  barrierDismissible: true,
  enableDrag: true,
  title: TitleSheetWidget.standard(
    title: 'Details',
    leading: CloseButtonWidget(
      onPressed: () => Navigator.pop(context),
    ),
  ),
  children: (context) => [
    Padding(
      padding: const EdgeInsets.all(16),
      child: Text('Modal content here'),
    ),
  ],
)
```

### showStandardModalSheet - Standard with Title

```dart
await CupertinoSheetWidget.showStandardModalSheet(
  context: context,
  title: 'Choose a category',
  leading: CloseButtonWidget(
    onPressed: () => Navigator.pop(context),
  ),
  separator: const DividerWidget(),
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
  ],
)
```

### Nested Navigation

For multi-step flows within sheets:

```dart
await CupertinoSheetWidget.showModalSheet(
  context: context,
  useNestedNavigation: true, // Enable nested navigation
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
```

### Apple Pay Variants

```dart
// Apple Pay Modal Sheet 01
await CupertinoSheetWidget.showApplePayModalSheet01(
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

// Apple Pay Modal Sheet 02
await CupertinoSheetWidget.showApplePayModalSheet02(
  context: context,
  title: 'Payment Details',
  children: (context) => [/* content */],
)

// Full-screen Apple Pay variants
await CupertinoSheetWidget.showCupertinoModalSheetApplePayModalSheet01(
  context: context,
  title: 'Payment',
  children: (context) => [/* content */],
)
```

### Non-Dismissible Sheet

```dart
await CupertinoSheetWidget.showCupertinoModalSheet(
  context: context,
  barrierDismissible: false, // Can't dismiss by tapping outside
  enableDrag: false,          // Can't swipe to dismiss
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

### Custom Background Color

```dart
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
  children: (context) => [/* content */],
)
```

## ModalSheetWidget

Advanced modal with integrated search and prompt messages.

### Basic Search Modal

```dart
await ModalSheetWidget.showModalSheet(
  context: context,
  barrierFilter: BarrierFilter.enabled, // Blur background
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
```

### Modal with Prompt Message

```dart
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
```

### Full Featured Modal

```dart
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
```

### Searchable List Modal Pattern

```dart
class SelectableListModal extends HookWidget {
  final List<String> items;

  const SelectableListModal({
    required this.items,
    super.key,
  });

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
  Widget build(BuildContext context) {
    final query = useState('');
    final filteredItems = useMemoized(
      () => items
        .where((item) => item.toLowerCase().contains(query.value.toLowerCase()))
        .toList(),
      [query.value, items],
    );

    return ListView.builder(
      shrinkWrap: true,
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
        return RowWidget.standard(
          title: filteredItems[index],
          description: null,
          leftWidget: null,
          rightWidget: null,
          displayDivider: index < filteredItems.length - 1,
          onPressed: () => Navigator.pop(context, filteredItems[index]),
          onLongPress: null,
          decorationCallback: null,
        );
      },
    );
  }
}

// Usage
final selected = await SelectableListModal.show(
  context,
  ['Apple', 'Banana', 'Cherry'],
);
```

## TitleSheetWidget

Title header for sheets with leading widget and separator.

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

// Apple Pay variant 2
TitleSheetWidget.applePay02(
  title: 'Payment Method',
  leading: CloseButtonWidget(
    onPressed: () => Navigator.pop(context),
  ),
  separator: DividerWidget.applePay,
)
```

## Common Modal Patterns

### Action Sheet

```dart
final action = await CupertinoSheetWidget.showModalSheet<String>(
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
      onPressed: () => Navigator.pop(context, 'share'),
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
      onPressed: () => Navigator.pop(context, 'save'),
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
      onPressed: () => Navigator.pop(context, 'delete'),
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
);

if (action == 'delete') {
  // Handle delete
}
```

### Confirmation Sheet

```dart
final confirmed = await CupertinoSheetWidget.showStandardModalSheet<bool>(
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
      onPressed: () => Navigator.pop(context, true),
      onLongPress: null,
      decorationCallback: null,
    ),
    RowWidget.standard(
      title: 'Cancel',
      description: null,
      leftWidget: null,
      rightWidget: null,
      displayDivider: false,
      onPressed: () => Navigator.pop(context, false),
      onLongPress: null,
      decorationCallback: null,
    ),
  ],
);

if (confirmed == true) {
  // Proceed with action
}
```

### Loading Modal

```dart
// Show loading
showCupertinoModalPopup(
  context: context,
  barrierDismissible: false,
  builder: (context) {
    final theme = IosTheme.of(context);
    return Container(
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
    );
  },
);

// Dismiss after operation
await Future.delayed(const Duration(seconds: 2));
Navigator.pop(context);
```

### Multi-Select Modal with Hooks

```dart
class MultiSelectModal extends HookWidget {
  final List<String> options;

  const MultiSelectModal({
    required this.options,
    super.key,
  });

  static Future<Set<String>?> show(
    BuildContext context,
    List<String> options,
  ) {
    return ModalSheetWidget.showModalSheet<Set<String>>(
      context: context,
      barrierFilter: BarrierFilter.enabled,
      prompt: const PromptWidget(
        message: 'Select one or more options',
      ),
      title: ModalTitleWidget(
        title: 'Choose Options',
        leftLabelButton: LabelButtonWidget.label(
          label: 'Cancel',
          onPressed: () => Navigator.pop(context),
        ),
        rightLabelButton: null,
      ),
      cupertinoSearchTextFieldWidget: null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final selected = useState<Set<String>>({});

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: options.length,
            itemBuilder: (context, index) {
              final option = options[index];
              final isSelected = selected.value.contains(option);

              return RowWidget.standard(
                title: option,
                description: null,
                leftWidget: null,
                rightWidget: isSelected
                  ? Icon(
                      CupertinoIcons.checkmark_circle_fill,
                      color: IosTheme.of(context).defaultColors.systemBlue,
                    )
                  : const Icon(CupertinoIcons.circle),
                displayDivider: index < options.length - 1,
                onPressed: () {
                  final newSelected = Set<String>.from(selected.value);
                  if (isSelected) {
                    newSelected.remove(option);
                  } else {
                    newSelected.add(option);
                  }
                  selected.value = newSelected;
                },
                onLongPress: null,
                decorationCallback: null,
              );
            },
          ),
        ),
        ToolBarWidget(
          child: ButtonWidget.label(
            size: const LargeButtonSize(),
            color: const BlueButtonColor(),
            label: 'Done (${selected.value.length})',
            onPressed: () => Navigator.pop(context, selected.value),
          ),
        ),
      ],
    );
  }
}

// Usage
final selected = await MultiSelectModal.show(
  context,
  ['Option 1', 'Option 2', 'Option 3'],
);
if (selected != null) {
  print('Selected: $selected');
}
```

## Components

### CloseButtonWidget

Standard iOS close button (X in circle).

```dart
CloseButtonWidget(
  onPressed: () => Navigator.pop(context),
)
```

### PromptWidget

Message displayed at top of modal.

```dart
const PromptWidget(
  message: 'Select one or more items from the list below.',
)
```

### ModalTitleWidget

Title bar with left and right buttons.

```dart
ModalTitleWidget(
  title: 'Select Contact',
  leftLabelButton: LabelButtonWidget.label(
    label: 'Cancel',
    onPressed: () => Navigator.pop(context),
  ),
  rightLabelButton: LabelButtonWidget.label(
    label: 'Done',
    onPressed: () {},
  ),
)
```

## Background Colors

### Light Theme
- Default: `systemWhite`
- Apple Pay: Custom white

### Dark Theme
- Default: `secondaryDarkBase`
- Apple Pay: Custom dark background

## Best Practices

1. **Always provide a way to dismiss** - Use leading button or enable drag
2. **Use BarrierFilter.enabled** for important modals requiring attention
3. **Set barrierDismissible: false** for loading states
4. **Use PromptWidget** to explain complex selections
5. **Add search** for lists with more than 10 items
6. **Return values** from modals using `Navigator.pop(context, value)`
7. **Use nested navigation** for multi-step flows
8. **Set enableDrag: false** for non-dismissible sheets
9. **Test keyboard behavior** with search fields
10. **Keep action sheets simple** - Maximum 5-7 actions

## Troubleshooting

### Sheet not dismissing on swipe
- Check `enableDrag` is `true`
- Verify `barrierDismissible` is not `false`
- Ensure no parent widget is intercepting gestures

### Keyboard covering content
- ModalSheetWidget handles this automatically
- For custom sheets, add `MediaQuery.viewInsetsOf(context).bottom`

### Search not filtering
- Verify `onChanged` callback updates state
- Check `setState` or hook state update is called
- Ensure filtered list is used in builder

### Blur effect not showing
- Set `barrierFilter` to `BarrierFilter.enabled`
- Check `filter` parameter is set to `kImageFilterBlur`
- Verify device supports blur effects

## File Locations

- CupertinoSheetWidget: `/lib/src/widgets/cupertino_sheet_widget.dart`
- ModalSheetWidget: `/lib/src/widgets/modal_sheet_widget.dart`
- TitleSheetWidget: `/lib/src/widgets/title_sheet_widget.dart`
- ModalTitleWidget: `/lib/src/widgets/modal_title_widget.dart`
- CloseButtonWidget: `/lib/src/widgets/close_button_widget.dart`
- PromptWidget: `/lib/src/widgets/prompt_widget.dart`
