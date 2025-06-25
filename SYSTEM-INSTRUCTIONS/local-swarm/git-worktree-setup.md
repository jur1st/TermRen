# Git Worktree Setup for Local Swarm Mode

*Cost-effective parallel processing using git worktrees and multiple Claude instances*

---

## Overview

Git worktrees allow you to have multiple working directories from the same repository, enabling parallel work without the costs of GitHub Actions. Each worktree can run its own Claude instance, providing powerful parallel processing at zero additional cost.

**Benefits**:
- **$0 cost** - No GitHub Actions or additional API charges
- **Faster setup** - 2-5 minutes vs 15+ minutes for GitHub Actions approval
- **Full control** - Direct interaction with each Claude instance
- **Immediate feedback** - No CI/CD delays or queue times
- **Context preservation** - Each instance has full repository context

---

## Prerequisites

### Required Tools
- Git 2.5+ (for worktree support)
- Claude Code CLI installed
- Terminal multiplexer (iTerm2, tmux, or multiple terminal windows)
- Basic understanding of git branching

### Repository Requirements
- Clean working directory (commit or stash changes)
- Current branch in good state
- Sufficient disk space (each worktree ~same size as main repo)

---

## Quick Start (5-Minute Setup)

### Step 1: Plan Your Parallel Work
Identify independent tasks that can be worked on simultaneously:

```
✅ Good for Parallel Work:
- Feature A development + Feature B testing
- Research Topic X + Writing Chapter Y
- Refactoring Module 1 + Documenting Module 2
- Bug fix in auth system + Enhancement in UI system

❌ Not Suitable for Parallel Work:
- Two people editing the same file
- Tasks with tight dependencies
- Work requiring constant coordination
```

### Step 2: Create Worktrees
```bash
# Create worktrees for parallel tasks
git worktree add ../terminal-renaissance-feature-a feature-development
git worktree add ../terminal-renaissance-research research-parallel
git worktree add ../terminal-renaissance-docs documentation-update

# Verify worktrees created
git worktree list
```

### Step 3: Launch Claude Instances
Open separate terminal windows/tabs:

```bash
# Terminal 1: Feature Development
cd ../terminal-renaissance-feature-a
claude

# Terminal 2: Research Work  
cd ../terminal-renaissance-research
claude

# Terminal 3: Documentation
cd ../terminal-renaissance-docs
claude
```

### Step 4: Coordinate Work
Use shared files for coordination:

```bash
# Create coordination file
echo "# Parallel Work Coordination - $(date)" > COORDINATION.md
echo "- Terminal 1: Working on user authentication" >> COORDINATION.md
echo "- Terminal 2: Researching terminal history" >> COORDINATION.md
echo "- Terminal 3: Updating API documentation" >> COORDINATION.md
```

---

## Detailed Setup Guide

### Planning Phase

#### Task Independence Analysis
Before creating worktrees, analyze task dependencies:

1. **File Conflicts**: Will tasks modify the same files?
2. **Logical Dependencies**: Does Task A output feed into Task B?
3. **Timeline Dependencies**: Must tasks complete in sequence?
4. **Resource Dependencies**: Do tasks need same external resources?

#### Optimal Worktree Scenarios
**Perfect for Worktrees**:
- Research + development on different features
- Writing different chapters simultaneously  
- Testing while developing new features
- Documentation while code implementation
- Bug fixes in different modules

**Suboptimal for Worktrees**:
- Multiple people editing same files
- Tasks requiring real-time coordination
- Work with tight sequential dependencies

### Advanced Worktree Commands

#### Creating Specialized Worktrees
```bash
# Create worktree with new branch
git worktree add -b new-feature ../terminal-renaissance-feature ../main

# Create worktree from specific commit
git worktree add ../terminal-renaissance-hotfix abc1234

# Create worktree with tracking branch
git worktree add --track -b feature/auth origin/feature/auth ../terminal-renaissance-auth
```

#### Managing Multiple Worktrees
```bash
# List all worktrees with status
git worktree list --porcelain

# Check worktree health
git worktree prune

# Move a worktree to different location
git worktree move ../terminal-renaissance-old ../terminal-renaissance-new

# Remove completed worktree
git worktree remove ../terminal-renaissance-completed
```

---

## Multi-Claude Coordination

### Communication Patterns

#### 1. Shared Status Files
Create files that all Claude instances can read/update:

