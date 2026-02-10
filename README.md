# Recursa Branding

A self-improving branding system for the [Recursa framework](https://github.com/dhuree/recursa).

## What This Is

This project manages all brand assets, copy, and visual identity for Recursa using the Recursa framework itself. It's recursive branding—the brand system improves itself through structured feedback loops.

## Structure

```
recursa-branding/
├── system/                 # Core identity
│   ├── SOUL.md            # Brand philosophy & values
│   ├── CONSTITUTION.md    # Inviolable rules
│   ├── IDENTITY.md        # Name, personality, voice
│   ├── STYLE.md           # Visual & verbal standards
│   └── ORIGIN.md          # Bootstrap context
│
├── docs/                   # Operational guides
│   ├── LOOP.md            # Asset creation process
│   ├── METRICS.md         # Success tracking
│   ├── LEARNING.md        # Accumulated knowledge
│   ├── GOALS.md           # Current priorities
│   ├── COPY.md            # Standard copy & descriptions
│   ├── SOCIAL.md          # Social media guidelines
│   └── VISUAL_REVIEW.md   # Visual feedback process
│
├── website/               # Static site for Cloudflare
│   ├── index.html         # Home page
│   ├── docs.html          # Documentation
│   ├── 404.html           # Error page
│   ├── styles/main.css    # Stylesheet
│   ├── scripts/main.js    # Interactions
│   └── assets/            # Logos, favicons
│
├── guardrails/            # Safety & audit
├── memory/                # Working notes
├── deliverables/          # Final assets
│   ├── logos/
│   ├── graphics/
│   ├── copy/
│   └── campaigns/
│
└── run-loop.sh            # Automated iteration runner
```

## Quick Start

### Run the branding loop

```bash
./run-loop.sh      # Run 5 iterations
./run-loop.sh 10   # Run 10 iterations
```

### Deploy the website

Upload the `website/` folder contents to Cloudflare Pages or Workers.

### Create a new asset

1. Check `docs/GOALS.md` for priorities
2. Follow `docs/LOOP.md` process: Define → Create → Review → Ship → Learn
3. Reference `system/STYLE.md` for visual standards
4. Reference `system/IDENTITY.md` for voice/tone
5. Save to appropriate `deliverables/` folder

## Brand Essence

**Recursa**: Systems that learn to improve themselves.

The brand balances:
- Technical precision with warmth
- Bold innovation with philosophical depth
- Playful wit with serious purpose

See `system/SOUL.md` for the full brand philosophy.

## Colors

| Name | Hex | Usage |
|------|-----|-------|
| Recursa Indigo | `#4F46E5` | Primary |
| Deep Navy | `#1E1B4B` | Headings, dark mode |
| Loop Violet | `#7C3AED` | Accents |
| Warm Slate | `#64748B` | Body text |

See `system/STYLE.md` for the complete style guide.

## License

MIT — Same as Recursa itself.
