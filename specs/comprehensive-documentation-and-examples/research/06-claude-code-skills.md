# Claude Code Skills Creation

## Overview

Research on creating Claude Code skills to provide interactive guidance for using the iOS Design System widgets, theme, colors, typography, and other features.

## What are Claude Code Skills?

Skills are markdown-based guides that teach Claude Code how to handle specific tasks. Unlike slash commands, skills are invoked via natural language, so Claude decides when to use them based on user requests.

**Sources:**
- [Extend Claude with skills - Claude Code Docs](https://code.claude.com/docs/en/skills)
- [Claude Skills - Standard Operating Procedures for Agents](https://lilys.ai/en/notes/claude-skills-20251020/claude-skills-sops-for-agents)

## Skill Structure

### Basic File Structure

Every skill consists of a directory containing:

```
skill-name/
├── SKILL.md              # Core prompt and instructions (required)
├── scripts/              # Executable Python/Bash scripts (optional)
├── references/           # Documentation loaded into context (optional)
└── assets/              # Templates and binary files (optional)
```

**Sources:**
- [Inside Claude Code Skills: Structure, prompts, invocation](https://mikhail.io/2025/10/claude-code-skills/)
- [Claude Agent Skills: A First Principles Deep Dive](https://leehanchung.github.io/blogs/2025/10/26/claude-skills-deep-dive/)

### SKILL.md Format

Every SKILL.md file must contain:

1. **YAML Frontmatter** (between `---` markers)
2. **Markdown Instructions**

#### YAML Frontmatter (Required Fields)

```yaml
---
name: skill-name
description: |
  Focus on capabilities and scenarios, not generic keywords.
  Include action verbs, specific file types, and clear use cases.
  Example: "Guide developers through implementing iOS Design System
  widgets with theme, colors, and typography configuration"
type: anthropic-skill
version: "1.0"
---
```

**Key Points:**
- `name`: Becomes the `/slash-command` (use kebab-case)
- `description`: Helps Claude decide when to load it automatically
  - Be specific and action-oriented
  - Include capabilities, not just keywords
  - Example: Instead of "document processing skill," write "extract tables from PDFs and convert to CSV format"

**Sources:**
- [How to create custom Skills - Claude Help Center](https://support.claude.com/en/articles/12512198-how-to-create-custom-skills)
- [How to create Skills for Claude: steps and examples](https://claude.com/blog/how-to-create-skills-key-steps-limitations-and-examples)

#### Markdown Content Structure

After frontmatter, include these sections:

```markdown
# Skill Name (Title Case)

## Overview
Brief summary of purpose and use cases (1-2 paragraphs)

## Parameters (if applicable)
Configurable inputs for reusability

## Important Notes
Key considerations, constraints, or warnings

## Steps
Detailed instructions with clear numbered steps

## Examples
Concrete usage examples

## Troubleshooting
Common issues and solutions
```

**Source:**
- [sop-structure - Claude Skills](https://claude-plugins.dev/skills/@TheBushidoCollective/han/sop-structure)

### Size Considerations

- **Keep SKILL.md concise**: Under 5,000 words preferred
- **Why**: Prevents overwhelming Claude's context window
- **Use bundled resources**: Detailed docs, scripts, templates in separate files
- **Progressive disclosure**: Claude loads them only when needed

**Source:**
- [Skill authoring best practices - Claude API Docs](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices)

## Additional Resources

### REFERENCE.md

If you have too much information for a single SKILL.md:

```
skill-name/
├── SKILL.md
└── REFERENCE.md         # Supplemental and reference information
```

Reference it in SKILL.md to help Claude decide if it needs to access that resource.

**Source:**
- [How to Build Claude Skills: Lesson Plan Generator Tutorial](https://www.codecademy.com/article/how-to-build-claude-skills)

## Distribution

### For Personal Use
Create a directory in your personal skills folder: `~/.claude/skills/skill-name/`

### For Public Distribution
1. Package your skill folder as a ZIP file
2. Users navigate to Settings > Capabilities
3. Upload the ZIP file

**Sources:**
- [Using Skills in Claude - Claude Help Center](https://support.claude.com/en/articles/12512180-using-skills-in-claude)
- [How to Create Custom Claude Skills: A Complete Step-by-Step Guide](https://developer.tenten.co/how-to-create-custom-claude-skills-a-complete-step-by-step-guide)

## Best Practices

### Description Writing

❌ **Generic**: "A skill for iOS components"

✅ **Specific**: "Guide developers through implementing iOS Design System buttons, navigation bars, and text fields with proper theme configuration and color schemes"

### Instruction Writing

1. **Be explicit**: Clear step-by-step instructions
2. **Use constraints**: "You MUST..." for critical requirements
3. **Provide examples**: Show concrete code snippets
4. **Include context**: Explain why, not just how
5. **Handle edge cases**: Address common issues

### File Organization

- Use kebab-case for filenames: `ios-button-widget.md`
- Use Title Case for headings: "iOS Button Widget"
- Group related skills in subdirectories if needed

**Source:**
- [The Complete Guide to Building Skills for Claude](https://resources.anthropic.com/hubfs/The-Complete-Guide-to-Building-Skill-for-Claude.pdf?hsLang=en)

## Skills Needed for iOS Design System

Based on requirements, create skills for:

### 1. Theme Configuration Skill

```yaml
---
name: ios-theme-setup
description: |
  Guide developers through setting up iOS Design System theme,
  including light/dark mode configuration, IosAnimatedTheme usage,
  and theme customization.
type: anthropic-skill
version: "1.0"
---
```

**Content should cover:**
- Installing the package
- Setting up `IosAnimatedTheme`
- Configuring `IosLightThemeData` and `IosDarkThemeData`
- Accessing theme in widgets with `IosTheme.of(context)`
- Creating custom themes
- Common troubleshooting

### 2. Color System Skill

```yaml
---
name: ios-colors-guide
description: |
  Help developers understand and use the iOS Design System color system,
  including system colors, accessible colors, semantic colors, and
  theme-specific colors across light and dark modes.
type: anthropic-skill
version: "1.0"
---
```

**Content should cover:**
- Available color palettes (default, accessible, system, weather, stocks, etc.)
- Accessing colors from theme
- Semantic color usage (when to use which color)
- Accessibility considerations
- Creating custom color schemes
- Examples for each palette

### 3. Typography Skill

```yaml
---
name: ios-typography-guide
description: |
  Guide developers on using iOS Design System typography including
  SF Pro font weights, text styles, responsive text, and custom
  font configuration.
type: anthropic-skill
version: "1.0"
---
```

**Content should cover:**
- Available font weights (regular, medium, semibold, bold)
- Typography hierarchy and text styles
- Accessing typography from theme
- Responsive text scaling
- Custom font configuration
- Accessibility best practices

### 4. Widget Usage Skills

Create individual skills for complex widgets:

#### Button Widget Skill
```yaml
---
name: ios-button-widget
description: |
  Guide for using ButtonWidget with different sizes, colors, icons,
  and states including LargeButtonSize, MediumButtonSize,
  BlueButtonColor, GreyTransparentButtonColor, and more.
type: anthropic-skill
version: "1.0"
---
```

#### Navigation Bar Skill
```yaml
---
name: ios-navigation-bar
description: |
  Help implement CupertinoNavigatorBarWidget with proper title,
  leading/trailing widgets, image filters, and navigation patterns.
type: anthropic-skill
version: "1.0"
---
```

#### Modal Sheet Skill
```yaml
---
name: ios-modal-sheet
description: |
  Guide for showing modal sheets using ModalSheetWidget and
  CupertinoSheetWidget with titles, prompts, search fields, and
  custom content.
type: anthropic-skill
version: "1.0"
---
```

#### Text Field Skill
```yaml
---
name: ios-text-fields
description: |
  Guide for implementing CupertinoTextFieldWidget and
  CupertinoSearchTextFieldWidget with custom colors, cursor,
  selection, and placeholder configuration.
type: anthropic-skill
version: "1.0"
---
```

#### Grouped Table Skill
```yaml
---
name: ios-grouped-table
description: |
  Help create grouped tables with GroupedTableWidget including rows,
  titles, descriptions, dividers, and custom decorations.
type: anthropic-skill
version: "1.0"
---
```

### 5. Migration Skill

```yaml
---
name: ios-cupertino-migration
description: |
  Guide developers through migrating from Flutter's Cupertino widgets
  to iOS Design System, explaining differences, benefits, and
  step-by-step conversion process.
type: anthropic-skill
version: "1.0"
---
```

**Content should cover:**
- Comparison table (Cupertino vs iOS Design System)
- Migration checklist
- Component mapping
- Breaking changes to watch for
- Code examples for common migrations

### 6. Quick Start Skill

```yaml
---
name: ios-quick-start
description: |
  10-minute quick start guide for setting up iOS Design System in a
  new Flutter project, including installation, basic configuration,
  and first component implementation.
type: anthropic-skill
version: "1.0"
---
```

**Content should cover:**
- Package installation
- Minimal setup code
- First component example
- Verification steps
- Next steps

## Implementation Checklist

For each skill:

- [ ] Create skill directory with clear name
- [ ] Write YAML frontmatter with specific description
- [ ] Structure content with clear sections
- [ ] Include code examples for every major point
- [ ] Add troubleshooting section
- [ ] Keep SKILL.md under 5,000 words
- [ ] Add REFERENCE.md for detailed API docs if needed
- [ ] Include visual examples where applicable
- [ ] Test skill with Claude Code
- [ ] Document edge cases and limitations

## Distribution Strategy

### Phase 1: Core Skills
1. `ios-quick-start` - Essential for 10-minute setup goal
2. `ios-theme-setup` - Foundation requirement
3. `ios-colors-guide` - Foundation requirement
4. `ios-typography-guide` - Foundation requirement

### Phase 2: Common Widgets
5. `ios-button-widget`
6. `ios-text-fields`
7. `ios-navigation-bar`

### Phase 3: Advanced Widgets
8. `ios-modal-sheet`
9. `ios-grouped-table`
10. Additional widgets as needed

### Phase 4: Migration & Patterns
11. `ios-cupertino-migration`
12. Common patterns and recipes

## Integration with Documentation

Skills complement the web documentation:

- **Skills**: Interactive, conversational guidance while coding
- **Web Docs**: Reference, browsing, visual previews
- **API Docs (dartdoc)**: Complete API reference

All three work together for comprehensive documentation experience.

## Conclusion

Claude Code skills provide an interactive way for developers to learn and implement the iOS Design System. By creating well-structured skills with clear descriptions and examples, we enable developers to get help directly in their coding environment without context-switching to web documentation.

**Key Resources:**
- [GitHub - anthropics/skills: Public repository for Agent Skills](https://github.com/anthropics/skills)
- [GitHub - travisvn/awesome-claude-skills](https://github.com/travisvn/awesome-claude-skills)
- [Claude Skills: Custom Modules That Extend Claude - DataCamp](https://www.datacamp.com/tutorial/claude-skills)
