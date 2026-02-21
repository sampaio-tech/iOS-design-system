---
name: app-themes
description: Specialized widgets and themes for Music, Stocks, Weather, App Store, and Books apps
---

## App-Specific Themes Reference

Pre-built themes and widgets for specific iOS app styles.

## Available Themes

This design system includes 6 app-specific themes:
1. **Neutral Music** - Apple Music style
2. **Neutral Podcast** - Podcast app style
3. **Stocks** - Stocks app style
4. **Weather** - Weather app style
5. **App Store** - App Store style
6. **Books** - Books app style

## Neutral Music Theme

Glassmorphism effects and gradient backgrounds for music player interfaces.

### NeutralCardWidget

Music-themed card with gradient background.

```dart
NeutralCardWidget(
  padding: const EdgeInsets.all(16),
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
)
```

### NeutralCircularButtonWidget

Circular button with glassmorphism for music controls.

```dart
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
)
```

### NeutralPillButtonWidget

Pill-shaped button with gradient styling.

```dart
NeutralPillButtonWidget(
  label: 'Add to Playlist',
  leftIcon: CupertinoIcons.add,
  onPressed: () {
    // Add to playlist
  },
)

NeutralPillButtonWidget(
  label: 'Share',
  rightIcon: CupertinoIcons.share,
  onPressed: () {
    // Share song
  },
)
```

### Music Player Pattern
```dart
class MusicPlayerScreen extends HookWidget {
  const MusicPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    final isPlaying = useState(false);

    return ScaffoldWidget(
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
          onPressed: () {},
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
                  // Album art
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: 300,
                      height: 300,
                      color: theme.defaultColors.systemGray05,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Song info
                  Text(
                    'Song Title',
                    style: theme.typography.title2Bold,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Artist Name',
                    style: theme.typography.bodyRegular.copyWith(
                      color: theme.defaultLabelColors.secondary,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Controls
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NeutralCircularButtonWidget(
                        iconData: CupertinoIcons.backward_fill,
                        onPressed: () {},
                      ),
                      NeutralCircularButtonWidget(
                        iconData: isPlaying.value
                          ? CupertinoIcons.pause_fill
                          : CupertinoIcons.play_fill,
                        iconSize: 32,
                        onPressed: () => isPlaying.value = !isPlaying.value,
                      ),
                      NeutralCircularButtonWidget(
                        iconData: CupertinoIcons.forward_fill,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Action buttons
                  NeutralPillButtonWidget(
                    label: 'Add to Playlist',
                    leftIcon: CupertinoIcons.add,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

## Stocks Theme

Financial app styling with gradient backgrounds and custom colors.

### Widgets
- `RowWidget.stocks()` - Row with stocks styling
- `GroupedTableWidget.stocks()` - Grouped table with gradient
- `SwitchWidget.stocks()` - Switch with stocks colors
- `DividerWidget.stocks` - Stocks-styled divider

### Stocks List Pattern
```dart
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
          color: theme.defaultColors.systemGreen, // Positive trend
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
          color: theme.defaultColors.systemRed, // Negative trend
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

### Stocks Colors
```dart
// Access stocks theme
final theme = IosTheme.of(context);
final stocksTheme = theme.stocksDecorations;

// Use gradient
Container(
  decoration: stocksTheme.gradients.background,
  child: child,
)
```

## Weather Theme

Weather app colors and gradients.

### Weather Gradients
```dart
final theme = IosTheme.of(context);
final weatherTheme = theme.weatherDecorations;

// Day gradient
Container(
  decoration: BoxDecoration(
    gradient: weatherTheme.weatherDayGradient,
  ),
)

// Night gradient
Container(
  decoration: BoxDecoration(
    gradient: weatherTheme.weatherNightGradient,
  ),
)

// Rain gradient
Container(
  decoration: BoxDecoration(
    gradient: weatherTheme.weatherRainGradient,
  ),
)
```

## App Store Theme

App Store-style widgets and colors.

### AppIconWidget

App icon with proper sizing and rounded corners.

```dart
// Standard app icon
AppIconWidget(
  imageUrl: 'https://example.com/icon.png',
  size: 60,
  borderRadius: 12,
)

// Large featured icon
AppIconWidget(
  imageUrl: appIconUrl,
  size: 80,
  borderRadius: 16,
)
```

### App Store List Pattern
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

