# API Cost Control Protocol - Terminal Renaissance Project

*CRITICAL: All API key usage requires explicit pre-approval*

---

## 🚨 MANDATORY PRE-APPROVAL REQUIRED

**BEFORE using any GitHub Actions that consume API credits:**

1. **STOP** - Do not proceed without explicit approval
2. **ESTIMATE** - Calculate potential costs using guidelines below
3. **REQUEST** - Get written approval from project owner
4. **DOCUMENT** - Record the approval in session notes

---

## Cost Categories

### 🔴 HIGH COST: Ultra-Swarm Mode (GitHub Actions)
**Requires explicit approval for EACH use**

- **What**: GitHub Actions workflows using `@claude` mentions
- **Cost**: $0.03-$0.50+ per interaction depending on complexity
- **When**: Issue/PR comments, automated research workflows
- **Approval**: Required every time, no exceptions

### 🟡 MEDIUM COST: Headless Mode API Usage
**Requires approval for bulk operations**

- **What**: `claude -p` commands using API key
- **Cost**: $0.01-$0.10 per command
- **When**: CI/CD automation, bulk processing
- **Approval**: Required for >10 operations

### 🟢 LOW COST: Local Claude Instances
**No approval required**

- **What**: Interactive Claude sessions on local machine
- **Cost**: Part of user's personal subscription
- **When**: Regular development work, research sessions
- **Approval**: None needed

---

## Pre-Approval Process

### Step 1: Cost Estimation
Use this framework to estimate costs:

```
Base Cost: $0.03 per simple interaction
Complex Research: +$0.20 per workflow
Parallel Processing: +$0.15 per parallel stream
Long Sessions: +$0.10 per 30-minute extension

Example:
- Simple @claude bug fix: ~$0.05
- Research automation with 3 parallel streams: ~$0.70
- Complex feature development: ~$0.30-$1.50
```

### Step 2: Justification Required
Document why GitHub Actions are necessary:
- [ ] Local alternatives insufficient
- [ ] Time-critical requirement
- [ ] Parallel processing needed
- [ ] Specific API integrations required

### Step 3: Request Approval
**Format for approval request:**
```
REQUEST: GitHub Actions API Usage
TASK: [Brief description]
ESTIMATED COST: $[amount]
JUSTIFICATION: [Why local alternatives won't work]
DURATION: [Expected runtime]
SAFEGUARDS: [Timeout limits, monitoring]
```

### Step 4: Documentation
**After approval, document:**
- Approval timestamp
- Actual cost incurred
- Results achieved
- Lessons learned

---

## Emergency Shutdown Procedures

### Immediate Actions
1. **Cancel running workflows**: `gh run cancel [run-id]`
2. **Disable GitHub App**: Temporarily revoke repository access
3. **Document incident**: Note what triggered the emergency stop

### Prevention Commands
```bash
# Check running workflows
gh run list --status in_progress

# Cancel specific run
gh run cancel [run-id]

# Cancel all running workflows (emergency)
gh run list --status in_progress --json databaseId --jq '.[].databaseId' | xargs -I {} gh run cancel {}
```

### Recovery Process
1. Review what went wrong
2. Implement additional safeguards
3. Update this protocol if needed
4. Get approval before re-enabling

---

## Budget Monitoring

### Monthly Limits
- **Research Phase**: $50/month maximum
- **Development Phase**: $100/month maximum
- **Emergency Buffer**: $25/month

### Tracking Methods
1. **GitHub Actions Usage**: Monitor in repository settings
2. **Anthropic Console**: Track API usage in billing dashboard
3. **Manual Log**: Keep spreadsheet of approved usage

### Warning Thresholds
- **50% of budget**: Slow down non-essential usage
- **75% of budget**: Require higher approval level
- **90% of budget**: Emergency review required

---

## Cost-Saving Alternatives

### Local Swarm Mode (Preferred)
- Use git worktrees for parallel work
- Run multiple local Claude instances
- Coordinate through shared files
- **Cost**: $0 beyond personal subscription

### Batch Processing
- Combine multiple small tasks
- Use headless mode for bulk operations
- Process during off-peak hours
- **Savings**: 60-80% cost reduction

### Hybrid Approach
- Use local for development
- Use GitHub Actions only for final integration
- Pre-test everything locally first
- **Savings**: 70-90% cost reduction

---

## Violation Consequences

### First Violation
- Review session with project owner
- Update personal cost awareness training
- Additional approval layer for 30 days

### Repeat Violations
- Temporary removal of API access
- Required use of local-only mode
- Process improvement mandatory

### Emergency Overrides
Only permitted for:
- Security incidents
- Data loss prevention
- Critical deadline recovery

---

## Quick Reference Checklist

Before ANY GitHub Actions API usage:

- [ ] Estimated cost calculated
- [ ] Written approval obtained
- [ ] Local alternatives considered
- [ ] Timeout limits set
- [ ] Monitoring in place
- [ ] Emergency shutdown ready

**Remember: When in doubt, use local mode first**

---

*This protocol protects project budget while maximizing the value of AI-assisted development. Always err on the side of caution with API costs.*