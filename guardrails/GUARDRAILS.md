# Guardrails

> Safety infrastructure for Recursa branding

## Purpose

This document defines the safety rails that protect brand integrity. While CONSTITUTION.md defines what we must never do, this document describes the systems that enforce those rules.

## Pre-Publication Checklist

Before any brand asset goes live, verify:

### Visual Assets

- [ ] Colors match approved palette (see STYLE.md)
- [ ] Typography uses approved fonts
- [ ] Logo usage follows guidelines
- [ ] Meets accessibility standards (WCAG AA contrast)
- [ ] Works in both light and dark modes
- [ ] Alt text provided for all images

### Copy Assets

- [ ] Voice matches IDENTITY.md
- [ ] No forbidden phrases (see CONSTITUTION.md)
- [ ] Technical claims are accurate
- [ ] No unsubstantiated promises
- [ ] Appropriate for target platform

### Web Assets

- [ ] Mobile responsive
- [ ] Loads within performance budget
- [ ] No broken links
- [ ] SEO meta tags present
- [ ] Analytics configured

## Approval Workflows

| Asset Type | Self-Approve OK | Requires Review |
|------------|-----------------|-----------------|
| Social post | Yes, if follows templates | New messaging angles |
| Blog post | No | Always |
| Logo usage | No | Always |
| Website changes | Minor copy fixes | Design or structural |
| Documentation | Yes | Messaging changes |

## Audit Trail

All significant brand decisions are logged in `guardrails/audit/action_log.jsonl`.

### Log Format

```json
{
  "timestamp": "2024-01-15T10:30:00Z",
  "action": "created",
  "asset_type": "social_post",
  "asset_id": "twitter-launch-2024-01",
  "description": "Launch announcement tweet",
  "approved_by": "self",
  "notes": "Followed standard announcement template"
}
```

### Actions to Log

- Asset creation
- Asset modification
- Asset deletion
- Style guide changes
- Exception requests
- Review decisions

## Exception Process

When a valid business reason requires deviating from guidelines:

1. **Document the request** - What exception is needed and why?
2. **Check alternatives** - Can we achieve the goal within guidelines?
3. **Assess risk** - What's the potential brand impact?
4. **Get approval** - One-off exceptions need documented approval
5. **Log the decision** - Record in audit trail
6. **Review later** - Does this exception suggest a guideline update?

## Incident Response

If a brand inconsistency or error is published:

### Severity Levels

| Level | Definition | Response Time |
|-------|------------|---------------|
| Critical | Contradicts CONSTITUTION.md | Immediate |
| High | Major style/voice violation | Same day |
| Medium | Minor inconsistency | Within 3 days |
| Low | Nitpick or edge case | Next review cycle |

### Response Steps

1. **Assess** - What went wrong and how bad is it?
2. **Contain** - Can we fix/remove the asset?
3. **Correct** - Deploy the fix
4. **Communicate** - If public, acknowledge as needed
5. **Learn** - Add to LEARNING.md
6. **Prevent** - Update process to prevent recurrence

## Periodic Reviews

| Review | Frequency | Scope |
|--------|-----------|-------|
| Asset audit | Monthly | Check all live assets against guidelines |
| Guideline review | Quarterly | Evaluate if guidelines need updates |
| Voice calibration | Quarterly | Review recent copy for drift |
| Metrics review | Monthly | Check brand health metrics |
