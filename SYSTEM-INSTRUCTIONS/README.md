# System Instructions - Terminal Renaissance Vault

*All guidance for agents, researchers, and contributors*

---

## 🎯 Purpose

This directory contains all system instructions, templates, and process documentation for the Terminal Renaissance project. **No project outputs should be stored here** - only guidance for creating and managing content.

---

## 📁 Directory Structure

### `/research/`
Research process and methodology instructions:
- `workflow-process.md` - Complete research workflow
- `research-session-checklist.md` - Discovery system checklist
- `templates/` - Research documentation templates

### `/writing/`
Content creation guidance:
- `feynman-voice/` - Modular Feynman voice guide
  - `core-principles.md` - Essential communication philosophy
  - `conversation-starters.md` - Authentic phrases and transitions
  - `technical-analogies.md` - Converting complex concepts
  - `character-portrayal.md` - Humanizing historical figures
  - `voice-checklist.md` - Quality assurance checklist
- `content-templates/` - Structural templates for different content types
- `output-formats/` - Specifications for different output formats

### `/production/`
Production and quality control:
- `narrator-guidelines.md` - Audio production guidance
- Quality control checklists
- Technical specifications

### `/project-management/`
Project organization and collaboration:
- Folder organization standards
- File naming conventions
- Collaboration guidelines

### `/api-cost-management/`
Cost control and budget management:
- `cost-control-protocol.md` - Complete cost control requirements
- `local-vs-remote-decision-matrix.md` - When to use local vs GitHub Actions

### `/github-actions/`
GitHub Actions automation (COST CONTROLLED):
- `workflow-approval-process.md` - Mandatory approval process for GitHub Actions
- Cost warnings and approval requirements

### `/local-swarm/`
Local parallel processing (COST-FREE ALTERNATIVE):
- `git-worktree-setup.md` - Git worktree setup for parallel work
- `parallel-processing-guide.md` - Multi-Claude coordination

### `/safety/`
Cost monitoring and emergency procedures:
- `api-usage-safeguards.md` - Cost monitoring and emergency protocols

### `/quick-reference/`
Quick reference materials:
- `cost-control-checklist.md` - One-page cost decision reference

---

## 🚀 Quick Start for New Contributors

### 1. Read Core Principles
Start with `/writing/feynman-voice/core-principles.md` to understand the project's communication philosophy.

### 2. Review Cost Control FIRST
**MANDATORY**: Read `/api-cost-management/cost-control-protocol.md` and `/quick-reference/cost-control-checklist.md` before any work involving API calls or automation.

### 3. Review Workflow
Read `/research/workflow-process.md` to understand the research and writing process.

### 4. Choose Your Processing Method
- **Local Processing (FREE)**: Use `/local-swarm/` guides for parallel work
- **GitHub Actions (COST CONTROLLED)**: Only after approval via `/github-actions/workflow-approval-process.md`

### 5. Use Templates
All templates are in their respective directories. Copy, don't edit the originals.

### 6. Follow Checklists
Use the quality checklists AND cost control checklist before submitting any content.

---

## 🔄 Relationship to PROJECT-OUTPUTS

- **SYSTEM-INSTRUCTIONS**: How to do the work
- **PROJECT-OUTPUTS**: The work itself

Never mix these! Instructions stay here, outputs go in PROJECT-OUTPUTS.

---

## 📋 Maintenance

### Adding New Instructions
- Create focused, modular files
- Use clear, descriptive filenames
- Include purpose and usage guidance
- **Include cost impact assessment for any automation**
- Update this README when adding new sections

### Updating Existing Instructions
- Maintain backward compatibility when possible
- Update related files when making changes
- Test instructions with actual use cases
- **Review cost implications of any workflow changes**
- Document changes in relevant files

### Cost Control Maintenance
- Regularly review and update cost thresholds in `/api-cost-management/`
- Monitor usage patterns and adjust decision matrices
- Update local alternatives as new capabilities emerge
- Test emergency protocols in `/safety/` directory

---

*Remember: These instructions should help people create better content more efficiently while maintaining strict cost control. Always choose the most cost-effective method and prioritize local alternatives. Keep instructions clear, focused, and useful.*