### Featured App Card
```dart
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

## Books Theme

Books app specific colors and styling.

```dart
// Access books theme
final theme = IosTheme.of(context);
final booksTheme = theme.booksDecorations;

// Use books colors
Container(
  color: booksTheme.backgroundColor,
  child: child,
)
```

## Podcast Theme

Podcast app styling similar to Music theme.

```dart
// Access podcast theme
final theme = IosTheme.of(context);
final podcastTheme = theme.neutralPodcastDecorations;
```

## Theme Access Pattern

```dart
@override
Widget build(BuildContext context) {
  final theme = IosTheme.of(context);

  // Access specific theme
  final musicTheme = theme.neutralMusicDecorations;
  final stocksTheme = theme.stocksDecorations;
  final weatherTheme = theme.weatherDecorations;
  final appStoreTheme = theme.appStoreDecorations;
  final booksTheme = theme.booksDecorations;
  final podcastTheme = theme.neutralPodcastDecorations;

  // Use theme colors
  return Container(
    decoration: BoxDecoration(
      gradient: musicTheme.primaryBackground,
    ),
    child: child,
  );
}
```

## Creating Custom App Themes

### Step 1: Define Colors

```dart
// In /lib/src/theme/colors/my_app.dart
part of 'colors.dart';

class MyAppColors {
  const MyAppColors({
    required this.primary,
    required this.secondary,
    required this.accent,
  });

  final Color primary;
  final Color secondary;
  final Color accent;

  MyAppColors lerp(MyAppColors b, double t) {
    if (identical(this, b)) return this;

    return MyAppColors(
      primary: Color.lerp(primary, b.primary, t)!,
      secondary: Color.lerp(secondary, b.secondary, t)!,
      accent: Color.lerp(accent, b.accent, t)!,
    );
  }
}

class MyAppColorsLight extends MyAppColors {
  const MyAppColorsLight()
    : super(
        primary: const Color(0xFF0066CC),
        secondary: const Color(0xFF00CC66),
        accent: const Color(0xFFCC0066),
      );
}

class MyAppColorsDark extends MyAppColors {
  const MyAppColorsDark()
    : super(
        primary: const Color(0xFF3399FF),
        secondary: const Color(0xFF33FF99),
        accent: const Color(0xFFFF3399),
      );
}
```

### Step 2: Add to Theme Data

Update theme to include custom colors.

### Step 3: Create Widget Variants

```dart
// Add variant to existing widget
class RowWidget extends StatelessWidget {
  factory RowWidget.myApp({
    required String title,
    required String? description,
    // ... other parameters
  }) => RowWidget(
    decorationCallback: myAppDecorationCallback,
    title: (theme) => Text(
      title,
      style: theme.typography.bodyRegular.copyWith(
        color: theme.myAppColors.primary,
      ),
    ),
    // ... rest of parameters
  );
}
```

## Best Practices

1. **Use specialized widgets** only when needed for specific styling
2. **Start with standard widgets** and customize when necessary
3. **Test custom themes** in both light and dark modes
4. **Keep gradient colors** consistent with iOS guidelines
5. **Use AppIconWidget** for all app icon displays
6. **Provide loading states** for async button actions
7. **Test press feedback** on actual devices
8. **Use CloseButtonWidget** for consistent dismiss UI
9. **Maintain accessibility** with proper contrast ratios
10. **Document custom color schemes** for team consistency

## File Locations

### Neutral Music
- `/lib/src/widgets/neutral_music/neutral_card_widget.dart`
- `/lib/src/widgets/neutral_music/neutral_circular_button_widget.dart`
- `/lib/src/widgets/neutral_music/neutral_pill_button_widget.dart`
- `/lib/src/widgets/neutral_music/neutral_decorations_style.dart`

### App Store
- `/lib/src/widgets/app_store/app_store_pill_button_widget.dart`
- `/lib/src/widgets/app_store/app_store_circular_button_widget.dart`
- `/lib/src/widgets/app_icon_widget.dart`

### Theme Colors
- `/lib/src/theme/colors/neutral_music.dart`
- `/lib/src/theme/colors/neutral_podcast.dart`
- `/lib/src/theme/colors/stocks.dart`
- `/lib/src/theme/colors/weather.dart`
- `/lib/src/theme/colors/app_store.dart`
- `/lib/src/theme/colors/books.dart`
