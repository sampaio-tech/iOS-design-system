---
description: "Using flutter_hooks for cleaner state management instead of StatefulWidget"
alwaysApply: false
---

# Flutter Hooks Patterns for iOS Design System

## Overview

This project includes `flutter_hooks: ^0.21.2`. This guide shows how to use hooks instead of traditional `StatefulWidget` for cleaner, more composable state management.

## Why Use Hooks?

- **Less boilerplate** - No need for State classes
- **Better disposal** - Automatic cleanup
- **More composable** - Share logic across widgets
- **Easier testing** - Pure functions
- **Cleaner code** - No `setState()`, lifecycle methods

## Basic Pattern Comparison

### Traditional StatefulWidget vs Hooks

**❌ Traditional Way (Verbose)**:
```dart
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

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
    final theme = IosTheme.of(context);
    return CupertinoTextFieldWidget(controller: _controller);
  }
}
```

**✅ Hooks Way (Clean)**:
```dart
class MyWidget extends HookWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    final controller = useTextEditingController(); // Auto-disposed!

    return CupertinoTextFieldWidget(controller: controller);
  }
}
```

## Common Hooks for iOS Design System

### 1. useState - Simple State

**Traditional**:
```dart
class CounterWidget extends StatefulWidget {
  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    return ButtonWidget.label(
      size: const LargeButtonSize(),
      color: const BlueButtonColor(),
      label: 'Count: $_count',
      onPressed: _increment,
    );
  }
}
```

**Hooks**:
```dart
class CounterWidget extends HookWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    final count = useState(0); // Returns ValueNotifier<int>

    return ButtonWidget.label(
      size: const LargeButtonSize(),
      color: const BlueButtonColor(),
      label: 'Count: ${count.value}',
      onPressed: () => count.value++, // Auto rebuilds!
    );
  }
}
```

### 2. useTextEditingController - Form Fields

**Traditional**:
```dart
class FormScreen extends StatefulWidget {
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GroupedTableWidget(
      rows: [
        CupertinoTextFieldWidget(
          placeholder: 'Name',
          controller: _nameController,
        ),
        CupertinoTextFieldWidget(
          placeholder: 'Email',
          controller: _emailController,
        ),
      ],
    );
  }
}
```

**Hooks**:
```dart
class FormScreen extends HookWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    // Auto-disposed when widget is removed!

    return GroupedTableWidget(
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
    );
  }
}
```

### 3. useAnimationController - Animations

**Traditional**:
```dart
class AnimatedButton extends StatefulWidget {
  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: ButtonWidget.label(
        label: 'Tap',
        onPressed: () {
          if (_controller.isCompleted) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
      ),
    );
  }
}
```

**Hooks**:
```dart
class AnimatedButton extends HookWidget {
  const AnimatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 300),
    ); // Auto-disposed + vsync handled!

    final animation = useMemoized(
      () => CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
      [controller],
    );

    return FadeTransition(
      opacity: animation,
      child: ButtonWidget.label(
        size: const LargeButtonSize(),
        color: const BlueButtonColor(),
        label: 'Tap',
        onPressed: () {
          if (controller.isCompleted) {
            controller.reverse();
          } else {
            controller.forward();
          }
        },
      ),
    );
  }
}
```

### 4. useEffect - Side Effects & Listeners

**Traditional**:
```dart
class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _controller;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
      _query = _controller.text;
    });
    // Perform search
    print('Searching for: $_query');
  }

  @override
  void dispose() {
    _controller.removeListener(_onSearchChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextFieldWidget(
      controller: _controller,
    );
  }
}
```

**Hooks**:
```dart
class SearchScreen extends HookWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final query = useState('');

    useEffect(() {
      void listener() {
        query.value = controller.text;
        print('Searching for: ${query.value}');
      }

      controller.addListener(listener);
      return () => controller.removeListener(listener); // Cleanup!
    }, [controller]);

    return CupertinoSearchTextFieldWidget(
      controller: controller,
    );
  }
}
```

### 5. useMemoized - Expensive Computations

**Traditional**:
```dart
class ListScreen extends StatelessWidget {
  final List<String> items;

  const ListScreen({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    // This filters on EVERY rebuild!
    final filteredItems = items.where((item) => item.length > 5).toList();

    return ListView.builder(
      itemCount: filteredItems.length,
      itemBuilder: (context, index) => Text(filteredItems[index]),
    );
  }
}
```

