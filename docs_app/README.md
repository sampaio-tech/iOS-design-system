# iOS Design System - Documentation Website

This is the Flutter web application that hosts the interactive documentation for the iOS Design System package.

## Project Structure

```
docs_app/
├── lib/
│   ├── main.dart              # Application entry point
│   ├── app.dart               # Root app widget (to be created)
│   ├── core/                  # Core functionality
│   │   ├── theme/            # Theme management and providers
│   │   ├── routing/          # Navigation and routing configuration
│   │   └── services/         # Services (search, etc.)
│   ├── shared/               # Shared components
│   │   ├── components/       # Reusable UI components
│   │   └── widgets/          # Reusable widgets
│   ├── pages/                # Page components
│   │   ├── home/             # Homepage
│   │   ├── getting_started/  # Getting started guides
│   │   ├── foundation/       # Foundation docs (theme, colors, typography)
│   │   ├── components/       # Component documentation pages
│   │   └── patterns/         # Pattern and migration guides
│   └── data/                 # Data layer
│       ├── models/           # Data models
│       └── content/          # Static content and navigation structure
├── web/                      # Web-specific files
│   └── index.html            # Configured for GitHub Pages
└── test/                     # Tests
```

## Development

### Prerequisites
- Flutter SDK >=3.7.0
- iOS Design System package (parent directory)

### Setup
```bash
flutter pub get
```

### Run Locally
```bash
flutter run -d chrome
```

### Build for Production
```bash
flutter build web --release
```

The built files will be in `build/web/` and are ready for deployment to GitHub Pages.

## Features (To Be Implemented)

- Interactive component previews with light/dark theme toggle
- Searchable documentation
- Progressive code examples
- Responsive design
- Foundation documentation (theme, colors, typography)
- Component pages for all widgets
- Patterns and migration guides

## Deployment

This documentation site will be automatically deployed to GitHub Pages via GitHub Actions when changes are pushed to the main branch.