```bash
# In main repository
echo "# Multi-Claude Status Board" > CLAUDE-STATUS.md
echo "Last updated: $(date)" >> CLAUDE-STATUS.md
echo "" >> CLAUDE-STATUS.md
echo "## Active Work" >> CLAUDE-STATUS.md
echo "- Claude-1: Authentication module (auth-worktree)" >> CLAUDE-STATUS.md
echo "- Claude-2: Research Chapter 5 (research-worktree)" >> CLAUDE-STATUS.md
echo "- Claude-3: API documentation (docs-worktree)" >> CLAUDE-STATUS.md
```

#### 2. Progress Checkpoints
Regular sync points between instances:

```bash
# Every 30 minutes, update shared progress
echo "## $(date +%H:%M) Update" >> CLAUDE-STATUS.md
echo "Claude-1: Completed login form, starting validation" >> CLAUDE-STATUS.md
```

#### 3. File-Based Handoffs
Pass work between instances through files:

```bash
# Claude-1 completes research, signals Claude-2
echo "RESEARCH COMPLETE: terminal-history-findings.md ready for review" > HANDOFF-RESEARCH.txt
echo "Next: Claude-2 should incorporate findings into Chapter 5" >> HANDOFF-RESEARCH.txt
```

### Conflict Resolution

#### Preventing Conflicts
```bash
# Before starting work, check what others are doing
cat CLAUDE-STATUS.md
git status --porcelain

# Claim your work area
echo "Claude-X: Starting work on [specific files/area]" >> CLAUDE-STATUS.md
```

#### Resolving Conflicts
```bash
# If conflict detected, coordinate resolution
echo "CONFLICT DETECTED: file.md modified in multiple worktrees" >> CLAUDE-STATUS.md
echo "Resolution needed before proceeding" >> CLAUDE-STATUS.md

# Manual resolution process
git status
git diff
# Resolve conflicts, then update status
```

---

## Terminal Management

### Using iTerm2 (macOS)
```bash
# Create new iTerm window for each worktree
osascript -e 'tell application "iTerm" to create window with default profile'

# Split panes for monitoring
# Cmd+D (vertical split), Cmd+Shift+D (horizontal split)
```

### Using tmux (Cross-platform)
```bash
# Create tmux session for parallel work
tmux new-session -d -s claude-swarm

# Create windows for each worktree
tmux new-window -t claude-swarm:1 -n 'feature-a'
tmux new-window -t claude-swarm:2 -n 'research'
tmux new-window -t claude-swarm:3 -n 'docs'

# Navigate to appropriate directories
tmux send-keys -t claude-swarm:1 'cd ../terminal-renaissance-feature-a && claude' Enter
tmux send-keys -t claude-swarm:2 'cd ../terminal-renaissance-research && claude' Enter
tmux send-keys -t claude-swarm:3 'cd ../terminal-renaissance-docs && claude' Enter

# Attach to session
tmux attach-session -t claude-swarm
```

### Using VS Code (with terminals)
```bash
# Open multiple VS Code windows
code ../terminal-renaissance-feature-a
code ../terminal-renaissance-research  
code ../terminal-renaissance-docs

# In each window, open integrated terminal and run 'claude'
```

---

## Workflow Examples

### Example 1: Feature Development + Testing
```bash
# Setup
git worktree add ../terminal-renaissance-dev feature/user-auth
git worktree add ../terminal-renaissance-test test/user-auth

# Terminal 1: Development
cd ../terminal-renaissance-dev
claude
# Prompt: "Implement user authentication system with JWT tokens"

# Terminal 2: Testing
cd ../terminal-renaissance-test  
claude
# Prompt: "Write comprehensive tests for user authentication system"
```

### Example 2: Research + Writing
```bash
# Setup  
git worktree add ../terminal-renaissance-research research/chapter-5
git worktree add ../terminal-renaissance-writing writing/chapter-5

# Terminal 1: Research
cd ../terminal-renaissance-research
claude
# Prompt: "Research terminal color evolution 1980-1990, focus on VGA introduction"

# Terminal 2: Writing
cd ../terminal-renaissance-writing
claude  
# Prompt: "Write Chapter 5 introduction using Feynman voice, topic: terminal colors"
```

### Example 3: Bug Fix + Documentation
```bash
# Setup
git worktree add ../terminal-renaissance-bugfix hotfix/memory-leak
git worktree add ../terminal-renaissance-docs docs/troubleshooting

# Terminal 1: Bug Fix
cd ../terminal-renaissance-bugfix
claude
# Prompt: "Debug memory leak in terminal buffer management"

# Terminal 2: Documentation
cd ../terminal-renaissance-docs
claude
# Prompt: "Document memory management best practices for terminal applications"
```

---

## Integration and Cleanup

### Merging Results