**Hooks**:
```dart
class ListScreen extends HookWidget {
  final List<String> items;

  const ListScreen({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    // Only recomputes when items change!
    final filteredItems = useMemoized(
      () => items.where((item) => item.length > 5).toList(),
      [items],
    );

    return ListView.builder(
      itemCount: filteredItems.length,
      itemBuilder: (context, index) => Text(filteredItems[index]),
    );
  }
}
```

## Real-World Examples

### 1. Theme Switcher with Hooks

```dart
class ThemeSwitcherScreen extends HookWidget {
  const ThemeSwitcherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // State for current theme
    final isDark = useState(false);

    // Memoized theme data
    final themeData = useMemoized(
      () => isDark.value ? IosDarkThemeData() : IosLightThemeData(),
      [isDark.value],
    );

    return IosAnimatedTheme(
      data: themeData,
      child: ScaffoldWidget(
        navigationBar: CupertinoNavigatorBarWidget(
          title: 'Theme Switcher',
        ),
        child: Center(
          child: SwitchWidget(
            value: isDark.value,
            onChanged: (value) => isDark.value = value,
          ),
        ),
      ),
    );
  }
}
```

### 2. Form with Validation

```dart
class ProfileForm extends HookWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);

    // Controllers
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();

    // State
    final isValid = useState(false);
    final isLoading = useState(false);

    // Validation effect
    useEffect(() {
      void validate() {
        isValid.value =
          nameController.text.isNotEmpty &&
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
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
        const SizedBox(height: 16),
        ButtonWidget.label(
          size: const LargeButtonSize(),
          color: const BlueButtonColor(),
          label: 'Save',
          displayCupertinoActivityIndicator: isLoading.value,
          onPressed: !isValid.value || isLoading.value
              ? null
              : () async {
                  isLoading.value = true;
                  await Future.delayed(const Duration(seconds: 2));
                  isLoading.value = false;
                  // Save profile
                },
        ),
      ],
    );
  }
}
```

### 3. Debounced Search

```dart
class DebounceSearchScreen extends HookWidget {
  const DebounceSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final searchResults = useState<List<String>>([]);
    final isSearching = useState(false);

    // Debounced search effect
    useEffect(() {
      Timer? debounce;

      void onSearch() {
        debounce?.cancel();
        debounce = Timer(const Duration(milliseconds: 500), () async {
          if (controller.text.isEmpty) {
            searchResults.value = [];
            return;
          }

          isSearching.value = true;
          // Simulate API call
          await Future.delayed(const Duration(seconds: 1));
          searchResults.value = [
            '${controller.text} Result 1',
            '${controller.text} Result 2',
            '${controller.text} Result 3',
          ];
          isSearching.value = false;
        });
      }

      controller.addListener(onSearch);

      return () {
        debounce?.cancel();
        controller.removeListener(onSearch);
      };
    }, [controller]);

    return Column(
      children: [
        CupertinoSearchTextFieldWidget(
          controller: controller,
        ),
        if (isSearching.value)
          const Padding(
            padding: EdgeInsets.all(16),
            child: CupertinoActivityIndicator(),
          ),
        Expanded(
          child: ListView.builder(
            itemCount: searchResults.value.length,
            itemBuilder: (context, index) => RowWidget.standard(
              title: searchResults.value[index],
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
```

### 4. Tab Controller with Hooks

```dart
class TabbedScreen extends HookWidget {
  const TabbedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab = useState(0);

    return ScaffoldWidget(
      navigationBar: CupertinoNavigatorBarWidget(
        title: 'Tabs',
      ),
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
      child: _buildTabContent(selectedTab.value),
    );
  }

  Widget _buildTabContent(int tab) {
    return switch (tab) {
      0 => const Center(child: Text('Tab 1 Content')),
      1 => const Center(child: Text('Tab 2 Content')),
      2 => const Center(child: Text('Tab 3 Content')),
      _ => const SizedBox.shrink(),
    };
  }
}
```

### 5. Infinite Scroll List

```dart
class InfiniteScrollList extends HookWidget {
  const InfiniteScrollList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = useState<List<String>>([]);
    final isLoading = useState(false);
    final scrollController = useScrollController();

    // Load more effect
    useEffect(() {
      void onScroll() {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200) {
          if (!isLoading.value) {
            _loadMore(items, isLoading);
          }
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
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
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CupertinoActivityIndicator()),
          );
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
    await Future.delayed(const Duration(seconds: 1));
    items.value = [
      ...items.value,
      ...List.generate(20, (i) => 'Item ${items.value.length + i}'),
    ];
    isLoading.value = false;
  }
}
```

### 6. Pull to Refresh

