import 'dart:ui';

import 'package:flutter/material.dart';

const kCupertinoButtonPressedOpacity = 0.8;
const kCupertinoButtonBorderRadius = BorderRadius.all(Radius.circular(6));
const kCupertinoButtonPadding = EdgeInsets.all(0);
const kAnimationOutDuration = Duration(milliseconds: 120);
const kAnimationInDuration = Duration(milliseconds: 180);
const kMinimumSafeAreaPadding = EdgeInsets.only(bottom: 34);
final kImageFilterBlur = ImageFilter.blur(sigmaY: 10, sigmaX: 10);
const Duration kThemeAnimationDuration = kAnimationInDuration;
const kMarkdownExample = r'''
```markdown
# Complex Markdown Document for Testing

This document is designed to **challenge** your `gpt_markdown` package by incorporating a wide variety of Markdown components including headers, lists, tables, code blocks, blockquotes, footnotes, and LaTeX math expressions.

---

## Table of Contents
1. [Headers and Emphasis](#headers-and-emphasis)
2. [Lists](#lists)
3. [Code Blocks and Inline Code](#code-blocks-and-inline-code)
4. [Tables](#tables)
5. [Blockquotes and Nested Elements](#blockquotes-and-nested-elements)
6. [Mathematical Expressions](#mathematical-expressions)
7. [Links and Images](#links-and-images)
8. [Footnotes](#footnotes)
9. [Horizontal Rules and Miscellaneous](#horizontal-rules-and-miscellaneous)

---

## Headers and Emphasis

### Header Levels
Markdown supports multiple header levels:
- `# Header 1`
- `## Header 2`
- `### Header 3`
- `#### Header 4`
- `##### Header 5`
- `###### Header 6`

### Emphasis Examples
- *Italicized text* using single asterisks or underscores.
- **Bold text** using double asterisks or underscores.
- ***Bold and italic*** by combining them.
- ~~Strikethrough~~ text using two tildes.

---

## Lists

### Unordered List
- Item 1
  - Nested Item 1.1
  - Nested Item 1.2
    - Deeply Nested Item 1.2.1
- Item 2
  - [ ] Task not completed
  - [x] Task completed

### Ordered List
1. First item
2. Second item with nested list:
   1. Subitem 2.1
   2. Subitem 2.2
3. Third item

### Mixed List Example
- **Fruits**
  1. Apple
  2. Banana
  3. Cherry
- **Vegetables**
  - Carrot
  - Lettuce
  - Spinach

---

## Code Blocks and Inline Code

### Inline Code
Here is an example of inline code: `print("Hello, world!")`.

### Fenced Code Block (Python)
```python
def greet(name):
    """
    Greets a person with the provided name.
    """
    print(f"Hello, {name}!")

greet("Alice")
```

### Fenced Code Block (JavaScript)
```javascript
function greet(name) {
    console.log(`Hello, ${name}!`);
}
greet("Bob");
```

---

## 1. Tables

Here is a table demonstrating various elements:

| Syntax      | Description                              | Example                           |
| ----------- | ---------------------------------------- | --------------------------------- |
| Header      | Title                                    | **Bold Header**                   |
| Paragraph   | Text with *italic* and **bold** elements | This is a sample paragraph.       |
| Inline Code | `code snippet`                           | `let x = 10;`                     |

Additional table with alignment:

| Left Align | Center Align | Right Align |
| :--------- |:------------:| ----------:|
| Row 1      | Row 1        | Row 1      |
| Row 2      | Row 2        | Row 2      |

---

## Blockquotes and Nested Elements

> **Blockquote Header**
> 
> This is a blockquote. You can include **bold** and *italic* text, as well as `inline code` within blockquotes.
> 
> > ### Nested Blockquote
> > - Nested list item 1
> > - Nested list item 2
> >   1. Numbered subitem 1
> >   2. Numbered subitem 2
> > 
> > ```python
> > # Code snippet inside nested blockquote
> > for i in range(3):
> >     print(i)
> > ```
> 
> Back to the outer blockquote.

---

## Mathematical Expressions

### Inline Math
You can write inline math using the `\( ... \)` syntax. For example, the quadratic formula is given by:
\( x = \frac{-b \pm \sqrt{b^2-4ac}}{2a} \).

### Display Math
Display math can be rendered using the `\[ ... \]` syntax. For example, consider the integral:
\[
\int_{-\infty}^{\infty} e^{-x^2} \, dx = \sqrt{\pi}
\]

More complex display equations:
\[
E = mc^2 \quad \text{and} \quad F = ma
\]

---

## Links and Images

### Links
Here are examples of links:
- [OpenAI](https://www.openai.com)
- [GitHub](https://github.com)

### Images
Inline images can be embedded as follows:
![Alt Text for Image](http://www.si3.ufc.br/shared/img/instituicao/brasao.png)

Images can also be referenced with links:
[![Linked Image](https://via.placeholder.com/100 "Thumbnail")](https://via.placeholder.com/500 "Full Image")

---

## Footnotes

Here is a statement with a footnote.[^1] Another reference can be added here.[^long]

[^1]: This is a simple footnote.
[^long]: This footnote contains a longer explanation to showcase how multiple lines can be formatted in a footnote. It supports Markdown formatting such as **bold** and *italic* text.

---

## Horizontal Rules and Miscellaneous

Horizontal rules can be used to separate sections:

---

### Task List Example
- [x] Write complex Markdown document
- [x] Include LaTeX math expressions
- [ ] Add more Markdown components if needed

### Nested Quotes with Code and Math
> **Example of Nested Components**
> 
> - Inline code: `sum = a + b`
> - Math expression: \( \sum_{i=1}^n i = \frac{n(n+1)}{2} \)
> - More text with **bold** formatting.
> 
> ```javascript
> // JavaScript code example inside a nested blockquote
> const sum = (n) => (n * (n + 1)) / 2;
> console.log(sum(10));
> ```

---

## Conclusion

This document was created to test the robustness of Markdown parsers and to ensure that all components, including advanced LaTeX expressions and nested structures, are rendered correctly. Enjoy testing and feel free to extend it further!
```
''';