#### Sequential Integration
```bash
# Option 1: Merge worktrees one by one
cd main-repository
git merge feature-a-branch
git merge research-branch
git merge docs-branch
```

#### Parallel Integration
```bash
# Option 2: Create integration worktree
git worktree add ../terminal-renaissance-integration integration

cd ../terminal-renaissance-integration
git merge feature-a-branch
git merge research-branch  
git merge docs-branch
# Resolve any conflicts
```

### Cleanup Process
```bash
# After successful integration
git worktree remove ../terminal-renaissance-feature-a
git worktree remove ../terminal-renaissance-research
git worktree remove ../terminal-renaissance-docs

# Clean up branches if no longer needed
git branch -d feature-a-branch
git branch -d research-branch
git branch -d docs-branch

# Verify cleanup
git worktree list
git branch --all
```

---

## Performance Optimization

### Resource Management
- **Memory**: Each worktree uses additional RAM (~200-500MB per Claude instance)
- **CPU**: Monitor CPU usage with multiple Claude instances
- **Disk**: Each worktree requires disk space (typically same as main repo)
- **Network**: API calls from multiple instances may hit rate limits

### Efficiency Tips
```bash
# Limit concurrent Claude instances based on system resources
# 2-3 instances optimal for most systems
# 4+ instances may cause performance degradation

# Monitor system resources
top -pid $(pgrep -f claude)
df -h  # Check disk space
```

### Performance Monitoring
```bash
# Track worktree disk usage
du -sh ../terminal-renaissance-*

# Monitor API usage across instances
# (Include in your cost tracking)
echo "$(date): Multiple Claude instances active" >> api-usage.log
```

---

## Troubleshooting

### Common Issues

#### Worktree Creation Fails
```bash
# Error: "fatal: 'path' already exists"
Solution: rm -rf existing-path OR use different path

# Error: "fatal: invalid reference"  
Solution: Ensure branch name is valid and exists
```

#### Claude Instance Conflicts
```bash
# Multiple instances modifying same files
Solution: Use CLAUDE-STATUS.md to coordinate
Solution: Work on different file sets

# API rate limiting
Solution: Stagger Claude startup times
Solution: Reduce concurrent instances
```

#### Git State Issues
```bash
# Worktree out of sync
git worktree prune
git worktree repair

# Branch conflicts
git status --porcelain
git diff --name-only
```

### Recovery Procedures
```bash
# Emergency cleanup of all worktrees
git worktree list | grep -v "$(pwd)" | awk '{print $1}' | xargs -I {} git worktree remove {}

# Reset to clean state
git worktree prune
git status
git clean -fd  # Remove untracked files (use carefully)
```

---

## Best Practices

### Setup Guidelines
1. **Plan before creating**: Know what each worktree will do
2. **Name descriptively**: Use clear, purpose-driven names
3. **Limit scope**: 3-4 worktrees maximum for optimal performance
4. **Document coordination**: Use shared status files

### During Work
1. **Regular check-ins**: Update shared status every 30 minutes
2. **Avoid conflicts**: Coordinate file access
3. **Save frequently**: Prevent work loss across multiple instances
4. **Monitor resources**: Watch system performance

### Cleanup
1. **Integrate systematically**: Don't rush the merge process
2. **Test thoroughly**: Verify combined work functions correctly
3. **Clean completely**: Remove all temporary worktrees
4. **Document results**: Record what worked well for future use

---

## Cost Comparison

### Local Swarm Mode vs GitHub Actions

| Factor | Local Swarm Mode | GitHub Actions |
|--------|-----------------|----------------|
| **Setup Time** | 2-5 minutes | 15+ minutes (approval) |
| **API Costs** | $0 additional | $0.03-$1.50+ per interaction |
| **Compute Costs** | $0 (local resources) | GitHub Actions minutes |
| **Approval Required** | No | Yes (mandatory) |
| **Parallel Streams** | 2-4 optimal | Unlimited (expensive) |
| **Context Access** | Full repository | Limited per action |
| **Control** | Complete | Workflow constraints |

### When to Choose Local Swarm Mode
- ✅ Development and testing workflows
- ✅ Research and writing tasks  
- ✅ Independent parallel work
- ✅ Cost-sensitive projects
- ✅ Rapid iteration needed

### When GitHub Actions Might Be Worth It
- Complex CI/CD integration required
- Team collaboration across time zones
- Automated triggering from external events
- Processing scales beyond local resources

---

*Local swarm mode provides 80-90% of GitHub Actions benefits at $0 additional cost. Always try local swarm mode first before requesting expensive GitHub Actions approval.*