```dart
class RefreshableList extends HookWidget {
  const RefreshableList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = useState<List<String>>([]);
    final isRefreshing = useState(false);

    // Load data effect
    useEffect(() {
      _loadData(items);
      return null;
    }, []);

    Future<void> onRefresh() async {
      isRefreshing.value = true;
      await _loadData(items);
      isRefreshing.value = false;
    }

    return CustomScrollView(
      slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: onRefresh,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => RowWidget.standard(
              title: items.value[index],
              onPressed: () {},
            ),
            childCount: items.value.length,
          ),
        ),
      ],
    );
  }

  Future<void> _loadData(ValueNotifier<List<String>> items) async {
    await Future.delayed(const Duration(seconds: 1));
    items.value = List.generate(20, (i) => 'Item $i');
  }
}
```

## Custom Hooks

Create reusable logic:

```dart
// Custom hook for theme-aware colors
Color useThemeColor(Color Function(IosThemeData) selector) {
  final context = useContext();
  final theme = IosTheme.of(context);
  return useMemoized(() => selector(theme), [theme]);
}

// Usage
class MyWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final backgroundColor = useThemeColor(
      (theme) => theme.defaultSystemBackgroundsColors.primaryLight,
    );

    return Container(color: backgroundColor);
  }
}

// Custom hook for debounced value
T useDebounce<T>(T value, Duration duration) {
  final debounced = useState(value);

  useEffect(() {
    final timer = Timer(duration, () {
      debounced.value = value;
    });

    return timer.cancel;
  }, [value]);

  return debounced.value;
}

// Usage in search
class SearchWithDebounce extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final query = useState('');

    useEffect(() {
      void listener() => query.value = controller.text;
      controller.addListener(listener);
      return () => controller.removeListener(listener);
    }, [controller]);

    final debouncedQuery = useDebounce(query.value, Duration(milliseconds: 500));

    useEffect(() {
      if (debouncedQuery.isNotEmpty) {
        print('Searching for: $debouncedQuery');
      }
      return null;
    }, [debouncedQuery]);

    return CupertinoSearchTextFieldWidget(controller: controller);
  }
}
```

## Best Practices

### 1. Use HookWidget for New Components
```dart
// ✅ Prefer this
class MyWidget extends HookWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = useState(0);
    return Text('$state');
  }
}
```

### 2. Memoize Expensive Operations
```dart
// ✅ Good - only recomputes when items change
final filtered = useMemoized(
  () => items.where((item) => item.isActive).toList(),
  [items],
);
```

### 3. Clean Up Effects
```dart
// ✅ Always return cleanup function
useEffect(() {
  final subscription = stream.listen((data) {});
  return subscription.cancel; // Cleanup!
}, [stream]);
```

### 4. Manage Dependencies
```dart
// ✅ Specify dependencies
useEffect(() {
  print('Count changed: $count');
  return null;
}, [count]); // Only runs when count changes

// ❌ Missing dependencies
useEffect(() {
  print('Count changed: $count');
  return null;
}, []); // Runs once, won't see updates!
```

## Migration Checklist

Converting StatefulWidget to HookWidget:

- [ ] Extend `HookWidget` instead of `StatefulWidget`
- [ ] Remove `State` class
- [ ] Replace `initState` with `useEffect(() { ... return null; }, [])`
- [ ] Replace `dispose` with effect cleanup `return () => ...`
- [ ] Replace `setState` with `useState`
- [ ] Replace controllers with `useTextEditingController()`, etc.
- [ ] Replace animation controllers with `useAnimationController()`
- [ ] Add imports: `import 'package:flutter_hooks/flutter_hooks.dart';`

## Common Hooks Reference

```dart
useState<T>(T initialValue)                    // Simple state
useTextEditingController({String? text})       // Text field controller
useScrollController({double initialOffset})    // Scroll controller
useAnimationController({Duration? duration})   // Animation controller
useTabController({int initialIndex, int length}) // Tab controller
useMemoized<T>(T Function() compute, [keys])   // Memoize expensive ops
useEffect(Function() effect, [keys])           // Side effects
useCallback<T>(T Function() callback, [keys])  // Memoize callbacks
useFuture<T>(Future<T> future, {T? initialData}) // Future handling
useStream<T>(Stream<T> stream, {T? initialData}) // Stream handling
useListenable(Listenable listenable)          // Listen to Listenable
useValueListenable<T>(ValueListenable<T>)     // Listen to ValueListenable
```

This makes your iOS Design System code much cleaner and more maintainable!
