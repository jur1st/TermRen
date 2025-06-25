# Terminal Renaissance - Claude Instructions

## 🚨 COST CONTROL - READ FIRST

**ALWAYS CHOOSE LOCAL TOOLS FIRST** - Most tasks cost $0 when done locally.

### Quick Decision Framework
- **Research, documentation, writing, code review**: Use local Claude ($0)
- **Multi-file changes, large refactoring**: Use local swarm mode ($0) 
- **GitHub Actions**: Requires explicit approval + budget check ($$)

### Budget Thresholds
- **Green Zone (0-50% monthly budget)**: Normal workflow
- **Yellow Zone (50-75%)**: Prefer local tools, justify remote usage
- **Red Zone (75-90%)**: **LOCAL TOOLS ONLY**, emergency tasks only
- **Emergency Stop (>90%)**: **CEASE ALL REMOTE AI USAGE**

### Emergency Shutdown
```bash
# If costs spiral - run immediately:
gh run list --status in_progress --json databaseId --jq '.[].databaseId' | xargs -I {} gh run cancel {}
gh workflow disable claude-research-automation.yml
gh workflow disable claude-pr-assistant.yml
```

**For complete cost control guidance**: See `SYSTEM-INSTRUCTIONS/api-cost-management/` and `SYSTEM-INSTRUCTIONS/quick-reference/cost-control-checklist.md`

---

## 🛠️ Local vs Remote Processing Guide

### Use Local Claude When (Cost: $0)
- Research and documentation tasks
- Code review and analysis  
- Writing and editing
- Planning and organization
- Simple code generation
- **99% of daily tasks should use local tools**

### Use Local Swarm Mode When (Cost: $0)
- Multi-file codebase changes
- Large refactoring projects
- Batch processing tasks
- Complex analysis requiring multiple tools
- Tasks needing >30 minutes of AI time
- **Setup guide**: `SYSTEM-INSTRUCTIONS/local-swarm/git-worktree-setup.md`

### GitHub Actions Only When (Cost: $$, Requires Approval)
- **MANDATORY**: Pre-approval required via `SYSTEM-INSTRUCTIONS/github-actions/workflow-approval-process.md`
- Automated testing/CI/CD required
- Task needs fresh environment
- Collaboration with team needed
- Local resources insufficient
- **AND** budget allows (>$50 remaining)

---

## 📋 Research Workflow Essentials

### Before Starting Any Research
- [ ] Check monthly budget status
- [ ] Verify task cannot be done locally
- [ ] Set time limit for session
- [ ] Choose processing mode: Local Claude / Local Swarm / GitHub Actions (with approval)

### Session Structure (30-45 minute blocks)
1. **Setup**: Create `RESEARCH-SUMMARY-$(date +%Y%m%d).md`
2. **Research**: Focus on current writing task, use local tools
3. **Discovery Check**: Log interesting tangents in discovery files
4. **Wrap-up**: Update cost tracking, add findings to `ACCUMULATED-KNOWLEDGE.md`

### Discovery System Files
- `future-research-ideas.md` - New research projects  
- `terminal-preservation-tracking.md` - Software/hardware needing preservation
- `tangential-themes.md` - Interesting patterns and connections
- `research-rabbit-holes.md` - Deep dives avoided during current work

**Complete workflow**: `SYSTEM-INSTRUCTIONS/research/WORKFLOW.md`

---

## 📁 Visual Project Map

```ascii
TERMINAL RENAISSANCE VISUAL MAP
┌─ CONTENT ────────────────────┐  ┌─ SYSTEM ──────────────────────┐
│ 00-START-HERE/               │  │ .claude/                      │
│ 01-Chapters/                 │  │ .obsidian/                    │
│ 02-Knowledge-Graph/          │  │ SYSTEM-INSTRUCTIONS/          │
│ 05-Feynman-Audiobook/        │  │   ├─ project-management/      │
└──────────────────────────────┘  │   ├─ research/                │
                                  │   └─ writing/                 │
┌─ RESEARCH ───────────────────┐  └───────────────────────────────┘
│ 03-Research-Infrastructure/  │
│   ├─ Discovery-System/       │  ┌─ OUTPUTS ────────────────────┐
│   ├─ Research-Reports/       │  │ 04-Interactive-Demos/        │
│   └─ ACCUMULATED-KNOWLEDGE   │  │ 98-Archive-Canvas-Dashboards/│
└──────────────────────────────┘  │ 99-Archive-Session-Docs/     │
                                  └──────────────────────────────┘
```

