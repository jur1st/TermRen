# GitHub Actions Workflow Approval Process

*Step-by-step protocol for cost-controlled AI automation deployment*

---

## 🚨 MANDATORY: No GitHub Actions Without Approval

**CRITICAL RULE**: All GitHub Actions workflows using Claude require explicit written approval before setup or activation.

---

## Pre-Flight Checklist

Before even requesting approval, ensure you've completed:

- [ ] **Local alternatives evaluated**: Tried local swarm mode and direct Claude CLI
- [ ] **Cost estimation calculated**: Used the cost estimation framework
- [ ] **Budget verified**: Checked monthly spending limits and availability
- [ ] **Justification documented**: Clear reason why local alternatives are insufficient
- [ ] **Emergency contacts identified**: Know who to call if costs spiral

---

## Step 1: Initial Assessment

### 1.1 Cost-Benefit Analysis
Complete this analysis before proceeding:

```
TASK: [Brief description]
ESTIMATED INTERACTIONS: [Number of @claude mentions expected]
COST RANGE: $[min] - $[max] based on complexity
TIME SAVINGS: [Hours saved vs local development]
CRITICALITY: [High/Medium/Low urgency]
ALTERNATIVES TRIED: [What local options were attempted]
```

### 1.2 Local Alternative Documentation
Document why local alternatives are insufficient:

- **Local Claude CLI**: Why isn't this sufficient?
- **Local Swarm Mode**: What limitations prevent this approach?
- **Manual Coordination**: Why is automation specifically needed?

### 1.3 Risk Assessment
Identify potential cost overruns:

- **Complexity Escalation**: Could the task become more complex than estimated?
- **Iteration Risk**: Potential for multiple rounds of refinement?
- **Error Recovery**: Costs if initial attempts fail?
- **Scope Creep**: Risk of expanding beyond original scope?

---

## Step 2: Formal Approval Request

### 2.1 Request Template
Use this exact format for approval requests:

```
APPROVAL REQUEST: GitHub Actions Deployment

PROJECT: Terminal Renaissance
REQUESTOR: [Your name]
DATE: [Current date]
URGENCY: [High/Medium/Low]

TASK DESCRIPTION:
[2-3 sentences describing what needs to be done]

COST ANALYSIS:
- Estimated Interactions: [number]
- Cost Range: $[min] - $[max]
- Budget Impact: [percentage of monthly budget]
- GitHub Actions Compute: ~$[estimated]

JUSTIFICATION:
- Local CLI limitation: [specific reason]
- Local swarm limitation: [specific reason]
- Time criticality: [why automation is needed]
- Business impact: [consequences of delay]

RISK MITIGATION:
- Timeout limits: [maximum runtime]
- Cost monitoring: [how costs will be tracked]
- Emergency shutdown: [planned safeguards]
- Scope boundaries: [clearly defined limits]

ALTERNATIVES ATTEMPTED:
1. [What was tried locally]
2. [Results and limitations]
3. [Why insufficient for current need]

APPROVAL REQUESTED FOR:
- Workflow setup: Yes/No
- Budget allocation: $[amount]
- Timeline: [expected duration]
- Monitoring requirements: [proposed oversight]
```

### 2.2 Required Documentation
Attach these documents to your request:

1. **Cost estimation spreadsheet** (use template in cost-control-protocol.md)
2. **Local alternative attempt logs** (what was tried, what failed)
3. **Timeline with milestones** (when work will be done, checkpoints)
4. **Emergency procedures** (how to stop if costs escalate)

---

## Step 3: Review Process

### 3.1 Initial Review (24-48 hours)
Review criteria:
- **Cost justification**: Is the expense reasonable for the value?
- **Alternative exploration**: Were local options genuinely insufficient?
- **Risk assessment**: Are safeguards adequate?
- **Scope clarity**: Is the task well-defined and bounded?

### 3.2 Possible Outcomes

**APPROVED**: 
- Proceed with documented limitations
- Monitor costs actively
- Report completion and actual costs

**CONDITIONALLY APPROVED**:
- Additional safeguards required
- Reduced scope or budget limits
- Enhanced monitoring protocols

**DENIED**:
- Insufficient justification
- Local alternatives not adequately explored
- Cost exceeds benefit threshold
- Budget constraints

**DEFERRED**:
- Need more information
- Await budget availability
- Timing issues

---

## Step 4: Approved Deployment

### 4.1 Pre-Deployment Setup
Once approved, before activating workflows:

1. **Set timeout limits**: Configure maximum runtime
2. **Enable monitoring**: Set up cost tracking
3. **Test safeguards**: Verify emergency shutdown works
4. **Document baseline**: Record starting budget levels
5. **Schedule check-ins**: Plan cost review meetings

