# Research and Writing Workflow - Terminal Renaissance Project

*This document outlines the improved research and writing process that integrates the Discovery System and prioritizes simple, effective information capture.*

---

## Overview

This workflow balances two goals:
1. Capturing information needed for immediate writing tasks
2. Preserving tangential discoveries for future research

The system uses simple text files and basic bash commands - no complex code or folder structures needed.

---

## Research Session Workflow

### 1. Session Setup (2 minutes)
```bash
# Create new research summary file
cp RESEARCH-SUMMARY-TEMPLATE.md RESEARCH-SUMMARY-$(date +%Y%m%d).md
```

### 2. Active Research Phase (30-45 minute blocks)
- Read source materials thoroughly
- Take notes directly in your research summary file
- Focus on information relevant to current writing task
- After each block: **Pause for Discovery Check**

### 3. Discovery Check Protocol (2 minutes per discovery)
Ask yourself: "What interesting things did I find that aren't directly relevant?"

For each tangential discovery:
1. Rate relevance to current task (0-10 scale)
2. If score <7, quickly note:
   - What is it?
   - Why is it interesting?
   - Which discovery file should it go in?
3. Add to "Discoveries Logged" section of your summary

### 4. Session Wrap-up (5-10 minutes)
- Review and clean up session notes
- Add key findings to ACCUMULATED-KNOWLEDGE.md
- Process logged discoveries:

```bash
# Example: Adding a discovery about font history
echo "## Historical Font Pricing - $(date)" >> future-research-ideas.md
echo "Discovery: Early terminal fonts were licensed for $1000s per site" >> future-research-ideas.md
echo "Significance: Shows how font IP shaped terminal evolution" >> future-research-ideas.md
echo "" >> future-research-ideas.md
```

### 5. Weekly Review (Fridays, 30 minutes)
- Review all research summaries from the week
- Consolidate discoveries across sessions
- Update ACCUMULATED-KNOWLEDGE.md with major findings
- Plan next week's research priorities

---

## File Management

### Active Files
1. **RESEARCH-SUMMARY-[DATE].md** - Daily session notes
2. **ACCUMULATED-KNOWLEDGE.md** - Growing knowledge base
3. **Discovery System Files** - Tangential findings

### Simple Bash Commands for File Management
```bash
# List recent research summaries
ls -la RESEARCH-SUMMARY-*.md | tail -10

# Search for a concept across all summaries
grep -i "ascii" RESEARCH-SUMMARY-*.md

# Count discoveries logged this week
grep -c "Discoveries Logged" RESEARCH-SUMMARY-*.md

# Combine multiple summaries for review
cat RESEARCH-SUMMARY-2025*.md > weekly-review.md
```

---

## Discovery System Integration

### When to Log a Discovery
- You find something fascinating but off-topic
- You notice a pattern worth investigating later
- You discover a resource needing preservation
- You identify a cross-disciplinary connection

### Where to Log Discoveries
- **future-research-ideas.md** - New research projects
- **terminal-preservation-tracking.md** - Software/hardware needing preservation
- **tangential-themes.md** - Interesting patterns and connections
- **research-rabbit-holes.md** - Deep dives avoided during current work

### How to Log Discoveries (No Code Required)
Use simple echo commands or manually edit during review:
```bash
# Quick discovery logging
echo "$(date): Found reference to lost DEC terminal manual - check archive.org" >> terminal-preservation-tracking.md
```

---

## Information Extraction Guidelines

### What to Extract
✅ **DO Extract:**
- Direct quotes that perfectly explain concepts
- Specific dates, names, technical specifications
- Compelling stories or anecdotes
- Surprising facts or counterintuitive findings
- Clear technical explanations

❌ **DON'T Extract:**
- General background information
- Information easily found again
- Entire sections "just in case"
- Redundant explanations of same concept

### How to Reference
Keep references simple and findable:
```
"The 7-bit decision saved memory but limited international use"
Source: ASCII-History.pdf:page42
```

---

## Writing Preparation

### Before Writing a Section
1. Review relevant parts of ACCUMULATED-KNOWLEDGE.md
2. Gather related research summaries
3. Create simple outline with key points
4. Identify which quotes/facts you'll actually use

### During Writing
- Keep research summaries open for reference
- Add new discoveries to session summary as you write
- Mark used quotes in your summaries to avoid repetition

---

## Quality Checks

### End of Each Session
- [ ] Main findings clearly summarized?
- [ ] Sources properly noted?
- [ ] Discoveries logged (if any)?
- [ ] Key items added to accumulated knowledge?

### Weekly Review
- [ ] All sessions have summaries?
- [ ] Discoveries processed and filed?
- [ ] Accumulated knowledge updated?
- [ ] Next week's priorities identified?

---

## Common Pitfalls to Avoid

1. **Over-organizing**: Don't create elaborate filing systems
2. **Over-extracting**: Only save what you'll actually use
3. **Under-discovering**: Don't lose interesting tangents
4. **Complex solutions**: Use bash commands, not custom scripts
5. **Delayed processing**: Process discoveries same day

---

## Success Metrics

You're using the system well if:
- You can find information quickly when writing
- Interesting tangents are preserved, not lost
- Research builds systematically over time
- Other team members can understand your notes
- You spend more time researching than organizing

---

*Remember: The goal is to support writing, not create a perfect archive. Keep it simple, keep it useful.*