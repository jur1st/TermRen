# Cost Control Checklist - Quick Reference

## Pre-Work Assessment

### Before Starting Any AI Task
- [ ] Estimate task complexity (Simple/Medium/Complex)
- [ ] Check current monthly budget usage
- [ ] Verify task cannot be done locally
- [ ] Confirm task is within project scope
- [ ] Set time limit for the session

### Budget Status Check
- [ ] Monthly budget remaining: $____
- [ ] Current week usage: $____
- [ ] Red flag if >75% monthly budget used
- [ ] Stop work if >90% monthly budget used

## Decision Tree: Local vs Remote

### Use Local Claude When:
- [ ] Research and documentation tasks
- [ ] Code review and analysis
- [ ] Writing and editing
- [ ] Planning and organization
- [ ] Simple code generation

### Use Local Swarm Mode When:
- [ ] Multi-file codebase changes
- [ ] Large refactoring projects
- [ ] Batch processing tasks
- [ ] Complex analysis requiring multiple tools
- [ ] Task needs >30 minutes of AI time

### Consider GitHub Actions Only When:
- [ ] Automated testing/CI/CD required
- [ ] Task needs fresh environment
- [ ] Collaboration with team needed
- [ ] Local resources insufficient
- [ ] **AND** budget allows (>$50 remaining)

## Cost Estimation Quick Reference

| Task Type | Local Cost | Remote Cost | Time Estimate |
|-----------|------------|-------------|---------------|
| Code Review | $0 | $2-5 | 15-30 min |
| Documentation | $0 | $1-3 | 10-20 min |
| Simple Coding | $0 | $3-8 | 20-45 min |
| Complex Refactor | $0 | $10-25 | 1-3 hours |
| Research Session | $0 | $5-15 | 30-90 min |
| GitHub Actions | $0 | $5-20/run | Per workflow |

## Budget Thresholds

### Green Zone (0-50% monthly budget)
- [ ] All tools available
- [ ] Normal workflow approved
- [ ] Continue with planned tasks

### Yellow Zone (50-75% monthly budget)
- [ ] Prefer local tools
- [ ] Justify remote usage
- [ ] Increase task batching
- [ ] Review remaining priorities

### Red Zone (75-90% monthly budget)
- [ ] **LOCAL TOOLS ONLY**
- [ ] Emergency tasks only
- [ ] Manager approval required
- [ ] Document all usage

### Emergency Stop (>90% monthly budget)
- [ ] **CEASE ALL REMOTE AI USAGE**
- [ ] Switch to manual methods
- [ ] Emergency contact required
- [ ] Wait for next billing cycle

## Emergency Shutdown Checklist

### Immediate Actions
- [ ] Stop all running AI processes
- [ ] Cancel pending GitHub Actions
- [ ] Switch to local-only mode
- [ ] Document current budget usage
- [ ] List critical tasks still needed

### Emergency Contacts
- [ ] Budget owner: ________________
- [ ] Project manager: ________________
- [ ] Technical lead: ________________

## Approval Requirements

### Always Require Approval For:
- [ ] GitHub Actions usage (>$5 estimated)
- [ ] Tasks in Red Zone (>75% budget)
- [ ] Experimental workflows
- [ ] Multi-day AI sessions
- [ ] Tasks outside project scope

### Self-Approval Allowed For:
- [ ] Local tool usage (always $0)
- [ ] Documentation tasks <$5
- [ ] Code review <$3
- [ ] Quick research <$2

## Monthly Budget Tracking

### Week 1: $____/____
### Week 2: $____/____
### Week 3: $____/____
### Week 4: $____/____

**Total Month: $____/$____**

## Common Scenarios & Recommendations

### "I need to analyze this large codebase"
- **Recommended**: Local swarm mode
- **Cost**: $0
- **Setup time**: 10 minutes

### "I need to write documentation"
- **Recommended**: Local Claude
- **Cost**: $0
- **Time**: Variable

### "I need automated testing"
- **Recommended**: Local setup first, GitHub Actions if needed
- **Cost**: $0 local, $5-20 remote
- **Check**: Budget status first

### "I need to research a complex topic"
- **Recommended**: Local Claude with web search
- **Cost**: $0
- **Time**: Usually <1 hour

### "I need to refactor multiple files"
- **Recommended**: Local swarm mode
- **Cost**: $0
- **Benefit**: Full codebase context

## Red Flags - Stop Work Immediately

- [ ] Budget usage >90%
- [ ] Task scope unclear or expanding
- [ ] Repeated AI failures (>3 attempts)
- [ ] Task taking >2x estimated time
- [ ] Alternative local methods available
- [ ] Task not in approved project scope

## Quick Commands

### Check Budget Status
```bash
# Add your budget checking commands here
```

### Start Local Swarm
```bash
# cd to project directory
# git worktree commands
```

### Emergency Stop
```bash
# Kill all AI processes
# Cancel GitHub Actions
```

---

**Remember**: When in doubt, choose local tools. They cost $0 and often work just as well.

**Last Updated**: [Current Date]
**Next Review**: [Next Month]