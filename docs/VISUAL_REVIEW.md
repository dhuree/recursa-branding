# Visual Review Process

> How to review visual content and website assets in the Recursa branding loop

## Overview

The branding system uses AI vision capabilities to review rendered visual assets. This creates a feedback loop for design quality.

## Methods

### 1. Screenshot Review (Recommended for Web)

Use a headless browser to capture screenshots, then review with vision:

```bash
# Capture screenshot of local dev server
npx playwright screenshot http://localhost:3000 screenshot.png

# Or use Chrome headless
google-chrome --headless --screenshot=screenshot.png http://localhost:3000
```

The loop runner can then read the screenshot and evaluate against STYLE.md criteria.

### 2. Direct File Review

For SVG, PNG, and other image assets, Claude can directly view files:

```
Read and review the logo at assets/exported/logo-v2.png
Evaluate against STYLE.md color palette and spacing guidelines.
```

### 3. Side-by-Side Comparison

For iterative refinement:

```
Compare these two versions:
1. assets/exported/logo-v1.png
2. assets/exported/logo-v2.png

Which better aligns with SOUL.md brand pillars?
```

## Review Criteria

When reviewing visual assets, evaluate against:

### From STYLE.md
- [ ] Colors match approved palette
- [ ] Typography uses approved fonts
- [ ] Spacing follows the scale
- [ ] Border radius is consistent

### From SOUL.md
- [ ] Embodies recursive elegance
- [ ] Feels technically precise yet warm
- [ ] Conveys philosophical depth
- [ ] Has appropriate wit/playfulness

### From CONSTITUTION.md
- [ ] Meets WCAG AA contrast
- [ ] Logo clear space maintained
- [ ] No forbidden elements

## Website Review Checklist

For each page, capture and evaluate:

1. **Desktop view** (1440px width)
   - Layout and spacing
   - Typography hierarchy
   - Color usage

2. **Mobile view** (375px width)
   - Responsive behavior
   - Touch targets
   - Readability

3. **Dark mode** (if applicable)
   - Contrast
   - Color adjustments

## Integration with Loop

### In run-loop.sh

The loop prompt can include:

```
After creating web assets:
1. Start a local server: python -m http.server 8080
2. Capture screenshots at key breakpoints
3. Read screenshots and evaluate against STYLE.md
4. Document findings in journal/reflections/
```

### Automated Screenshot Script

```bash
#!/bin/bash
# tools/capture-screenshots.sh

URL=${1:-"http://localhost:8080"}
OUT_DIR="memory/screenshots"
mkdir -p "$OUT_DIR"

# Capture at different widths
for width in 375 768 1024 1440; do
    npx playwright screenshot \
        --viewport-size="${width},900" \
        "$URL" \
        "$OUT_DIR/page-${width}px.png"
done

echo "Screenshots saved to $OUT_DIR"
```

## Feedback Format

When reviewing, use this structure:

```markdown
## Visual Review: [Asset Name]

**Date**: YYYY-MM-DD
**Version**: v1.0

### Style Alignment
- Colors: [Pass/Fail] - Notes
- Typography: [Pass/Fail] - Notes
- Spacing: [Pass/Fail] - Notes

### Brand Alignment
- Recursive elegance: [1-5] - Notes
- Technical precision: [1-5] - Notes
- Warmth: [1-5] - Notes

### Issues Found
1. [Issue description]
2. [Issue description]

### Recommendations
1. [Specific action]
2. [Specific action]

### Overall Score: [1-5]
```

## Storing Reviews

Save visual reviews to:
- `journal/reflections/visual-review-YYYY-MM-DD.md` - Individual reviews
- `docs/LEARNING.md` - Patterns and insights
- `journal/metrics/` - Scores for tracking over time