### 4.2 Activation Checklist
- [ ] Approval email saved to project files
- [ ] Budget allocation confirmed
- [ ] Monitoring dashboard configured
- [ ] Emergency contacts notified
- [ ] Timeout limits set in workflows
- [ ] Scope boundaries clearly documented
- [ ] First checkpoint scheduled

### 4.3 Deployment Commands
For approved deployments, use these commands with cost tracking:

```bash
# Enable GitHub Actions with monitoring
echo "APPROVED DEPLOYMENT: $(date)" >> github-actions-deployment.log
echo "BUDGET ALLOCATED: $[amount]" >> github-actions-deployment.log
echo "APPROVAL ID: [reference]" >> github-actions-deployment.log

# Activate workflows (only after approval)
gh workflow enable claude-pr-assistant.yml
gh workflow enable claude-research-automation.yml

# Verify safeguards are active
gh workflow list --all
```

---

## Step 5: Active Monitoring

### 5.1 During Execution
**Real-time monitoring requirements**:

- Check costs every 2 hours during active use
- Log all @claude interactions
- Monitor workflow execution times
- Track budget consumption

### 5.2 Cost Tracking Log
Maintain this log during execution:

```
INTERACTION LOG - [DATE]
Time | Workflow | Cost | Duration | Status | Notes
09:15 | PR Assistant | $0.12 | 3m | Success | Simple bug fix
10:30 | Research Auto | $0.45 | 8m | Success | Complex analysis
11:45 | PR Assistant | $0.08 | 2m | Success | Quick response
```

### 5.3 Escalation Triggers
**STOP and escalate if**:
- Costs exceed 120% of approved budget
- Single interaction costs >$2.00
- Workflow runs longer than 90 minutes
- Unexpected behavior or errors occur
- Scope begins to expand beyond approval

---

## Step 6: Completion and Review

### 6.1 Post-Deployment Documentation
Upon completion, document:

```
COMPLETION REPORT
Approval ID: [reference]
Actual Cost: $[amount] vs Estimated: $[amount]
Duration: [actual] vs Planned: [planned]
Interactions: [count] vs Estimated: [count]
Success Rate: [percentage]
Issues Encountered: [any problems]
Lessons Learned: [what would be done differently]
```

### 6.2 Budget Reconciliation
- Update monthly budget tracking
- Reconcile actual vs estimated costs
- Document variance explanations
- Update cost estimation models

### 6.3 Process Improvement
After each deployment:
- Update cost estimation guidelines if needed
- Refine approval criteria based on outcomes
- Improve emergency procedures if issues occurred
- Share learnings with future requestors

---

## Emergency Procedures

### Immediate Cost Escalation Response
If costs are spiraling out of control:

1. **STOP**: Cancel running workflows immediately
   ```bash
   gh run list --status in_progress --json databaseId --jq '.[].databaseId' | xargs -I {} gh run cancel {}
   ```

2. **DISABLE**: Turn off all GitHub Actions
   ```bash
   gh workflow disable claude-pr-assistant.yml
   gh workflow disable claude-research-automation.yml
   ```

3. **DOCUMENT**: Record what happened
   ```bash
   echo "EMERGENCY STOP: $(date) - Reason: [cause]" >> emergency-log.txt
   ```

4. **NOTIFY**: Contact project owner immediately

5. **ANALYZE**: Investigate what went wrong before re-enabling

---

## Approval Templates

### Quick Approval (for small tasks <$10)
```
QUICK APPROVAL REQUEST
Task: [brief description]
Cost: <$10
Justification: [one sentence]
Risk: Low/Contained
Approval requested for emergency use.
```

### Standard Approval (most common)
Use the full template in Step 2.1

### Major Approval (>$50 or critical operations)
Standard template plus:
- Executive sponsor sign-off
- Detailed risk analysis
- Formal budget amendment
- Enhanced monitoring plan

---

## Violation Consequences

### First-Time Violations
- **Immediate workflow shutdown**
- **Mandatory cost control training**
- **30-day enhanced oversight**
- **Written warning in project file**

### Repeat Violations
- **Temporary removal of GitHub Actions access**
- **Required use of local-only development**
- **Formal review with project stakeholders**
- **Potential removal from autonomous AI tool access**

### Severe Violations (>$100 unauthorized)
- **Immediate access revocation**
- **Formal disciplinary review**
- **Financial responsibility for unauthorized costs**
- **Mandatory approval for all future AI tool usage**

---

## Success Metrics

Track these metrics to improve the approval process:
- **Average approval time**: Target <48 hours
- **Cost accuracy**: Actual vs estimated within 20%
- **Denial rate**: Track reasons for process improvement
- **Emergency stops**: Minimize through better planning
- **Budget utilization**: Optimize allocation across projects

---

*Remember: The approval process protects both project budgets and ensures AI tools are used effectively. When in doubt, always prefer local development and seek approval for automation.*