### 🧭 Navigation Quick Access
- **📋 Project Management**: `SYSTEM-INSTRUCTIONS/project-management/` - Workflows, git guides, scaling
- **🔬 Active Research**: `03-Research-Infrastructure/Discovery-System/` - Current work area
- **📚 Knowledge Base**: `03-Research-Infrastructure/ACCUMULATED-KNOWLEDGE.md` - All findings
- **🎨 Typography Themes**: `.obsidian/snippets/` - 7 professional themes available

### Key Files for Daily Work
- `README.md` - Complete project overview
- `SYSTEM-INSTRUCTIONS/README.md` - All guidance for contributors
- `03-Research-Infrastructure/ACCUMULATED-KNOWLEDGE.md` - Growing knowledge base
- `03-Research-Infrastructure/DISCOVERY-CHECKLIST.md` - Discovery system

---

## Software

- Remember that I use Obsidian 1.9.1
- **Typography Themes Available**: 7 professional themes in `.obsidian/snippets/`
  - Engineering Helvetica Enhanced (NASA-style)
  - Severance Corporate (modern corporate)
  - Technical IBM Enhanced (IBM documentation style)
  - Tron (1982), Sneakers (1992), Hackers (1995) (film-inspired)
  - Terminal Monospace Enhanced (premium monospace)
- **Theme Guide**: `03-Research-Infrastructure/Discovery-System/theme-selection-recommendations.md`
- **Word Conversion**: Perfect Pandoc pipeline available in `03-Research-Infrastructure/Discovery-System/`

---

## Project Planning

- Remember that any plan for a project should be documented in a consistent location, marked completed with notes about how it went when the task is done, and the plan should include a discussion of scaling strategies and why or why not it could or should be scaled out to GitHub or whether all local. It should say whether it will spin up headless claudes or not and why.

### Planning Requirements
- **Cost Assessment**: Every plan must include cost analysis (local vs remote)
- **Budget Impact**: Document estimated costs and budget allocation
- **Local Alternatives**: Always identify cost-free local approaches first
- **Approval Process**: GitHub Actions require explicit approval via `SYSTEM-INSTRUCTIONS/github-actions/workflow-approval-process.md`
- **Emergency Procedures**: Include cost control and shutdown procedures
- **Success Metrics**: Include cost-effectiveness alongside project goals

### Scaling Decision Framework
- **Local First**: Can this be done with local tools? (Usually yes)
- **Local Swarm**: Can parallel local processing handle the scale?
- **GitHub Actions**: Only when local options are insufficient AND approved AND budgeted

---

## 🎯 Daily Quick Reference

### Before Any AI Work
1. Check monthly budget status
2. Choose local tools first
3. Verify task is within project scope
4. Set session time limit

### Cost Estimation Quick Reference
| Task Type | Local Cost | Remote Cost | Recommendation |
|-----------|------------|-------------|----------------|
| Code Review | $0 | $2-5 | Local always |
| Documentation | $0 | $1-3 | Local always |
| Research | $0 | $5-15 | Local always |
| Complex Refactor | $0 | $10-25 | Local swarm |
| GitHub Actions | $0 | $5-20/run | Approval required |

### Emergency Contacts & Procedures
- **Budget Owner**: [Update as needed]
- **Emergency Stop**: Cancel all GitHub Actions immediately
- **Cost Overrun**: Switch to local-only mode, document usage
- **Questions**: Reference `SYSTEM-INSTRUCTIONS/` for detailed guidance

---

## 🔗 Key Documentation References

### Cost Control (Essential Reading)
- `SYSTEM-INSTRUCTIONS/api-cost-management/cost-control-protocol.md`
- `SYSTEM-INSTRUCTIONS/quick-reference/cost-control-checklist.md`
- `SYSTEM-INSTRUCTIONS/github-actions/workflow-approval-process.md`

### Workflow & Process
- `SYSTEM-INSTRUCTIONS/research/WORKFLOW.md`
- `SYSTEM-INSTRUCTIONS/local-swarm/git-worktree-setup.md`
- `SYSTEM-INSTRUCTIONS/writing/feynman-voice/core-principles.md`

### Content Creation
- `SYSTEM-INSTRUCTIONS/writing/content-templates/`
- `SYSTEM-INSTRUCTIONS/writing/feynman-voice/voice-checklist.md`
- `03-Research-Infrastructure/Discovery-System/` (Typography & Word conversion)

---

**Core Philosophy**: Constraint-based creativity through cost-effective collaboration. Always choose the most cost-effective method and prioritize local alternatives. When in doubt, use local tools - they cost $0 and often work just as well.

**Remember**: This project embodies its own philosophy by working with minimal tools and embracing constraints as creative catalysts.