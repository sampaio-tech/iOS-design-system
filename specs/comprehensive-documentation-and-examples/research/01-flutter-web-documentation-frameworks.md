# Flutter Web Documentation Frameworks

## Overview

Research on frameworks and tools for building interactive Flutter documentation websites that can be hosted on GitHub Pages.

## Key Findings

### Flutter Widget Previewer (Official)

- **Status**: Experimental feature integrated with VS Code and IntelliJ IDEs
- **Capability**: Renders widgets in the IDE browser for component validation in isolation
- **Flutter Version**: Introduced in Flutter 3.35
- **Future Potential**: AI agents can see rendered widgets and interact with them
- **Limitation**: Primarily an IDE feature, not a standalone documentation solution

**Sources:**
- [My take on Flutter in 2026](https://tomasrepcik.dev/blog/2025/2025-12-14-flutter-2026/)
- [Top 8 Best Flutter UI Libraries for 2026](https://www.f22labs.com/blogs/top-8-flutter-ui-libraries-for-2025-you-must-explore/)

### Widgetbook (Most Popular Option)

- **Description**: Open-source sandbox for building widgets in isolation (Flutter's Storybook equivalent)
- **Adoption**: Used by 2000+ teams worldwide
- **Key Features**:
  - Catalogue widgets and create widget libraries
  - Test on different devices, themes, and text scales
  - Share with teams (Developers, Designers, PMs, Clients) without code
  - Zero-configuration golden tests (visual regression tests)
  - Build UI components without data/API/business logic dependencies
  - Hard-to-reach states and edge cases testing

**Commercial Offering**: Widgetbook Cloud for team collaboration and hosting

**Sources:**
- [Widgetbook GitHub](https://github.com/widgetbook/widgetbook)
- [Widgetbook Package](https://pub.dev/packages/widgetbook)
- [Widgetbook Official Site](https://www.widgetbook.io/storybook-for-flutter)
- [Widgetbook — The Storybook for Flutter](https://medium.com/flutter-community/widgetbook-the-storybook-for-flutter-7d27c26c0420)

### storybook_flutter (Alternative)

- **Description**: Live preview of isolated widgets
- **Status**: Less actively developed compared to Widgetbook
- **Use Case**: Faster development and widget showcase

**Source:**
- [storybook_flutter Package](https://pub.dev/packages/storybook_flutter)

### Custom Flutter Web Application

- **Approach**: Build a custom Flutter web app that serves as documentation
- **Advantages**:
  - Complete control over UX/UI
  - Native Flutter widgets (no iframe embedding needed)
  - Can include live, interactive examples
  - Theme switching built-in
- **Challenges**:
  - More development effort
  - Need to build documentation infrastructure
  - Performance optimization for web

### Flutter Design System Examples

Several real-world examples exist:

1. **OUDS Flutter** (Orange Unified Design System)
   - Provides components with demo application
   - Online technical documentation
   - **Source**: [OUDS Flutter GitHub](https://github.com/Orange-OpenSource/ouds-flutter)

2. **flutter_design_system**
   - Storybook-inspired tool
   - Build UI components faster in isolation
   - Developer and designer documentation in one place
   - **Source**: [flutter_design_system GitHub](https://github.com/Calpoog/flutter_design_system)

## Flutter Web Performance (2026)

- **WebAssembly**: WebAssembly GC 3.0 with 64-bit WASM support ready
- **Hot Reload**: Graduated from experimental to default (Q3 2025)
- **Performance**: Chrome dev experience as fast as mobile emulators
- **Implication**: Flutter web is production-ready for documentation sites

**Source:**
- [2025: The Year Flutter Met the AI Singularity](https://somniosoftware.com/blog/2025-the-year-flutter-met-the-ai-singularity---a-complete-tech-wrap-up)

## Recommendations

### Option 1: Widgetbook + Custom Website (Hybrid)
- Use Widgetbook for component development and testing
- Build custom Flutter web documentation site
- Embed Widgetbook components or replicate them in docs
- **Pros**: Best of both worlds, proven tool + custom UX
- **Cons**: More complex setup

### Option 2: Custom Flutter Web Documentation App
- Build from scratch using Flutter web
- Full control over interactive previews
- Theme switching, state management built-in
- **Pros**: Complete customization, native Flutter experience
- **Cons**: Higher development effort

### Option 3: Widgetbook Cloud Hosted
- Use Widgetbook's hosted solution
- Quick setup and deployment
- **Pros**: Fastest to implement
- **Cons**: Limited customization, may require paid plan, external dependency

## Decision Factors

Given requirements:
- Interactive web-based previews like Primer
- Light/dark theme variations
- GitHub Pages hosting
- 10-minute setup goal for users

**Recommended Approach**: Custom Flutter Web App with Widgetbook-inspired architecture
- Build a custom Flutter web documentation site
- Use patterns from Widgetbook for component isolation
- Deploy to GitHub Pages
- Provides the Primer-like experience requested
