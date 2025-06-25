# 🔄 Git Workflow Card

*Safe, confident version control for your research and content*

---

## **Workflow Overview**
```
┌─────────────────────────────────────────┐
│ 🔄 GIT WORKFLOW                         │
├─────────────────────────────────────────┤
│ ⏱️  Duration: 5-10 minutes              │
│ 💰 Cost: $0 (local operation)          │
│ 📝 Output: Saved project state         │
│ 🎯 Goal: Preserve work safely          │
└─────────────────────────────────────────┘
```

---

## **Visual Git Process**
```ascii
GIT WORKFLOW STEPS
┌──────────┐    ┌──────────┐    ┌──────────┐
│  REVIEW  │───▶│ ORGANIZE │───▶│  COMMIT  │
│ Changes  │    │  Files   │    │  Story   │
└──────────┘    └──────────┘    └──────────┘
     │               │               │
     ▼               ▼               ▼
   What            Where           Why &
  Changed?        Should           What
                 They Go?        Happened?
```

---

## **Step 1: Review Current State** (2 minutes)
```
CHECK WHAT'S CHANGED:
□ git status
   └─ See modified, new, and staged files

□ Scan the output visually:
   ├─ M = Modified (files you changed)
   ├─ ?? = New files (just created) 
   ├─ D = Deleted (files removed)
   └─ A = Added (staged for commit)

□ git diff
   └─ See specific changes made
   └─ Review content modifications
```

---

## **Step 2: Organize Your Changes** (3-5 minutes)
```
SMART FILE GROUPING:

CONTENT CHANGES:
□ Chapter files (01-Chapters/)
□ Knowledge graph (02-Knowledge-Graph/)
□ Research findings (03-Research-Infrastructure/)
□ Commit type: "content:"

SYSTEM CHANGES:
□ Workflows (SYSTEM-INSTRUCTIONS/)
□ Configuration (.claude/, .obsidian/)
□ Tools and scripts
□ Commit type: "system:"

RESEARCH CHANGES:
□ New research files
□ Discovery system updates
□ Research reports
□ Commit type: "research:"

CLEANUP CHANGES:
□ File organization
□ Archive moves
□ Directory restructuring
□ Commit type: "cleanup:"
```

---

## **Step 3: Stage Your Files** (1-2 minutes)
```
ADD FILES TO COMMIT:

OPTION A - Add specific files:
□ git add [filename]
□ git add [directory]/
□ Best for: Selective commits

OPTION B - Add all changes:
□ git add .
□ Best for: End-of-session commits

OPTION C - Interactive adding:
□ git add -p
□ Best for: Reviewing each change

CHECK STAGING:
□ git status
   └─ Verify correct files staged
```

---

## **Step 4: Write Your Commit Story** (2-3 minutes)
```
COMMIT MESSAGE TEMPLATE:
┌─────────────────────────────────────────┐
│ <type>: <clear description>             │
│                                         │
│ <optional explanation of why this       │
│ change matters and what it enables>     │
│                                         │
│ 🤖 Generated with [Claude Code]         │
│ Co-Authored-By: Claude <email>          │
└─────────────────────────────────────────┘

COMMIT TYPES:
├─ content: - New chapters, research, knowledge
├─ system: - Workflows, tools, configurations  
├─ research: - Findings, reports, analysis
├─ themes: - Typography, visual design
├─ cleanup: - Organization, file moves
└─ docs: - Documentation, guides, instructions
```

---

## **Step 5: Execute Commit** (1 minute)
```
MAKE THE COMMIT:
□ git commit -m "your message here"

OR for longer messages:
□ git commit
   └─ Opens editor for detailed message

VERIFY SUCCESS:
□ git log --oneline -5
   └─ See your commit at the top
   └─ Check message looks correct
```

---

## **Safety Checks**
```
✅ SAFE TO COMMIT WHEN:
├─ Cleanup protocol completed
├─ Files in logical locations
├─ No temporary or test files included
├─ Commit message tells clear story
├─ Changes represent logical unit of work
└─ You understand what's being saved

⚠️  WAIT & REVIEW:
├─ Massive file changes (>50 files)
├─ Unclear what changed or why
├─ Mixed system and content changes
├─ Temporary files in staging
├─ No clear story for the commit
```

---

## **Common Commit Scenarios**
```
RESEARCH SESSION END:
├─ Files: New research notes, updated discovery files
├─ Type: "research:"
├─ Message: "research: [topic] historical analysis and findings"
└─ Focus: What you learned and why it matters

CLEANUP SESSION:
├─ Files: Moved files, organized directories
├─ Type: "cleanup:"  
├─ Message: "cleanup: organize Discovery-System research outputs"
└─ Focus: How things are better organized

SYSTEM IMPROVEMENT:
├─ Files: New workflows, updated documentation
├─ Type: "system:"
├─ Message: "system: add visual git workflow guide"
└─ Focus: What capability was added

CONTENT CREATION:
├─ Files: New chapters, knowledge nodes, audiobook
├─ Type: "content:"
├─ Message: "content: expand chapter 6 pixel renaissance section"
└─ Focus: What story was advanced
```

---

## **Git Confidence Building**
```
START SMALL:
□ Commit single file changes first
□ Practice with low-risk content
□ Read git status carefully each time
□ Review git log to see your progress

BUILD SKILLS:
□ Learn git diff to see changes
□ Practice meaningful commit messages
□ Understand staging area concept
□ Get comfortable with git status

ADVANCED COMFORT:
□ Group related changes logically
□ Write detailed commit messages
□ Use branches for experiments
□ Understand project git history
```

---

## **Troubleshooting Common Issues**
```
PROBLEM: Too many changes to review
SOLUTION: 
□ git status | head -20 (see first 20 lines)
□ Focus on file types, not every detail
□ Group by directory for mental organization

PROBLEM: Unsure if changes are good
SOLUTION:
□ git diff [filename] (review specific files)
□ Ask yourself: "Does this advance the project?"
□ When in doubt, commit with honest message

PROBLEM: Commit message unclear  
SOLUTION:
□ Start with the file type (content/system/research)
□ Describe what changed in present tense
□ Add "why" if it's not obvious from "what"

PROBLEM: Staged wrong files
SOLUTION:
□ git reset (unstage everything)
□ git add [correct files] (stage only what you want)
□ git status (verify correct staging)
```

---

## **Emergency Git Reset**
```
IF SOMETHING GOES WRONG:
┌─────────────────┐
│ DON'T PANIC     │
└─────────────────┘
         │
         ▼
□ git status (see current state)
□ git reset (unstage everything if needed)
□ git checkout -- [filename] (undo file changes)
□ Ask for help if unsure
□ Remember: Local changes, low risk
```

---

## **Success Patterns**
```
✅ BUILDING GIT CONFIDENCE:
├─ Regular small commits vs. huge ones
├─ Clear, honest commit messages
├─ Organized files before committing  
├─ Understanding what git status shows
├─ Comfortable with basic git commands
└─ Seeing git as project time-travel

🎯 ADVANCED GIT HABITS:
├─ Commits tell project story
├─ Logical grouping of related changes
├─ Detailed messages when needed
├─ Using git log to understand history
├─ Branching for experimental work
└─ Git as creative collaboration tool
```

---

**Next Steps**: [Cleanup Protocol](cleanup-protocol.md) | [Research Session](research-session.md) | [Navigation Hub](../README.md)