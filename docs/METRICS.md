# Metrics

> How we measure Recursa brand success

## Primary Metrics

### 1. Brand Consistency Score

**What**: How well our assets align with brand guidelines

**How to measure**:
- Audit assets against STYLE.md checklist
- Score each asset 0-100%
- Track average over time

**Target**: 95%+ consistency across all active assets

| Score | Rating |
|-------|--------|
| 95-100% | Excellent |
| 85-94% | Good |
| 70-84% | Needs attention |
| <70% | Critical |

### 2. Recognition Metrics

**What**: How well people know and recall the Recursa brand

**How to measure**:
- GitHub stars growth rate
- Organic search volume for "Recursa"
- Brand mentions (social, blogs, forums)
- Direct traffic to website

**Tracking**:
```
| Month | Stars | Search Vol | Mentions | Direct Traffic |
|-------|-------|------------|----------|----------------|
| ...   | ...   | ...        | ...      | ...            |
```

### 3. Engagement Metrics

**What**: How people interact with our brand content

**Channels**:
- **GitHub**: Stars, forks, issues, discussions
- **Social**: Likes, shares, comments, saves
- **Website**: Time on page, scroll depth, return visits
- **Content**: Doc page views, tutorial completions

**Key ratios**:
- Engagement rate = (interactions / impressions) × 100
- Share rate = (shares / views) × 100
- Return rate = (return visitors / total visitors) × 100

### 4. Conversion Metrics

**What**: Actions that indicate adoption

**Funnel stages**:
1. **Awareness**: First visit, social impression
2. **Interest**: Doc page view, GitHub visit
3. **Consideration**: README read, star
4. **Action**: Clone, fork, first commit
5. **Adoption**: Ongoing usage, contribution

**Track**:
- Conversion rate between each stage
- Time from awareness to action
- Drop-off points

## Secondary Metrics

### Asset Production

| Metric | Target |
|--------|--------|
| Assets created per month | Track velocity |
| Asset update frequency | Keep fresh |
| Asset coverage | All channels covered |

### Quality Indicators

- Revision cycles per asset (lower = better process)
- Time from request to delivery
- Stakeholder satisfaction ratings

### Community Indicators

- Community contributions to brand (user-created assets)
- Brand ambassador count
- Positive sentiment ratio in mentions

## Reporting Cadence

| Report | Frequency | Contents |
|--------|-----------|----------|
| Asset log | Per iteration | What was created, learnings |
| Weekly pulse | Weekly | Key metrics snapshot |
| Monthly review | Monthly | Trends, analysis, actions |
| Quarterly deep-dive | Quarterly | Full audit, strategy review |

## Metric Storage

### Per-Iteration Tracking

After each asset creation, log to `journal/metrics/`:

```yaml
# journal/metrics/2024-01-15-logo-variant.yaml
date: 2024-01-15
asset: Logo dark mode variant
type: visual
consistency_score: 98
time_to_create: 2h
revision_cycles: 1
notes: "Clean execution, reusable process"
```

### Aggregate Tracking

Monthly summary in `journal/metrics/monthly/`:

```yaml
# journal/metrics/monthly/2024-01.yaml
month: 2024-01
assets_created: 12
average_consistency: 96
github_stars: 450 → 620
website_visits: 2,340
social_followers: 180
notable: "Launch month, strong initial traction"
```

## Using Metrics

### For Prioritization

High-impact areas (low score + high visibility) get priority.

### For Learning

Patterns in metrics feed back into LEARNING.md:
- What content types drive most engagement?
- Which channels have best conversion?
- Where do we lose people?

### For Evolution

Significant metric changes trigger EVOLUTION.md reviews:
- Sudden drops = investigate
- Unexpected spikes = understand and replicate
- Plateaus = time for experimentation
