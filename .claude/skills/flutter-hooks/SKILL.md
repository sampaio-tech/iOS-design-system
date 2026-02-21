---
name: flutter-hooks
description: Using flutter_hooks for cleaner state management in iOS Design System widgets
---

## Why Flutter Hooks

This project includes `flutter_hooks: ^0.21.2`. Benefits:
- **Less boilerplate** - No State classes
- **Auto cleanup** - Controllers disposed automatically
- **More composable** - Share logic easily
- **Cleaner code** - No setState(), lifecycle methods

## Basic Pattern

### Traditional vs Hooks

**Traditional (Verbose):**
```dart
class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(controller: _controller);
  }
}
```

**Hooks (Clean):**
```dart
class MyWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(); // Auto-disposed!
    return TextField(controller: controller);
  }
}
```

## Common Hooks

### useState - Simple State
```dart
final count = useState(0);
// Access: count.value
// Update: count.value++
```

### useTextEditingController - Text Fields
```dart
final controller = useTextEditingController();
// Auto-disposed when widget removed
```

### useEffect - Side Effects
```dart
useEffect(() {
  // Setup
  controller.addListener(listener);

  // Cleanup (returned function)
  return () => controller.removeListener(listener);
}, [controller]); // Dependencies
```

### useMemoized - Cache Expensive Operations
```dart
final filtered = useMemoized(
  () => items.where((item) => item.isActive).toList(),
  [items], // Only recomputes when items change
);
```

### useAnimationController - Animations
```dart
final animController = useAnimationController(
  duration: Duration(milliseconds: 300),
);
// No vsync needed, auto-disposed!
```

## Real-World Examples

### Form with Validation
```dart
class ProfileForm extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final isValid = useState(false);
    final isLoading = useState(false);

    // Auto-validation
    useEffect(() {
      void validate() {
        isValid.value = nameController.text.isNotEmpty &&
                       emailController.text.contains('@');
      }

      nameController.addListener(validate);
      emailController.addListener(validate);

      return () {
        nameController.removeListener(validate);
        emailController.removeListener(validate);
      };
    }, [nameController, emailController]);

    return Column(
      children: [
        GroupedTableWidget(
          rows: [
            CupertinoTextFieldWidget(
              placeholder: 'Name',
              controller: nameController,
            ),
            CupertinoTextFieldWidget(
              placeholder: 'Email',
              controller: emailController,
            ),
          ],
        ),
        ButtonWidget.label(
          size: const LargeButtonSize(),
          color: const BlueButtonColor(),
          label: 'Save',
          displayCupertinoActivityIndicator: isLoading.value,
          onPressed: !isValid.value || isLoading.value
              ? null
              : () async {
                  isLoading.value = true;
                  await Future.delayed(Duration(seconds: 2));
                  isLoading.value = false;
                },
        ),
      ],
    );
  }
}
```

### Search with Debounce
```dart
class SearchScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    final results = useState<List<String>>([]);
    final isSearching = useState(false);

    useEffect(() {
      Timer? debounce;

      void search() {
        debounce?.cancel();
        debounce = Timer(Duration(milliseconds: 500), () async {
          if (searchController.text.isEmpty) {
            results.value = [];
            return;
          }

          isSearching.value = true;
          // Simulate API call
          await Future.delayed(Duration(seconds: 1));
          results.value = ['Result 1', 'Result 2', 'Result 3'];
          isSearching.value = false;
        });
      }

      searchController.addListener(search);
      return () {
        debounce?.cancel();
        searchController.removeListener(search);
      };
    }, [searchController]);

    return Column(
      children: [
        CupertinoSearchTextFieldWidget(controller: searchController),
        if (isSearching.value) CupertinoActivityIndicator(),
        Expanded(
          child: ListView.builder(
            itemCount: results.value.length,
            itemBuilder: (context, index) => RowWidget.standard(
              title: results.value[index],
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
```

### Theme Switcher
```dart
class ThemeSwitcher extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = useState(false);

    // Memoize theme (only recreates when isDark changes)
    final themeData = useMemoized(
      () => isDark.value ? IosDarkThemeData() : IosLightThemeData(),
      [isDark.value],
    );

    return IosAnimatedTheme(
      data: themeData,
      child: ScaffoldWidget(
        navigationBar: CupertinoNavigatorBarWidget(title: 'Theme'),
        child: SwitchWidget(
          value: isDark.value,
          onChanged: (value) => isDark.value = value,
        ),
      ),
    );
  }
}
```

### Infinite Scroll
```dart
class InfiniteList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final items = useState<List<String>>([]);
    final isLoading = useState(false);
    final scrollController = useScrollController();

    // Load more when near bottom
    useEffect(() {
      void checkScroll() {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200) {
          if (!isLoading.value) {
            _loadMore(items, isLoading);
          }
        }
      }

      scrollController.addListener(checkScroll);
      return () => scrollController.removeListener(checkScroll);
    }, [scrollController]);

    // Initial load
    useEffect(() {
      _loadMore(items, isLoading);
      return null;
    }, []);

    return ListView.builder(
      controller: scrollController,
      itemCount: items.value.length + (isLoading.value ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= items.value.length) {
          return CupertinoActivityIndicator();
        }
        return RowWidget.standard(
          title: items.value[index],
          onPressed: () {},
        );
      },
    );
  }

  Future<void> _loadMore(
    ValueNotifier<List<String>> items,
    ValueNotifier<bool> isLoading,
  ) async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 1));
    items.value = [
      ...items.value,
      ...List.generate(20, (i) => 'Item ${items.value.length + i}'),
    ];
    isLoading.value = false;
  }
}
```

### Tabbed Interface
```dart
class TabbedScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final selectedTab = useState(0);

    return ScaffoldWidget(
      toolBar: ToolBarWidget(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < 3; i++)
              ButtonWidget.label(
                size: const MediumButtonSize(),
                color: selectedTab.value == i
                    ? const BlueButtonColor()
                    : const GreyTransparentButtonColor(),
                label: 'Tab ${i + 1}',
                onPressed: () => selectedTab.value = i,
              ),
          ],
        ),
      ),
      child: _buildContent(selectedTab.value),
    );
  }

  Widget _buildContent(int tab) => Center(
    child: Text('Tab $tab Content'),
  );
}
```

## Migration from StatefulWidget

### Steps
1. Change `extends StatefulWidget` → `extends HookWidget`
2. Remove `State` class
3. Replace `initState` with `useEffect(() { ... return null; }, [])`
4. Replace `dispose` with effect cleanup `return () => ...`
5. Replace `setState` with `useState`
6. Replace controllers with hooks (`useTextEditingController()`, etc.)

### Checklist
- [ ] Import `flutter_hooks`
- [ ] Extend `HookWidget`
- [ ] Use hooks in `build()`
- [ ] Return cleanup in `useEffect`
- [ ] Specify dependencies
- [ ] Test both light/dark modes

## Hook Reference

```dart
useState<T>(T initialValue)
useTextEditingController({String? text})
useScrollController({double initialOffset})
useAnimationController({Duration? duration})
useMemoized<T>(T Function() compute, [keys])
useEffect(Function() effect, [keys])
useCallback<T>(T Function() callback, [keys])
useFuture<T>(Future<T> future)
useStream<T>(Stream<T> stream)
```

## Import

```dart
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ios_design_system/ios_design_system.dart';
```
