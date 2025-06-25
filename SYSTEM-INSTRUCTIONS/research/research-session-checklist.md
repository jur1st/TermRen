# Discovery System Checklist

*Quick reference for research sessions - keep this handy!*

---

## During Research (Every 30-45 minutes)

### ⏸️ Pause and Ask:
- [ ] What interesting things have I found that aren't directly relevant?
- [ ] Any technical tangents worth exploring later?
- [ ] Any people/systems that need preservation attention?
- [ ] Any cross-disciplinary connections noticed?

### 📊 Rate Each Discovery (0-10 scale)
- **7-10**: Include in current research
- **4-6**: Log to discovery system 
- **0-3**: Note briefly or skip

### ⏱️ 2-Minute Capture per Discovery
1. **What**: Brief description (1-2 sentences)
2. **Why**: Why is this significant?
3. **Where**: Which discovery file?
   - `future-research-ideas.md` → New projects
   - `terminal-preservation-tracking.md` → At-risk software/docs
   - `tangential-themes.md` → Patterns and connections
   - `research-rabbit-holes.md` → Deep dives to avoid now

### 📝 Quick Logging Format
```
## [Discovery Title] - [Date]
What: [1-2 sentence description]
Why: [Significance]
Source: [Where you found it]
Next: [What would be needed to explore this]
```

---

## End of Session (5-10 minutes)

### 🔄 Process Discoveries
- [ ] Review "Discoveries Logged" section
- [ ] Add to appropriate discovery files
- [ ] Update relevance scores if needed
- [ ] Note any that connect to existing discoveries

### 📁 Simple Bash Commands
```bash
# Add discovery to future research
echo "## Grid Computing History - $(date)" >> future-research-ideas.md

# Check what's already logged
grep "##" future-research-ideas.md | tail -10

# See this week's discoveries
grep -A2 "$(date +%Y-%m)" *.md
```

---

## Weekly Review (Fridays)

### 📊 Discovery Assessment
- [ ] Group similar discoveries together
- [ ] Update priority levels (High/Medium/Low)
- [ ] Identify any that have matured into projects
- [ ] Archive completed or obsolete discoveries

### 🔗 Connection Mapping
- [ ] Link discoveries across different files
- [ ] Note which connect to main research
- [ ] Identify potential collaboration opportunities
- [ ] Update cross-references

---

## Red Flags 🚩

**You're NOT using the system well if:**
- Going hours without a discovery check
- Losing interesting tangents because "not relevant now"
- Spending >2 minutes per discovery capture
- Creating complex categorization schemes
- Forgetting to process discoveries at session end

---

## Green Flags ✅

**You're using the system well if:**
- Regular discovery checks feel natural
- Tangential finds are preserved efficiently
- Discovery files grow steadily but manageably
- Future researchers could pick up your leads
- Main research stays focused despite tangents

---

*Remember: The Discovery System prevents research waste. Every interesting tangent is a potential future project!*