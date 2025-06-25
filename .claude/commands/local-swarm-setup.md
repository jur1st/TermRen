# Local Swarm Setup - Parallel Processing Command

## Task: $ARGUMENTS

### 🚀 Local Parallel Processing Setup
**Cost: $0** (vs ~$0.008/min on GitHub Actions)

I'll help you set up local parallel processing for: **$ARGUMENTS**

### Task Analysis & Breakdown

Based on your request: "$ARGUMENTS", I'll organize this into parallel workstreams:

```
[ANALYZE $ARGUMENTS AND BREAK DOWN INTO 2-4 PARALLEL TASKS]
Example for "research terminal history + write chapter 5":
- Task 1: Research terminal history (historical sources, evolution)
- Task 2: Write chapter 5 introduction and structure
- Task 3: Create interactive demos/examples
- Task 4: Integration and review
```

### Step 1: Create Git Worktrees

```bash
# Create worktrees for each parallel task
git worktree add -b swarm-task-1-[TASK_NAME] ../swarm-task-1
git worktree add -b swarm-task-2-[TASK_NAME] ../swarm-task-2
git worktree add -b swarm-task-3-[TASK_NAME] ../swarm-task-3
git worktree add -b swarm-task-4-[TASK_NAME] ../swarm-task-4

# Example for "research terminal history + write chapter 5":
# git worktree add -b swarm-research-terminal ../swarm-research
# git worktree add -b swarm-write-chapter-5 ../swarm-chapter-5
# git worktree add -b swarm-create-demos ../swarm-demos
# git worktree add -b swarm-integration ../swarm-integration
```

### Step 2: Launch Terminal Windows

#### macOS (Terminal.app or iTerm2)
```bash
# Open new terminal windows for each worktree
open -a Terminal ../swarm-task-1
open -a Terminal ../swarm-task-2
open -a Terminal ../swarm-task-3
open -a Terminal ../swarm-task-4

# Or use AppleScript for positioned windows:
osascript -e 'tell app "Terminal" to do script "cd ../swarm-task-1 && claude"'
osascript -e 'tell app "Terminal" to do script "cd ../swarm-task-2 && claude"'
osascript -e 'tell app "Terminal" to do script "cd ../swarm-task-3 && claude"'
osascript -e 'tell app "Terminal" to do script "cd ../swarm-task-4 && claude"'
```

#### Linux (GNOME Terminal)
```bash
gnome-terminal --working-directory=../swarm-task-1 -- bash -c "claude; exec bash"
gnome-terminal --working-directory=../swarm-task-2 -- bash -c "claude; exec bash"
gnome-terminal --working-directory=../swarm-task-3 -- bash -c "claude; exec bash"
gnome-terminal --working-directory=../swarm-task-4 -- bash -c "claude; exec bash"
```

#### Windows (Windows Terminal)
```powershell
wt -d ../swarm-task-1 cmd /k claude
wt -d ../swarm-task-2 cmd /k claude
wt -d ../swarm-task-3 cmd /k claude
wt -d ../swarm-task-4 cmd /k claude
```

### Step 3: Create Coordination Files

Create `SWARM-COORDINATION.md` in the main repository:

```markdown
# Swarm Coordination - $ARGUMENTS
Generated: [CURRENT_DATE]

## Active Tasks
- [ ] Task 1: [TASK_DESCRIPTION] - Branch: swarm-task-1-[NAME]
- [ ] Task 2: [TASK_DESCRIPTION] - Branch: swarm-task-2-[NAME]
- [ ] Task 3: [TASK_DESCRIPTION] - Branch: swarm-task-3-[NAME]
- [ ] Task 4: [TASK_DESCRIPTION] - Branch: swarm-task-4-[NAME]

## Communication Protocol
- Update this file when completing major milestones
- Check other branches before making conflicting changes
- Use PR descriptions to document your work

## Progress Tracking
Task 1: [░░░░░░░░░░] 0%
Task 2: [░░░░░░░░░░] 0%
Task 3: [░░░░░░░░░░] 0%
Task 4: [░░░░░░░░░░] 0%
```

### Step 4: Task-Specific Instructions

For each Claude instance, provide these instructions:

**Instance 1 - [TASK_1_NAME]:**
```
You are working on: [TASK_1_DESCRIPTION]
Your branch: swarm-task-1-[NAME]
Focus: [SPECIFIC_FOCUS_AREA]
Coordination: Update SWARM-COORDINATION.md when you complete milestones
```

**Instance 2 - [TASK_2_NAME]:**
```
You are working on: [TASK_2_DESCRIPTION]
Your branch: swarm-task-2-[NAME]
Focus: [SPECIFIC_FOCUS_AREA]
Coordination: Update SWARM-COORDINATION.md when you complete milestones
```

[REPEAT FOR ALL INSTANCES]

### Step 5: Progress Monitoring

Create `SWARM-PROGRESS.md` for real-time updates:

```markdown
# Swarm Progress Log

## [TIMESTAMP] - Task 1
- Started: [WHAT_THEY'RE_WORKING_ON]
- Status: In Progress

## [TIMESTAMP] - Task 2
- Started: [WHAT_THEY'RE_WORKING_ON]
- Status: In Progress

[UPDATE AS WORK PROGRESSES]
```

### Step 6: Integration Commands

Once tasks are complete:

```bash
# Review all branches
git worktree list

# Merge completed work
git checkout main
git merge swarm-task-1-[NAME]
git merge swarm-task-2-[NAME]
git merge swarm-task-3-[NAME]
git merge swarm-task-4-[NAME]

# Clean up worktrees
git worktree remove ../swarm-task-1
git worktree remove ../swarm-task-2
git worktree remove ../swarm-task-3
git worktree remove ../swarm-task-4

# Delete merged branches
git branch -d swarm-task-1-[NAME]
git branch -d swarm-task-2-[NAME]
git branch -d swarm-task-3-[NAME]
git branch -d swarm-task-4-[NAME]
```

### 💡 Benefits of Local Swarm

1. **Zero Cost**: No cloud compute charges
2. **Full Control**: Direct oversight of all instances
3. **Instant Communication**: No API delays
4. **Resource Efficient**: Uses your local compute
5. **Privacy**: Everything stays on your machine

### 🎯 Tips for Success

1. **Clear Task Boundaries**: Define what each instance should work on
2. **Regular Syncs**: Check coordination file every 10-15 minutes
3. **Atomic Commits**: Make small, focused commits
4. **Communication**: Use commit messages and PR descriptions liberally
5. **Integration Planning**: Plan how pieces will fit together

### Example Scenarios

**Research + Writing:**
```
/local-swarm-setup research CLI history + write introduction + create timeline visualization
```

**Development + Testing:**
```
/local-swarm-setup implement user auth + write unit tests + update API docs + create integration tests
```

**Refactoring:**
```
/local-swarm-setup refactor database layer + update service layer + migrate tests + update documentation
```

Ready to launch your local swarm for: **$ARGUMENTS**? Let's begin!