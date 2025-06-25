# Discovery System Checklist

*Quick reference for research sessions - keep this handy!*

---

## Session Setup (First 5 minutes)

### 💰 Budget Verification
- [ ] Check current API cost consumption against daily/weekly limits
- [ ] Verify research budget allocation for this session
- [ ] Confirm GitHub Actions workflows are paused (if not needed)
- [ ] Plan local-first research approach when possible

### 🎯 Research Planning
- [ ] Define session objectives and scope
- [ ] Identify which tools require API calls vs local alternatives
- [ ] Set time boundaries to control API usage
- [ ] Review cost control protocol if budget is >50% consumed

---

## During Research (Every 30-45 minutes)

### ⏸️ Pause and Ask:
- [ ] What interesting things have I found that aren't directly relevant?
- [ ] Any technical tangents worth exploring later?
- [ ] Any people/systems that need preservation attention?
- [ ] Any cross-disciplinary connections noticed?

### 💰 Cost Check:
- [ ] Review API usage since last checkpoint
- [ ] Confirm still within session budget limits
- [ ] Switch to local alternatives if approaching limits
- [ ] Note any high-cost operations for future optimization

### 📊 Rate Each Discovery (0-10 scale)
- **7-10**: Include in current research
- **4-6**: Log to discovery system 
- **0-3**: Note briefly or skip

### ⏱️ 2-Minute Capture per Discovery
1. **What**: Brief description (1-2 sentences)
2. **Why**: Why is this significant?
3. **Cost**: Note if discovery required expensive API calls
4. **Where**: Which discovery file?
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
Cost: [API usage notes - high/medium/low/local]
Next: [What would be needed to explore this]
```

---

## End of Session (5-10 minutes)

### 💰 Final Cost Review
- [ ] Calculate total API costs for this session
- [ ] Update running budget consumption tracking
- [ ] Note any cost-effective discoveries for future reference
- [ ] Flag any high-cost operations for optimization

### 🔄 Process Discoveries
- [ ] Review "Discoveries Logged" section
- [ ] Add to appropriate discovery files
- [ ] Update relevance scores if needed
- [ ] Note any that connect to existing discoveries
- [ ] Tag discoveries by cost profile (expensive vs local-friendly)

### 📁 Simple Bash Commands
```bash
# Add discovery to future research
echo "## Grid Computing History - $(date)" >> future-research-ideas.md

# Check what's already logged
grep "##" future-research-ideas.md | tail -10

# See this week's discoveries
grep -A2 "$(date +%Y-%m)" *.md

# Track cost-effective discoveries
grep -A1 "Cost: local" *.md | head -5
```

---

## Weekly Review (Fridays)

### 💰 Budget Assessment
- [ ] Review total week's API costs against budget
- [ ] Identify highest-cost research areas
- [ ] Plan cost optimizations for next week
- [ ] Update budget allocation based on priorities

### 📊 Discovery Assessment
- [ ] Group similar discoveries together
- [ ] Update priority levels (High/Medium/Low)
- [ ] Identify any that have matured into projects
- [ ] Archive completed or obsolete discoveries
- [ ] Prioritize low-cost discoveries for immediate follow-up

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
- **Ignoring API cost limits during research**
- **Using expensive tools when local alternatives exist**
- **Exceeding budget without emergency procedures**
- **Not tracking cost per discovery**

---

## Green Flags ✅

**You're using the system well if:**
- Regular discovery checks feel natural
- Tangential finds are preserved efficiently
- Discovery files grow steadily but manageably
- Future researchers could pick up your leads
- Main research stays focused despite tangents
- **API costs stay within planned budgets**
- **Local tools are preferred when possible**
- **Cost-effective discoveries are prioritized**
- **Emergency cost controls are ready if needed**

---

## Emergency Cost Control 🚨

**If approaching budget limits:**
- [ ] **PAUSE** all expensive API operations immediately
- [ ] Switch to local-only research methods
- [ ] Review cost control protocol documentation
- [ ] Get explicit approval before resuming expensive operations
- [ ] Consider postponing high-cost discoveries to next budget period

---

*Remember: The Discovery System prevents research waste. Every interesting tangent is a potential future project! Cost-conscious research ensures sustainable long-term discovery.*