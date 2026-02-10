# Style Guide

> Visual and verbal standards for Recursa

## Color Palette

### Primary Colors

| Name | Hex | RGB | Usage |
|------|-----|-----|-------|
| **Recursa Indigo** | `#4F46E5` | 79, 70, 229 | Primary brand, CTAs, links |
| **Deep Navy** | `#1E1B4B` | 30, 27, 75 | Headings, dark backgrounds |
| **Clean White** | `#FAFAFA` | 250, 250, 250 | Backgrounds, light mode |

### Secondary Colors

| Name | Hex | RGB | Usage |
|------|-----|-----|-------|
| **Loop Violet** | `#7C3AED` | 124, 58, 237 | Accents, gradients |
| **Warm Slate** | `#64748B` | 100, 116, 139 | Body text, secondary |
| **Soft Gray** | `#E2E8F0` | 226, 232, 240 | Borders, dividers |

### Semantic Colors

| Name | Hex | Usage |
|------|-----|-------|
| **Success** | `#10B981` | Positive states, completions |
| **Warning** | `#F59E0B` | Cautions, in-progress |
| **Error** | `#EF4444` | Errors, critical |
| **Info** | `#3B82F6` | Information, tips |

### Dark Mode

| Light | Dark Equivalent |
|-------|-----------------|
| Clean White `#FAFAFA` | Deep Navy `#1E1B4B` |
| Deep Navy `#1E1B4B` | Clean White `#FAFAFA` |
| Warm Slate `#64748B` | `#94A3B8` (lighter slate) |

## Typography

### Font Stack

```css
/* Primary: Headings and brand text */
font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;

/* Mono: Code and technical content */
font-family: 'JetBrains Mono', 'Fira Code', 'Consolas', monospace;
```

### Type Scale

| Name | Size | Weight | Usage |
|------|------|--------|-------|
| Display | 48-72px | 700 | Hero headlines |
| H1 | 36px | 700 | Page titles |
| H2 | 28px | 600 | Section headers |
| H3 | 22px | 600 | Subsections |
| H4 | 18px | 600 | Minor headers |
| Body | 16px | 400 | Paragraphs |
| Small | 14px | 400 | Captions, meta |
| Code | 14px | 400 | Inline code |

### Text Styling

- **Line height**: 1.6 for body, 1.2 for headings
- **Letter spacing**: -0.02em for headings, normal for body
- **Maximum line width**: 65-75 characters for readability

## Logo

### Primary Logo

The Recursa logo is a stylized loop mark paired with the wordmark.

**Clear space**: Minimum padding equal to the height of the "R" in the wordmark on all sides.

### Logo Variants

| Variant | Use Case |
|---------|----------|
| Full (mark + wordmark) | Primary usage, website header |
| Mark only | Favicon, social avatars, small spaces |
| Wordmark only | Text-heavy contexts where mark is nearby |
| Monochrome | Single-color constraints |

### Logo Don'ts

- Don't stretch or distort
- Don't rotate
- Don't add effects (shadows, glows)
- Don't place on busy backgrounds
- Don't change colors outside palette
- Don't recreate or approximate

## Spacing & Layout

### Spacing Scale

Based on 4px base unit:

| Token | Value | Usage |
|-------|-------|-------|
| `xs` | 4px | Tight inline spacing |
| `sm` | 8px | Related elements |
| `md` | 16px | Standard gaps |
| `lg` | 24px | Section padding |
| `xl` | 32px | Major sections |
| `2xl` | 48px | Page sections |
| `3xl` | 64px | Hero spacing |

### Border Radius

| Token | Value | Usage |
|-------|-------|-------|
| `sm` | 4px | Buttons, inputs |
| `md` | 8px | Cards, containers |
| `lg` | 12px | Modals, large cards |
| `full` | 9999px | Pills, avatars |

## Imagery

### Photography Style

When using photos:
- Prefer authentic over stock
- Natural lighting
- Diverse representation
- Avoid clichéd tech imagery (keyboards, screens, etc.)

### Illustrations

- Abstract, geometric forms
- Loop and recursive motifs
- Clean lines, minimal detail
- Brand colors only
- Vector format preferred

### Icons

- Line style, 2px stroke
- Rounded caps and joins
- 24x24 base size
- Consistent optical weight

## Writing Style

### General Principles

1. **Clear over clever** - Prioritize understanding
2. **Active voice** - "Recursa tracks changes" not "Changes are tracked"
3. **Present tense** - "The system learns" not "The system will learn"
4. **Second person** - "You define your loop" not "Users define their loops"

### Technical Writing

- Use code formatting for `commands`, `file names`, and `code references`
- Explain before showing code
- Provide context for examples
- Include expected outputs where helpful

### Capitalization

| Type | Style |
|------|-------|
| Headlines | Sentence case |
| Navigation | Sentence case |
| Buttons | Sentence case |
| Feature names | Lowercase (except Recursa) |

### Punctuation

- Oxford comma: Yes
- Periods in lists: Only for complete sentences
- Exclamation marks: Sparingly, for genuine enthusiasm only
