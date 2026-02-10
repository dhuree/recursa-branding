# Loop

> The core iteration cycle for creating Recursa brand assets

## Iteration Unit

**One brand asset** - each cycle produces a complete, usable brand deliverable.

## Asset Types

| Type | Examples | Typical Time |
|------|----------|--------------|
| Visual | Logo variant, icon, illustration, social graphic | 1-4 hours |
| Copy | Tagline, description, bio, tweet thread | 30 min - 2 hours |
| Template | Email template, social post template, slide | 1-2 hours |
| Document | Style guide section, brand guideline | 2-4 hours |
| Web | Page, component, animation | 2-8 hours |

## The Creation Loop

```
┌─────────────────────────────────────────────────┐
│                                                 │
│   1. DEFINE → 2. CREATE → 3. REVIEW → 4. SHIP  │
│        ↑                                   │    │
│        └───────── 5. LEARN ←───────────────┘    │
│                                                 │
└─────────────────────────────────────────────────┘
```

### Phase 1: Define

Before creating anything, answer:

- [ ] **What** specific asset are we creating?
- [ ] **Why** is this asset needed right now?
- [ ] **Where** will it be used?
- [ ] **Who** is the primary audience?
- [ ] **How** does it relate to existing assets?

**Output**: Clear brief in `tasks/` directory

### Phase 2: Create

Execute the creation with brand guidelines in mind:

- [ ] Reference `system/STYLE.md` for visual standards
- [ ] Reference `system/IDENTITY.md` for voice/tone
- [ ] Check `docs/LEARNING.md` for relevant past learnings
- [ ] Use existing assets from `assets/` as foundations
- [ ] Save work-in-progress to `memory/scratchpad.md`

**Output**: Draft asset ready for review

### Phase 3: Review

Evaluate against brand standards:

- [ ] Does it align with SOUL.md principles?
- [ ] Does it pass CONSTITUTION.md requirements?
- [ ] Does it match STYLE.md specifications?
- [ ] Is it consistent with existing assets?
- [ ] Does it serve its stated purpose?

**Review Checklist by Type**:

**For Visual Assets:**
- [ ] Colors from approved palette only
- [ ] Typography matches type system
- [ ] Clear space maintained (if logo present)
- [ ] Works in light and dark modes
- [ ] Accessible (contrast, alt text)

**For Copy:**
- [ ] Voice matches IDENTITY.md
- [ ] Accurate technical claims
- [ ] No forbidden phrases (see CONSTITUTION.md)
- [ ] Appropriate length for context
- [ ] Clear call to action (if applicable)

**Output**: Approved asset or revision notes

### Phase 4: Ship

Deliver the asset to its destination:

- [ ] Export in required formats
- [ ] Save source files to `assets/source/`
- [ ] Save exported files to `assets/exported/` or `deliverables/`
- [ ] Update any indexes or catalogs
- [ ] Deploy to production (if web asset)
- [ ] Announce if appropriate

**Output**: Live, accessible asset

### Phase 5: Learn

Capture what this iteration taught us:

- [ ] What worked well?
- [ ] What was harder than expected?
- [ ] What would we do differently?
- [ ] Did we discover any new patterns?
- [ ] Should any guidelines be updated?

**Output**: Entry in `journal/reflections/` and updates to `docs/LEARNING.md`

## Quick Reference: Minimum Viable Loop

For rapid iterations, at minimum:

1. **Define**: What + Why (2 sentences)
2. **Create**: Make the thing
3. **Review**: Check against SOUL.md + STYLE.md
4. **Ship**: Save + deploy
5. **Learn**: One sentence on what we learned

## Triggers for Loop Start

- New asset request
- Asset update needed
- Gap in brand coverage identified
- Opportunity to improve existing asset
- New platform/channel to support

## When to Skip the Loop

Don't use this full process for:
- Minor typo fixes
- Format conversions
- Direct copies to new locations
- Emergency fixes (document learnings after)
